/* tdate_parse - parse string dates into internal form, stripped-down version
**
** Copyright � 1995 by Jef Poskanzer <jef@mail.acme.com>.
** All rights reserved.
**
** Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions
** are met:
** 1. Redistributions of source code must retain the above copyright
**    notice, this list of conditions and the following disclaimer.
** 2. Redistributions in binary form must reproduce the above copyright
**    notice, this list of conditions and the following disclaimer in the
**    documentation and/or other materials provided with the distribution.
**
** THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
** ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
** IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
** ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
** FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
** DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
** OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
** HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
** LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
** OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
** SUCH DAMAGE.
*/

/* This is a stripped-down version of date_parse.c, available at
** http://www.acme.com/software/date_parse/
*/

#include <sys/types.h>

#include <ctype.h>
#ifdef HAVE_MEMORY_H
#include <memory.h>
#endif
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#include "tdate_parse.h"

#pragma CHECKED_SCOPE on

struct strlong {
    char *s : itype(_Nt_array_ptr<char>);
    long l;
    };


_Checked static void
pound_case(char *_str : itype(_Nt_array_ptr<char>))
    {
    _Nt_array_ptr<char> str = _str;
    for ( ; *str != '\0'; ++str )
	{
        char c = *str;
        char isupper_c = 0;
        _Unchecked { isupper_c = isupper((int) c); }
	if ( isupper_c )
            {
            char lower = 0;
            _Unchecked { lower = tolower(c); };
            *str = lower;
            }
	}
    }


_Checked static int
__strlong_compare( _Ptr<const struct strlong> v1, _Ptr<const struct strlong> v2 )
    {
    return strcmp( v1->s, v2->s );
    }
#pragma CHECKED_SCOPE off
int ((*strlong_compare)(const void*, const void*)) : itype(_Ptr<int (_Ptr<const void>, _Ptr<const void>)>) = (int (*)(const void *, const void *)) __strlong_compare;
#pragma CHECKED_SCOPE on

_Checked static int
strlong_search(char *str : itype(_Nt_array_ptr<char>), struct strlong *tab : itype(_Array_ptr<struct strlong>) count(n), int n, long *lP : itype(_Ptr<long>))
    {
    int i, h, l, r;

    l = 0;
    h = n - 1;
    for (;;)
	{
	i = ( h + l ) / 2;
	r = strcmp( str, tab[i].s );
	if ( r < 0 )
	    h = i - 1;
	else if ( r > 0 )
	    l = i + 1;
	else
	    {
	    *lP = tab[i].l;
	    return 1;
	    }
	if ( h < l )
	    return 0;
	}
    }


_Checked static int
scan_wday(char *str_wday : itype(_Nt_array_ptr<char>), long *tm_wdayP : itype(_Ptr<long>))
    {
    static struct strlong wday_tab _Checked[] = {
	{ "sun", 0 }, { "sunday", 0 },
	{ "mon", 1 }, { "monday", 1 },
	{ "tue", 2 }, { "tuesday", 2 },
	{ "wed", 3 }, { "wednesday", 3 },
	{ "thu", 4 }, { "thursday", 4 },
	{ "fri", 5 }, { "friday", 5 },
	{ "sat", 6 }, { "saturday", 6 },
	};
    static int sorted = 0;

    if ( ! sorted )
	{
	(void) qsort(
	    (_Array_ptr<void>) wday_tab, sizeof(wday_tab)/sizeof(struct strlong),
	    sizeof(struct strlong), strlong_compare );
	sorted = 1;
	}
    pound_case( str_wday );
    return strlong_search(
	str_wday, wday_tab, sizeof(wday_tab)/sizeof(struct strlong), tm_wdayP );
    }


_Checked static int
scan_mon(char *str_mon : itype(_Nt_array_ptr<char>), long *tm_monP : itype(_Ptr<long>))
    {
    static struct strlong mon_tab _Checked[] = {
	{ "jan", 0 }, { "january", 0 },
	{ "feb", 1 }, { "february", 1 },
	{ "mar", 2 }, { "march", 2 },
	{ "apr", 3 }, { "april", 3 },
	{ "may", 4 },
	{ "jun", 5 }, { "june", 5 },
	{ "jul", 6 }, { "july", 6 },
	{ "aug", 7 }, { "august", 7 },
	{ "sep", 8 }, { "september", 8 },
	{ "oct", 9 }, { "october", 9 },
	{ "nov", 10 }, { "november", 10 },
	{ "dec", 11 }, { "december", 11 },
	};
    static int sorted = 0;

    if ( ! sorted )
	{
	(void) qsort(
	    (_Array_ptr<void>) mon_tab, sizeof(mon_tab)/sizeof(struct strlong),
	    sizeof(struct strlong), strlong_compare );
	sorted = 1;
	}
    pound_case( str_mon );
    return strlong_search(
	str_mon, mon_tab, sizeof(mon_tab)/sizeof(struct strlong), tm_monP );
    }


_Checked static int
is_leap( int year )
    {
    return year % 400? ( year % 100 ? ( year % 4 ? 0 : 1 ) : 0 ) : 1;
    }


/* Basically the same as mktime(). */
_Checked static time_t
tm_to_time(struct tm *tmP : itype(_Ptr<struct tm>))
    {
    time_t t;
    static int monthtab _Checked[12] = {
	0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334 };

    /* Years since epoch, converted to days. */
    t = ( tmP->tm_year - 70 ) * 365;
    /* Leap days for previous years - this will break in 2100! */
    t += ( tmP->tm_year - 69 ) / 4;
    /* Days for the beginning of this month. */
    t += monthtab[tmP->tm_mon];
    /* Leap day for this year. */
    if ( tmP->tm_mon >= 2 && is_leap( tmP->tm_year + 1900 ) )
	++t;
    /* Days since the beginning of this month. */
    t += tmP->tm_mday - 1;	/* 1-based field */
    /* Hours, minutes, and seconds. */
    t = t * 24 + tmP->tm_hour;
    t = t * 60 + tmP->tm_min;
    t = t * 60 + tmP->tm_sec;

    return t;
    }


time_t
tdate_parse(char *str : itype(_Nt_array_ptr<char>))
    {
    struct tm tm;
    _Nt_array_ptr<char> cp = ((void *)0);
    char str_mon _Nt_checked[500];
char str_wday _Nt_checked[500];

    int tm_sec, tm_min, tm_hour, tm_mday, tm_year;
    long tm_mon, tm_wday;
    time_t t;

    /* Initialize. */
    (void) memset( &tm, 0, sizeof(struct tm) );

    /* Skip initial whitespace ourselves - sscanf is clumsy at this. */
    for ( cp = str; *cp == ' ' || *cp == '\t'; ++cp )
	continue;

    /* And do the sscanfs.  WARNING: you can add more formats here,
    ** but be careful!  You can easily screw up the parsing of existing
    ** formats when you add new ones.  The order is important.
    */
    _Unchecked {

    /* DD-mth-YY HH:MM:SS GMT */
    if ( sscanf( cp, "%d-%400[a-zA-Z]-%d %d:%d:%d GMT",
		&tm_mday, str_mon, &tm_year, &tm_hour, &tm_min,
		&tm_sec ) == 6 &&
	    scan_mon( str_mon, &tm_mon ) )
	{
	tm.tm_mday = tm_mday;
	tm.tm_mon = tm_mon;
	tm.tm_year = tm_year;
	tm.tm_hour = tm_hour;
	tm.tm_min = tm_min;
	tm.tm_sec = tm_sec;
	}

    /* DD mth YY HH:MM:SS GMT */
    else if ( sscanf( cp, "%d %400[a-zA-Z] %d %d:%d:%d GMT",
		&tm_mday, str_mon, &tm_year, &tm_hour, &tm_min,
		&tm_sec) == 6 &&
	    scan_mon( str_mon, &tm_mon ) )
	{
	tm.tm_mday = tm_mday;
	tm.tm_mon = tm_mon;
	tm.tm_year = tm_year;
	tm.tm_hour = tm_hour;
	tm.tm_min = tm_min;
	tm.tm_sec = tm_sec;
	}

    /* HH:MM:SS GMT DD-mth-YY */
    else if ( sscanf( cp, "%d:%d:%d GMT %d-%400[a-zA-Z]-%d",
		&tm_hour, &tm_min, &tm_sec, &tm_mday, str_mon,
		&tm_year ) == 6 &&
	    scan_mon( str_mon, &tm_mon ) )
	{
	tm.tm_hour = tm_hour;
	tm.tm_min = tm_min;
	tm.tm_sec = tm_sec;
	tm.tm_mday = tm_mday;
	tm.tm_mon = tm_mon;
	tm.tm_year = tm_year;
	}

    /* HH:MM:SS GMT DD mth YY */
    else if ( sscanf( cp, "%d:%d:%d GMT %d %400[a-zA-Z] %d",
		&tm_hour, &tm_min, &tm_sec, &tm_mday, str_mon,
		&tm_year ) == 6 &&
	    scan_mon( str_mon, &tm_mon ) )
	{
	tm.tm_hour = tm_hour;
	tm.tm_min = tm_min;
	tm.tm_sec = tm_sec;
	tm.tm_mday = tm_mday;
	tm.tm_mon = tm_mon;
	tm.tm_year = tm_year;
	}

    /* wdy, DD-mth-YY HH:MM:SS GMT */
    else if ( sscanf( cp, "%400[a-zA-Z], %d-%400[a-zA-Z]-%d %d:%d:%d GMT",
		str_wday, &tm_mday, str_mon, &tm_year, &tm_hour, &tm_min,
		&tm_sec ) == 7 &&
	    scan_wday( str_wday, &tm_wday ) &&
	    scan_mon( str_mon, &tm_mon ) )
	{
	tm.tm_wday = tm_wday;
	tm.tm_mday = tm_mday;
	tm.tm_mon = tm_mon;
	tm.tm_year = tm_year;
	tm.tm_hour = tm_hour;
	tm.tm_min = tm_min;
	tm.tm_sec = tm_sec;
	}

    /* wdy, DD mth YY HH:MM:SS GMT */
    else if ( sscanf( cp, "%400[a-zA-Z], %d %400[a-zA-Z] %d %d:%d:%d GMT",
		str_wday, &tm_mday, str_mon, &tm_year, &tm_hour, &tm_min,
		&tm_sec ) == 7 &&
	    scan_wday( str_wday, &tm_wday ) &&
	    scan_mon( str_mon, &tm_mon ) )
	{
	tm.tm_wday = tm_wday;
	tm.tm_mday = tm_mday;
	tm.tm_mon = tm_mon;
	tm.tm_year = tm_year;
	tm.tm_hour = tm_hour;
	tm.tm_min = tm_min;
	tm.tm_sec = tm_sec;
	}

    /* wdy mth DD HH:MM:SS GMT YY */
    else if ( sscanf( cp, "%400[a-zA-Z] %400[a-zA-Z] %d %d:%d:%d GMT %d",
		str_wday, str_mon, &tm_mday, &tm_hour, &tm_min, &tm_sec,
		&tm_year ) == 7 &&
	    scan_wday( str_wday, &tm_wday ) &&
	    scan_mon( str_mon, &tm_mon ) )
	{
	tm.tm_wday = tm_wday;
	tm.tm_mon = tm_mon;
	tm.tm_mday = tm_mday;
	tm.tm_hour = tm_hour;
	tm.tm_min = tm_min;
	tm.tm_sec = tm_sec;
	tm.tm_year = tm_year;
	}
    else
	return (time_t) -1;
    }

    if ( tm.tm_year > 1900 )
	tm.tm_year -= 1900;
    else if ( tm.tm_year < 70 )
	tm.tm_year += 100;

    t = tm_to_time( &tm );

    return t;
    }
