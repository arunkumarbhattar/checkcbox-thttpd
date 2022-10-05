; ModuleID = 'libhttpd.c'
source_filename = "libhttpd.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.httpd_server = type { i8*, i8*, i16, i8*, i32, i32, i8*, i8*, i32, i8*, i32, i32, i32, %struct._IO_FILE*, i32, i32, i32, i8*, i8*, i32 }
%union.httpd_sockaddr = type { %struct.sockaddr_storage }
%struct.sockaddr_storage = type { i16, [118 x i8], i64 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.sockaddr = type { i16, [14 x i8] }
%struct.httpd_conn = type { i32, %struct.httpd_server*, %union.httpd_sockaddr, i8*, i64, i64, i64, i32, i32, i32, i64, i64, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i8*, i8*, i32, i32, i32, i32, i64, i64, i32, i32, %struct.stat, i32, i8* }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.strbuf = type { i8*, i64 }
%struct.timeval = type { i64, i64 }
%struct.mime_entry = type { i8*, i64, i8*, i64 }

@.str.10 = private unnamed_addr constant [12 x i8] c"Bad Request\00", align 1
@httpd_err400title = dso_local local_unnamed_addr global i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.10, i64 0, i64 0), align 8
@.str.11 = private unnamed_addr constant [69 x i8] c"Your request has bad syntax or is inherently impossible to satisfy.\0A\00", align 1
@httpd_err400form = dso_local local_unnamed_addr global i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.11, i64 0, i64 0), align 8
@.str.12 = private unnamed_addr constant [16 x i8] c"Request Timeout\00", align 1
@httpd_err408title = dso_local local_unnamed_addr global i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.12, i64 0, i64 0), align 8
@.str.13 = private unnamed_addr constant [54 x i8] c"No request appeared within a reasonable time period.\0A\00", align 1
@httpd_err408form = dso_local local_unnamed_addr global i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.13, i64 0, i64 0), align 8
@.str.14 = private unnamed_addr constant [31 x i8] c"Service Temporarily Overloaded\00", align 1
@httpd_err503title = dso_local local_unnamed_addr global i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.14, i64 0, i64 0), align 8
@.str.15 = private unnamed_addr constant [79 x i8] c"The requested URL '%.80s' is temporarily overloaded.  Please try again later.\0A\00", align 1
@httpd_err503form = dso_local local_unnamed_addr global i8* getelementptr inbounds ([79 x i8], [79 x i8]* @.str.15, i64 0, i64 0), align 8
@str_alloc_size = internal unnamed_addr global i64 0, align 8
@.str.20 = private unnamed_addr constant [4 x i8] c"GET\00", align 1
@.str.21 = private unnamed_addr constant [5 x i8] c"HEAD\00", align 1
@.str.22 = private unnamed_addr constant [5 x i8] c"POST\00", align 1
@.str.23 = private unnamed_addr constant [4 x i8] c"PUT\00", align 1
@.str.24 = private unnamed_addr constant [7 x i8] c"DELETE\00", align 1
@.str.25 = private unnamed_addr constant [6 x i8] c"TRACE\00", align 1
@.str.26 = private unnamed_addr constant [8 x i8] c"UNKNOWN\00", align 1
@ext_compare = dso_local local_unnamed_addr global i32 (i8*, i8*)* bitcast (i32 (%struct.mime_entry*, %struct.mime_entry*)* @__ext_compare to i32 (i8*, i8*)*), align 8
@name_compare = dso_local local_unnamed_addr global i32 (i8*, i8*)* bitcast (i32 (i8**, i8**)* @__name_compare to i32 (i8*, i8*)*), align 8
@httpd_ntoa.str = internal global [200 x i8] zeroinitializer, align 16
@switch.table.httpd_method_str = private unnamed_addr constant [6 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.21, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.22, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.24, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.25, i64 0, i64 0)], align 8

; Function Attrs: noreturn nounwind readonly uwtable willreturn
define dso_local noalias nonnull i8* @ol_strcpy(i8* nocapture readnone %dst, i8* nocapture readonly %src) local_unnamed_addr #0 {
entry:
  unreachable
}

; Function Attrs: nounwind uwtable
define dso_local noalias %struct.httpd_server* @httpd_initialize(i8* readonly %hostname, %union.httpd_sockaddr* %sa4P, %union.httpd_sockaddr* %sa6P, i16 zeroext %port, i8* readonly %_cgi_pattern, i32 %cgi_limit, i8* nocapture readonly %charset, i8* nocapture readnone %p3p, i32 %max_age, i8* nocapture readnone %cwd, i32 %no_log, %struct._IO_FILE* %logfp, i32 %no_symlink_check, i32 %vhost, i32 %global_passwd, i8* readonly %url_pattern, i8* readonly %local_pattern, i32 %no_empty_referrers) local_unnamed_addr #1 {
entry:
  unreachable
}

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #2

; Function Attrs: nounwind uwtable
define dso_local void @httpd_set_logfp(%struct.httpd_server* %hs, %struct._IO_FILE* %logfp) local_unnamed_addr #1 {
entry:
  %_Dynamic_check.non_null.not = icmp eq %struct.httpd_server* %hs, null
  br i1 %_Dynamic_check.non_null.not, label %_Dynamic_check.failed, label %_Dynamic_check.succeeded

_Dynamic_check.succeeded:                         ; preds = %entry
  %logfp1 = getelementptr inbounds %struct.httpd_server, %struct.httpd_server* %hs, i64 0, i32 13
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %logfp1, align 8, !tbaa !2
  %cmp.not = icmp eq %struct._IO_FILE* %0, null
  br i1 %cmp.not, label %_Dynamic_check.succeeded8, label %_Dynamic_check.succeeded4

_Dynamic_check.succeeded4:                        ; preds = %_Dynamic_check.succeeded
  %call = tail call i32 @fclose(%struct._IO_FILE* nonnull %0)
  unreachable

_Dynamic_check.failed:                            ; preds = %entry
  tail call void @llvm.trap() #10
  unreachable

_Dynamic_check.succeeded8:                        ; preds = %_Dynamic_check.succeeded
  store %struct._IO_FILE* %logfp, %struct._IO_FILE** %logfp1, align 8, !tbaa !2
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local i8* @httpd_ntoa(%union.httpd_sockaddr* %saP) local_unnamed_addr #1 {
entry:
  %sa = bitcast %union.httpd_sockaddr* %saP to %struct.sockaddr*
  %call = tail call fastcc i64 @sockaddr_len(%union.httpd_sockaddr* %saP)
  %conv = trunc i64 %call to i32
  %call1 = tail call i32 @getnameinfo(%struct.sockaddr* %sa, i32 %conv, i8* getelementptr inbounds ([200 x i8], [200 x i8]* @httpd_ntoa.str, i64 0, i64 0), i32 199, i8* null, i32 0, i32 1) #11
  unreachable
}

; Function Attrs: nofree noreturn nounwind
declare dso_local noundef i32 @fclose(%struct._IO_FILE* nocapture noundef) local_unnamed_addr #3

; Function Attrs: noreturn nounwind uwtable
define dso_local void @httpd_terminate(%struct.httpd_server* readonly %hs) local_unnamed_addr #4 {
entry:
  %_Dynamic_check.non_null.not.i = icmp eq %struct.httpd_server* %hs, null
  br i1 %_Dynamic_check.non_null.not.i, label %_Dynamic_check.failed.i, label %_Dynamic_check.succeeded.i

_Dynamic_check.succeeded.i:                       ; preds = %entry
  %listen4_fd.i = getelementptr inbounds %struct.httpd_server, %struct.httpd_server* %hs, i64 0, i32 10
  %0 = load i32, i32* %listen4_fd.i, align 8, !tbaa !6
  %cmp.not.i = icmp eq i32 %0, -1
  br i1 %cmp.not.i, label %_Dynamic_check.succeeded11.i, label %_Dynamic_check.succeeded3.i

_Dynamic_check.succeeded3.i:                      ; preds = %_Dynamic_check.succeeded.i
  %call.i = tail call i32 @close(i32 %0) #11
  unreachable

_Dynamic_check.failed.i:                          ; preds = %entry
  tail call void @llvm.trap() #10
  unreachable

_Dynamic_check.succeeded11.i:                     ; preds = %_Dynamic_check.succeeded.i
  %listen6_fd.i = getelementptr inbounds %struct.httpd_server, %struct.httpd_server* %hs, i64 0, i32 11
  %1 = load i32, i32* %listen6_fd.i, align 4, !tbaa !10
  %cmp12.not.i = icmp eq i32 %1, -1
  br i1 %cmp12.not.i, label %_Dynamic_check.succeeded, label %_Dynamic_check.succeeded16.i

_Dynamic_check.succeeded16.i:                     ; preds = %_Dynamic_check.succeeded11.i
  %call18.i = tail call i32 @close(i32 %1) #11
  unreachable

_Dynamic_check.succeeded:                         ; preds = %_Dynamic_check.succeeded11.i
  %logfp = getelementptr inbounds %struct.httpd_server, %struct.httpd_server* %hs, i64 0, i32 13
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %logfp, align 8, !tbaa !2, !nonnull !11
  %call = tail call i32 @fclose(%struct._IO_FILE* nonnull %2)
  unreachable
}

; Function Attrs: nounwind uwtable
define dso_local void @httpd_unlisten(%struct.httpd_server* readonly %hs) local_unnamed_addr #1 {
entry:
  %_Dynamic_check.non_null.not = icmp eq %struct.httpd_server* %hs, null
  br i1 %_Dynamic_check.non_null.not, label %_Dynamic_check.failed, label %_Dynamic_check.succeeded

_Dynamic_check.succeeded:                         ; preds = %entry
  %listen4_fd = getelementptr inbounds %struct.httpd_server, %struct.httpd_server* %hs, i64 0, i32 10
  %0 = load i32, i32* %listen4_fd, align 8, !tbaa !6
  %cmp.not = icmp eq i32 %0, -1
  br i1 %cmp.not, label %_Dynamic_check.succeeded11, label %_Dynamic_check.succeeded3

_Dynamic_check.succeeded3:                        ; preds = %_Dynamic_check.succeeded
  %call = tail call i32 @close(i32 %0) #11
  unreachable

_Dynamic_check.failed:                            ; preds = %entry
  tail call void @llvm.trap() #10
  unreachable

_Dynamic_check.succeeded11:                       ; preds = %_Dynamic_check.succeeded
  %listen6_fd = getelementptr inbounds %struct.httpd_server, %struct.httpd_server* %hs, i64 0, i32 11
  %1 = load i32, i32* %listen6_fd, align 4, !tbaa !10
  %cmp12.not = icmp eq i32 %1, -1
  br i1 %cmp12.not, label %if.end23, label %_Dynamic_check.succeeded16

_Dynamic_check.succeeded16:                       ; preds = %_Dynamic_check.succeeded11
  %call18 = tail call i32 @close(i32 %1) #11
  unreachable

if.end23:                                         ; preds = %_Dynamic_check.succeeded11
  ret void
}

; Function Attrs: noreturn
declare dso_local i32 @close(i32) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @httpd_write_response(%struct.httpd_conn* %hc) local_unnamed_addr #1 {
entry:
  %_Dynamic_check.non_null1.not = icmp eq %struct.httpd_conn* %hc, null
  br i1 %_Dynamic_check.non_null1.not, label %_Dynamic_check.failed2, label %_Dynamic_check.succeeded3

_Dynamic_check.succeeded3:                        ; preds = %entry
  %responselen = getelementptr inbounds %struct.httpd_conn, %struct.httpd_conn* %hc, i64 0, i32 45
  %0 = load i64, i64* %responselen, align 8, !tbaa !12
  %cmp.not = icmp eq i64 %0, 0
  br i1 %cmp.not, label %if.end20, label %while.body.i

while.body.i:                                     ; preds = %_Dynamic_check.succeeded3
  %response = getelementptr inbounds %struct.httpd_conn, %struct.httpd_conn* %hc, i64 0, i32 32
  %1 = load i8*, i8** %response, align 8, !tbaa !2
  %_Dynamic_check.non_null.not.i = icmp eq i8* %1, null
  br i1 %_Dynamic_check.non_null.not.i, label %_Dynamic_check.failed.i, label %_Dynamic_check.success.i

_Dynamic_check.success.i:                         ; preds = %while.body.i
  %conn_fd8 = getelementptr inbounds %struct.httpd_conn, %struct.httpd_conn* %hc, i64 0, i32 60
  %2 = load i32, i32* %conn_fd8, align 8, !tbaa !17
  %call.i26 = tail call i64 @write(i32 %2, i8* nonnull %1, i64 %0) #11
  unreachable

_Dynamic_check.failed.i:                          ; preds = %while.body.i
  tail call void @llvm.trap() #10
  unreachable

_Dynamic_check.failed2:                           ; preds = %entry
  tail call void @llvm.trap() #10
  unreachable

if.end20:                                         ; preds = %_Dynamic_check.succeeded3
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @httpd_clear_ndelay(i32 %fd) local_unnamed_addr #1 {
entry:
  %call = tail call i32 (i32, i32, ...) @fcntl(i32 %fd, i32 3, i32 0) #11
  unreachable
}

; Function Attrs: nounwind uwtable
define dso_local i32 @httpd_write_fully(i32 %fd, i8* readonly %buf, i64 %nbytes) local_unnamed_addr #1 {
entry:
  %cmp.not = icmp eq i64 %nbytes, 0
  br i1 %cmp.not, label %while.end, label %while.body

while.body:                                       ; preds = %entry
  %_Dynamic_check.non_null.not = icmp eq i8* %buf, null
  br i1 %_Dynamic_check.non_null.not, label %_Dynamic_check.failed, label %_Dynamic_check.success

_Dynamic_check.success:                           ; preds = %while.body
  %call = tail call i64 @write(i32 %fd, i8* nonnull %buf, i64 %nbytes) #11
  unreachable

_Dynamic_check.failed:                            ; preds = %while.body
  tail call void @llvm.trap() #10
  unreachable

while.end:                                        ; preds = %entry
  ret i32 0
}

; Function Attrs: nounwind uwtable
define dso_local void @httpd_set_ndelay(i32 %fd) local_unnamed_addr #1 {
entry:
  %call = tail call i32 (i32, i32, ...) @fcntl(i32 %fd, i32 3, i32 0) #11
  unreachable
}

; Function Attrs: noreturn
declare dso_local i32 @fcntl(i32, i32, ...) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @httpd_realloc_str(i8** %strP, i64* %maxsizeP, i64 %size) local_unnamed_addr #1 {
entry:
  %_Dynamic_check.non_null.not = icmp eq i64* %maxsizeP, null
  br i1 %_Dynamic_check.non_null.not, label %_Dynamic_check.failed, label %_Dynamic_check.succeeded

_Dynamic_check.succeeded:                         ; preds = %entry
  %0 = load i64, i64* %maxsizeP, align 8, !tbaa !18
  %cmp = icmp eq i64 %0, 0
  br i1 %cmp, label %if.then, label %_Dynamic_check.succeeded19

if.then:                                          ; preds = %_Dynamic_check.succeeded
  %add = add i64 %size, 100
  %1 = icmp ugt i64 %add, 200
  %cond = select i1 %1, i64 %add, i64 200
  store i64 %cond, i64* %maxsizeP, align 8, !tbaa !18
  %add9 = add i64 %cond, 1
  %call = tail call i8* @malloc_nt(i64 %add9) #11
  unreachable

_Dynamic_check.failed:                            ; preds = %entry
  tail call void @llvm.trap() #10
  unreachable

_Dynamic_check.succeeded19:                       ; preds = %_Dynamic_check.succeeded
  %cmp20 = icmp ult i64 %0, %size
  br i1 %cmp20, label %_Dynamic_check.succeeded24, label %if.end68

_Dynamic_check.succeeded24:                       ; preds = %_Dynamic_check.succeeded19
  %2 = load i64, i64* @str_alloc_size, align 8, !tbaa !18
  %sub = sub i64 %2, %0
  store i64 %sub, i64* @str_alloc_size, align 8, !tbaa !18
  %mul = shl i64 %0, 1
  %mul28 = mul i64 %size, 5
  %div = lshr i64 %mul28, 2
  %cmp29 = icmp ugt i64 %mul, %div
  %cond39 = select i1 %cmp29, i64 %mul, i64 %div
  store i64 %cond39, i64* %maxsizeP, align 8, !tbaa !18
  %_Dynamic_check.non_null43.not = icmp eq i8** %strP, null
  br i1 %_Dynamic_check.non_null43.not, label %_Dynamic_check.failed44, label %_Dynamic_check.succeeded48

_Dynamic_check.succeeded48:                       ; preds = %_Dynamic_check.succeeded24
  %3 = load i8*, i8** %strP, align 8, !tbaa !2
  %add49 = add i64 %cond39, 1
  %call50 = tail call i8* @realloc_nt(i8* %3, i64 %add49) #11
  unreachable

_Dynamic_check.failed44:                          ; preds = %_Dynamic_check.succeeded24
  tail call void @llvm.trap() #10
  unreachable

if.end68:                                         ; preds = %_Dynamic_check.succeeded19
  ret void
}

; Function Attrs: noreturn
declare dso_local i8* @malloc_nt(i64) local_unnamed_addr #5

; Function Attrs: noreturn
declare dso_local i8* @realloc_nt(i8*, i64) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local i8* @httpd_realloc_strbuf(%struct.strbuf* %sbuf, i64 %size) local_unnamed_addr #1 {
entry:
  %_Dynamic_check.non_null.not = icmp eq %struct.strbuf* %sbuf, null
  br i1 %_Dynamic_check.non_null.not, label %_Dynamic_check.failed, label %_Dynamic_check.succeeded

_Dynamic_check.succeeded:                         ; preds = %entry
  %maxsize = getelementptr inbounds %struct.strbuf, %struct.strbuf* %sbuf, i64 0, i32 1
  %0 = load i64, i64* %maxsize, align 8, !tbaa !19
  %cmp = icmp eq i64 %0, 0
  br i1 %cmp, label %if.then, label %_Dynamic_check.succeeded21

if.then:                                          ; preds = %_Dynamic_check.succeeded
  %add = add i64 %size, 100
  %1 = icmp ugt i64 %add, 200
  %cond = select i1 %1, i64 %add, i64 200
  store i64 %cond, i64* %maxsize, align 8, !tbaa !19
  %call = tail call i8* @malloc_nt(i64 %cond) #11
  unreachable

_Dynamic_check.failed:                            ; preds = %entry
  tail call void @llvm.trap() #10
  unreachable

_Dynamic_check.succeeded21:                       ; preds = %_Dynamic_check.succeeded
  %cmp23 = icmp ult i64 %0, %size
  br i1 %cmp23, label %_Dynamic_check.succeeded27, label %_Dynamic_check.succeeded72

_Dynamic_check.succeeded27:                       ; preds = %_Dynamic_check.succeeded21
  %2 = load i64, i64* @str_alloc_size, align 8, !tbaa !18
  %sub = sub i64 %2, %0
  store i64 %sub, i64* @str_alloc_size, align 8, !tbaa !18
  %mul = shl i64 %0, 1
  %mul34 = mul i64 %size, 5
  %div = lshr i64 %mul34, 2
  %cmp35 = icmp ugt i64 %mul, %div
  %cond46 = select i1 %cmp35, i64 %mul, i64 %div
  store i64 %cond46, i64* %maxsize, align 8, !tbaa !19
  %str54 = getelementptr inbounds %struct.strbuf, %struct.strbuf* %sbuf, i64 0, i32 0
  %3 = load i8*, i8** %str54, align 8, !tbaa !21
  %call55 = tail call i8* @realloc_nt(i8* %3, i64 %cond46) #11
  unreachable

_Dynamic_check.succeeded72:                       ; preds = %_Dynamic_check.succeeded21
  %str73 = getelementptr inbounds %struct.strbuf, %struct.strbuf* %sbuf, i64 0, i32 0
  %4 = load i8*, i8** %str73, align 8, !tbaa !21
  ret i8* %4
}

; Function Attrs: noreturn nounwind uwtable
define dso_local void @httpd_send_err(%struct.httpd_conn* nocapture readonly %hc, i32 %status, i8* nocapture readnone %title, i8* nocapture readnone %extraheads, i8* nocapture readnone %form, i8* nocapture readnone %arg) local_unnamed_addr #4 {
entry:
  unreachable
}

; Function Attrs: norecurse nounwind readnone uwtable willreturn
define dso_local i8* @httpd_method_str(i32 %method) local_unnamed_addr #6 {
entry:
  %switch.tableidx = add i32 %method, -1
  %0 = icmp ult i32 %switch.tableidx, 6
  br i1 %0, label %switch.lookup, label %return

switch.lookup:                                    ; preds = %entry
  %1 = sext i32 %switch.tableidx to i64
  %switch.gep = getelementptr inbounds [6 x i8*], [6 x i8*]* @switch.table.httpd_method_str, i64 0, i64 %1
  %switch.load = load i8*, i8** %switch.gep, align 8
  ret i8* %switch.load

return:                                           ; preds = %entry
  ret i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.26, i64 0, i64 0)
}

; Function Attrs: noreturn nounwind uwtable
define dso_local i32 @httpd_get_conn(%struct.httpd_server* nocapture readnone %hs, i32 %listen_fd, %struct.httpd_conn* %hc) local_unnamed_addr #4 {
entry:
  unreachable
}

; Function Attrs: nounwind uwtable
define internal fastcc i64 @sockaddr_len(%union.httpd_sockaddr* readonly %saP) unnamed_addr #1 {
entry:
  %_Dynamic_check.non_null.not = icmp eq %union.httpd_sockaddr* %saP, null
  br i1 %_Dynamic_check.non_null.not, label %_Dynamic_check.failed, label %_Dynamic_check.succeeded

_Dynamic_check.succeeded:                         ; preds = %entry
  %sa_family = getelementptr %union.httpd_sockaddr, %union.httpd_sockaddr* %saP, i64 0, i32 0, i32 0
  %0 = load i16, i16* %sa_family, align 8, !tbaa !22
  %switch.selectcmp = icmp eq i16 %0, 10
  %switch.select = select i1 %switch.selectcmp, i64 28, i64 0
  %switch.selectcmp2 = icmp eq i16 %0, 2
  %switch.select3 = select i1 %switch.selectcmp2, i64 16, i64 %switch.select
  ret i64 %switch.select3

_Dynamic_check.failed:                            ; preds = %entry
  tail call void @llvm.trap() #10
  unreachable
}

; Function Attrs: nounwind uwtable
define dso_local i32 @httpd_got_request(%struct.httpd_conn* %hc) local_unnamed_addr #1 {
entry:
  %_Dynamic_check.non_null.not = icmp eq %struct.httpd_conn* %hc, null
  br i1 %_Dynamic_check.non_null.not, label %_Dynamic_check.failed, label %_Dynamic_check.succeeded.lr.ph

_Dynamic_check.succeeded.lr.ph:                   ; preds = %entry
  %checked_idx = getelementptr inbounds %struct.httpd_conn, %struct.httpd_conn* %hc, i64 0, i32 6
  %read_idx = getelementptr inbounds %struct.httpd_conn, %struct.httpd_conn* %hc, i64 0, i32 5
  %0 = load i64, i64* %read_idx, align 8, !tbaa !23
  %read_buf = getelementptr inbounds %struct.httpd_conn, %struct.httpd_conn* %hc, i64 0, i32 3
  %read_size = getelementptr inbounds %struct.httpd_conn, %struct.httpd_conn* %hc, i64 0, i32 4
  %checked_state = getelementptr inbounds %struct.httpd_conn, %struct.httpd_conn* %hc, i64 0, i32 7
  %.pre = load i64, i64* %checked_idx, align 8, !tbaa !24
  %cmp221 = icmp ult i64 %.pre, %0
  br i1 %cmp221, label %_Dynamic_check.succeeded6.preheader, label %cleanup

_Dynamic_check.succeeded6.preheader:              ; preds = %_Dynamic_check.succeeded.lr.ph
  %1 = load i8*, i8** %read_buf, align 8, !tbaa !2
  %_Dynamic_check.non_null11.not = icmp eq i8* %1, null
  br label %_Dynamic_check.succeeded6

_Dynamic_check.succeeded6:                        ; preds = %_Dynamic_check.succeeded6.preheader, %_Dynamic_check.succeeded175
  %2 = phi i64 [ %inc, %_Dynamic_check.succeeded175 ], [ %.pre, %_Dynamic_check.succeeded6.preheader ]
  br i1 %_Dynamic_check.non_null11.not, label %_Dynamic_check.failed12, label %_Dynamic_check.succeeded13

_Dynamic_check.succeeded13:                       ; preds = %_Dynamic_check.succeeded6
  %3 = load i64, i64* %read_size, align 8, !tbaa !25
  %_Dynamic_check.lower = icmp sgt i64 %2, -1
  %_Dynamic_check.upper = icmp sle i64 %2, %3
  %_Dynamic_check.range = and i1 %_Dynamic_check.lower, %_Dynamic_check.upper
  br i1 %_Dynamic_check.range, label %_Dynamic_check.succeeded20, label %_Dynamic_check.failed19

_Dynamic_check.succeeded20:                       ; preds = %_Dynamic_check.succeeded13
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 %2
  %4 = load i8, i8* %arrayidx, align 1, !tbaa !22
  %5 = load i32, i32* %checked_state, align 8, !tbaa !26
  switch i32 %5, label %_Dynamic_check.succeeded175 [
    i32 0, label %sw.bb
    i32 1, label %sw.bb34
    i32 2, label %sw.bb47
    i32 3, label %sw.bb56
    i32 4, label %sw.bb70
    i32 5, label %sw.bb88
    i32 6, label %sw.bb107
    i32 7, label %sw.bb120
    i32 8, label %sw.bb134
    i32 9, label %sw.bb148
    i32 10, label %sw.bb162
    i32 11, label %cleanup
  ]

_Dynamic_check.failed:                            ; preds = %entry
  tail call void @llvm.trap() #10
  unreachable

_Dynamic_check.failed12:                          ; preds = %_Dynamic_check.succeeded6
  tail call void @llvm.trap() #10
  unreachable

_Dynamic_check.failed19:                          ; preds = %_Dynamic_check.succeeded13
  tail call void @llvm.trap() #10
  unreachable

sw.bb:                                            ; preds = %_Dynamic_check.succeeded20
  %conv = sext i8 %4 to i32
  switch i32 %conv, label %_Dynamic_check.succeeded175 [
    i32 32, label %_Dynamic_check.succeeded27
    i32 9, label %_Dynamic_check.succeeded27
    i32 10, label %_Dynamic_check.succeeded32
    i32 13, label %_Dynamic_check.succeeded32
  ]

_Dynamic_check.succeeded27:                       ; preds = %sw.bb, %sw.bb
  store i32 1, i32* %checked_state, align 8, !tbaa !26
  br label %_Dynamic_check.succeeded175

_Dynamic_check.succeeded32:                       ; preds = %sw.bb, %sw.bb
  store i32 11, i32* %checked_state, align 8, !tbaa !26
  br label %cleanup

sw.bb34:                                          ; preds = %_Dynamic_check.succeeded20
  %conv35 = sext i8 %4 to i32
  switch i32 %conv35, label %_Dynamic_check.succeeded44 [
    i32 32, label %_Dynamic_check.succeeded175
    i32 9, label %_Dynamic_check.succeeded175
    i32 10, label %_Dynamic_check.succeeded40
    i32 13, label %_Dynamic_check.succeeded40
  ]

_Dynamic_check.succeeded40:                       ; preds = %sw.bb34, %sw.bb34
  store i32 11, i32* %checked_state, align 8, !tbaa !26
  br label %cleanup

_Dynamic_check.succeeded44:                       ; preds = %sw.bb34
  store i32 2, i32* %checked_state, align 8, !tbaa !26
  br label %_Dynamic_check.succeeded175

sw.bb47:                                          ; preds = %_Dynamic_check.succeeded20
  %conv48 = sext i8 %4 to i32
  switch i32 %conv48, label %_Dynamic_check.succeeded175 [
    i32 32, label %_Dynamic_check.succeeded52
    i32 9, label %_Dynamic_check.succeeded52
    i32 10, label %cleanup
    i32 13, label %cleanup
  ]

_Dynamic_check.succeeded52:                       ; preds = %sw.bb47, %sw.bb47
  store i32 3, i32* %checked_state, align 8, !tbaa !26
  br label %_Dynamic_check.succeeded175

sw.bb56:                                          ; preds = %_Dynamic_check.succeeded20
  %conv57 = sext i8 %4 to i32
  switch i32 %conv57, label %_Dynamic_check.succeeded67 [
    i32 32, label %_Dynamic_check.succeeded175
    i32 9, label %_Dynamic_check.succeeded175
    i32 10, label %_Dynamic_check.succeeded62
    i32 13, label %_Dynamic_check.succeeded62
  ]

_Dynamic_check.succeeded62:                       ; preds = %sw.bb56, %sw.bb56
  store i32 11, i32* %checked_state, align 8, !tbaa !26
  br label %cleanup

_Dynamic_check.succeeded67:                       ; preds = %sw.bb56
  store i32 4, i32* %checked_state, align 8, !tbaa !26
  br label %_Dynamic_check.succeeded175

sw.bb70:                                          ; preds = %_Dynamic_check.succeeded20
  %conv71 = sext i8 %4 to i32
  switch i32 %conv71, label %_Dynamic_check.succeeded175 [
    i32 32, label %_Dynamic_check.succeeded75
    i32 9, label %_Dynamic_check.succeeded75
    i32 10, label %_Dynamic_check.succeeded80
    i32 13, label %_Dynamic_check.succeeded85
  ]

_Dynamic_check.succeeded75:                       ; preds = %sw.bb70, %sw.bb70
  store i32 5, i32* %checked_state, align 8, !tbaa !26
  br label %_Dynamic_check.succeeded175

_Dynamic_check.succeeded80:                       ; preds = %sw.bb70
  store i32 7, i32* %checked_state, align 8, !tbaa !26
  br label %_Dynamic_check.succeeded175

_Dynamic_check.succeeded85:                       ; preds = %sw.bb70
  store i32 8, i32* %checked_state, align 8, !tbaa !26
  br label %_Dynamic_check.succeeded175

sw.bb88:                                          ; preds = %_Dynamic_check.succeeded20
  %conv89 = sext i8 %4 to i32
  switch i32 %conv89, label %_Dynamic_check.succeeded104 [
    i32 32, label %_Dynamic_check.succeeded175
    i32 9, label %_Dynamic_check.succeeded175
    i32 10, label %_Dynamic_check.succeeded94
    i32 13, label %_Dynamic_check.succeeded99
  ]

_Dynamic_check.succeeded94:                       ; preds = %sw.bb88
  store i32 7, i32* %checked_state, align 8, !tbaa !26
  br label %_Dynamic_check.succeeded175

_Dynamic_check.succeeded99:                       ; preds = %sw.bb88
  store i32 8, i32* %checked_state, align 8, !tbaa !26
  br label %_Dynamic_check.succeeded175

_Dynamic_check.succeeded104:                      ; preds = %sw.bb88
  store i32 11, i32* %checked_state, align 8, !tbaa !26
  br label %cleanup

sw.bb107:                                         ; preds = %_Dynamic_check.succeeded20
  %conv108 = sext i8 %4 to i32
  switch i32 %conv108, label %_Dynamic_check.succeeded175 [
    i32 10, label %_Dynamic_check.succeeded112
    i32 13, label %_Dynamic_check.succeeded117
  ]

_Dynamic_check.succeeded112:                      ; preds = %sw.bb107
  store i32 7, i32* %checked_state, align 8, !tbaa !26
  br label %_Dynamic_check.succeeded175

_Dynamic_check.succeeded117:                      ; preds = %sw.bb107
  store i32 8, i32* %checked_state, align 8, !tbaa !26
  br label %_Dynamic_check.succeeded175

sw.bb120:                                         ; preds = %_Dynamic_check.succeeded20
  %conv121 = sext i8 %4 to i32
  switch i32 %conv121, label %_Dynamic_check.succeeded131 [
    i32 10, label %cleanup
    i32 13, label %_Dynamic_check.succeeded126
  ]

_Dynamic_check.succeeded126:                      ; preds = %sw.bb120
  store i32 8, i32* %checked_state, align 8, !tbaa !26
  br label %_Dynamic_check.succeeded175

_Dynamic_check.succeeded131:                      ; preds = %sw.bb120
  store i32 6, i32* %checked_state, align 8, !tbaa !26
  br label %_Dynamic_check.succeeded175

sw.bb134:                                         ; preds = %_Dynamic_check.succeeded20
  %conv135 = sext i8 %4 to i32
  switch i32 %conv135, label %_Dynamic_check.succeeded145 [
    i32 10, label %_Dynamic_check.succeeded139
    i32 13, label %cleanup
  ]

_Dynamic_check.succeeded139:                      ; preds = %sw.bb134
  store i32 9, i32* %checked_state, align 8, !tbaa !26
  br label %_Dynamic_check.succeeded175

_Dynamic_check.succeeded145:                      ; preds = %sw.bb134
  store i32 6, i32* %checked_state, align 8, !tbaa !26
  br label %_Dynamic_check.succeeded175

sw.bb148:                                         ; preds = %_Dynamic_check.succeeded20
  %conv149 = sext i8 %4 to i32
  switch i32 %conv149, label %_Dynamic_check.succeeded159 [
    i32 10, label %cleanup
    i32 13, label %_Dynamic_check.succeeded154
  ]

_Dynamic_check.succeeded154:                      ; preds = %sw.bb148
  store i32 10, i32* %checked_state, align 8, !tbaa !26
  br label %_Dynamic_check.succeeded175

_Dynamic_check.succeeded159:                      ; preds = %sw.bb148
  store i32 6, i32* %checked_state, align 8, !tbaa !26
  br label %_Dynamic_check.succeeded175

sw.bb162:                                         ; preds = %_Dynamic_check.succeeded20
  %conv163 = sext i8 %4 to i32
  switch i32 %conv163, label %_Dynamic_check.succeeded168 [
    i32 10, label %cleanup
    i32 13, label %cleanup
  ]

_Dynamic_check.succeeded168:                      ; preds = %sw.bb162
  store i32 6, i32* %checked_state, align 8, !tbaa !26
  br label %_Dynamic_check.succeeded175

_Dynamic_check.succeeded175:                      ; preds = %_Dynamic_check.succeeded154, %_Dynamic_check.succeeded159, %_Dynamic_check.succeeded139, %_Dynamic_check.succeeded145, %_Dynamic_check.succeeded126, %_Dynamic_check.succeeded131, %_Dynamic_check.succeeded112, %_Dynamic_check.succeeded117, %sw.bb107, %_Dynamic_check.succeeded94, %_Dynamic_check.succeeded99, %sw.bb88, %sw.bb88, %_Dynamic_check.succeeded75, %_Dynamic_check.succeeded80, %_Dynamic_check.succeeded85, %sw.bb70, %_Dynamic_check.succeeded67, %sw.bb56, %sw.bb56, %_Dynamic_check.succeeded52, %sw.bb47, %_Dynamic_check.succeeded44, %sw.bb34, %sw.bb34, %_Dynamic_check.succeeded27, %sw.bb, %_Dynamic_check.succeeded20, %_Dynamic_check.succeeded168
  %inc = add nuw i64 %2, 1
  store i64 %inc, i64* %checked_idx, align 8, !tbaa !24
  %cmp = icmp ult i64 %inc, %0
  br i1 %cmp, label %_Dynamic_check.succeeded6, label %cleanup

cleanup:                                          ; preds = %sw.bb47, %sw.bb47, %sw.bb120, %sw.bb134, %sw.bb148, %sw.bb162, %sw.bb162, %_Dynamic_check.succeeded20, %_Dynamic_check.succeeded175, %_Dynamic_check.succeeded.lr.ph, %_Dynamic_check.succeeded104, %_Dynamic_check.succeeded62, %_Dynamic_check.succeeded40, %_Dynamic_check.succeeded32
  %retval.0 = phi i32 [ 2, %_Dynamic_check.succeeded104 ], [ 2, %_Dynamic_check.succeeded62 ], [ 2, %_Dynamic_check.succeeded40 ], [ 2, %_Dynamic_check.succeeded32 ], [ 0, %_Dynamic_check.succeeded.lr.ph ], [ 0, %_Dynamic_check.succeeded175 ], [ 2, %_Dynamic_check.succeeded20 ], [ 1, %sw.bb162 ], [ 1, %sw.bb162 ], [ 1, %sw.bb148 ], [ 1, %sw.bb134 ], [ 1, %sw.bb120 ], [ 1, %sw.bb47 ], [ 1, %sw.bb47 ]
  ret i32 %retval.0
}

; Function Attrs: noreturn nounwind uwtable
define dso_local i32 @httpd_parse_request(%struct.httpd_conn* %hc) local_unnamed_addr #4 {
entry:
  unreachable
}

; Function Attrs: nounwind uwtable
define dso_local void @httpd_close_conn(%struct.httpd_conn* %hc, %struct.timeval* %nowP) local_unnamed_addr #1 {
entry:
  unreachable
}

; Function Attrs: nounwind uwtable
define dso_local void @httpd_destroy_conn(%struct.httpd_conn* readonly %hc) local_unnamed_addr #1 {
entry:
  %_Dynamic_check.non_null.not = icmp eq %struct.httpd_conn* %hc, null
  br i1 %_Dynamic_check.non_null.not, label %_Dynamic_check.failed, label %_Dynamic_check.succeeded

_Dynamic_check.succeeded:                         ; preds = %entry
  %initialized = getelementptr inbounds %struct.httpd_conn, %struct.httpd_conn* %hc, i64 0, i32 0
  %0 = load i32, i32* %initialized, align 8, !tbaa !27
  %tobool.not = icmp eq i32 %0, 0
  call void @llvm.assume(i1 %tobool.not)
  ret void

_Dynamic_check.failed:                            ; preds = %entry
  tail call void @llvm.trap() #10
  unreachable
}

; Function Attrs: noreturn nounwind uwtable
define internal i32 @__ext_compare(%struct.mime_entry* readonly %v1, %struct.mime_entry* readonly %v2) #4 {
entry:
  %_Dynamic_check.non_null.not = icmp eq %struct.mime_entry* %v1, null
  br i1 %_Dynamic_check.non_null.not, label %_Dynamic_check.failed, label %_Dynamic_check.succeeded

_Dynamic_check.succeeded:                         ; preds = %entry
  %_Dynamic_check.non_null1.not = icmp eq %struct.mime_entry* %v2, null
  tail call void @llvm.assume(i1 %_Dynamic_check.non_null1.not)
  tail call void @llvm.trap() #10
  unreachable

_Dynamic_check.failed:                            ; preds = %entry
  tail call void @llvm.trap() #10
  unreachable
}

; Function Attrs: noreturn nounwind uwtable
define internal i32 @__name_compare(i8** readonly %v1, i8** readonly %v2) #4 {
entry:
  %_Dynamic_check.non_null.not = icmp eq i8** %v1, null
  br i1 %_Dynamic_check.non_null.not, label %_Dynamic_check.failed, label %_Dynamic_check.succeeded

_Dynamic_check.succeeded:                         ; preds = %entry
  %_Dynamic_check.non_null1.not = icmp eq i8** %v2, null
  tail call void @llvm.assume(i1 %_Dynamic_check.non_null1.not)
  tail call void @llvm.trap() #10
  unreachable

_Dynamic_check.failed:                            ; preds = %entry
  tail call void @llvm.trap() #10
  unreachable
}

; Function Attrs: norecurse noreturn nounwind readnone uwtable willreturn
define dso_local i32 @httpd_start_request(%struct.httpd_conn* nocapture readnone %hc, %struct.timeval* nocapture readnone %nowP) local_unnamed_addr #7 {
entry:
  unreachable
}

; Function Attrs: noreturn
declare dso_local i32 @getnameinfo(%struct.sockaddr*, i32, i8*, i32, i8*, i32, i32) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local i32 @httpd_read_fully(i32 %fd, i8* %buf, i64 %nbytes) local_unnamed_addr #1 {
entry:
  %cmp.not = icmp eq i64 %nbytes, 0
  br i1 %cmp.not, label %cleanup38, label %while.body

while.body:                                       ; preds = %entry
  %_Dynamic_check.non_null.not = icmp eq i8* %buf, null
  br i1 %_Dynamic_check.non_null.not, label %_Dynamic_check.failed, label %_Dynamic_check.success

_Dynamic_check.success:                           ; preds = %while.body
  %call = tail call i64 @read(i32 %fd, i8* nonnull %buf, i64 %nbytes) #11
  unreachable

_Dynamic_check.failed:                            ; preds = %while.body
  tail call void @llvm.trap() #10
  unreachable

cleanup38:                                        ; preds = %entry
  ret i32 0
}

; Function Attrs: nofree noreturn
declare dso_local noundef i64 @read(i32 noundef, i8* nocapture noundef, i64 noundef) local_unnamed_addr #8

; Function Attrs: nofree noreturn
declare dso_local noundef i64 @write(i32 noundef, i8* nocapture noundef readonly, i64 noundef) local_unnamed_addr #8

; Function Attrs: nounwind uwtable
define dso_local void @httpd_logstats(i64 %secs) local_unnamed_addr #1 {
entry:
  ret void
}

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #9

attributes #0 = { noreturn nounwind readonly uwtable willreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { cold noreturn nounwind }
attributes #3 = { nofree noreturn nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { norecurse nounwind readnone uwtable willreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { norecurse noreturn nounwind readnone uwtable willreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nofree noreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nofree nosync nounwind willreturn }
attributes #10 = { noreturn nounwind }
attributes #11 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0 (https://github.com/arunkumarbhattar/CheckCBox_Compiler.git 4662b53f5430220537b911f7ed7b6c0da47f272b)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !9, i64 72}
!7 = !{!"", !3, i64 0, !3, i64 8, !8, i64 16, !3, i64 24, !9, i64 32, !9, i64 36, !3, i64 40, !3, i64 48, !9, i64 56, !3, i64 64, !9, i64 72, !9, i64 76, !9, i64 80, !3, i64 88, !9, i64 96, !9, i64 100, !9, i64 104, !3, i64 112, !3, i64 120, !9, i64 128}
!8 = !{!"short", !4, i64 0}
!9 = !{!"int", !4, i64 0}
!10 = !{!7, !9, i64 76}
!11 = !{}
!12 = !{!13, !14, i64 472}
!13 = !{!"", !9, i64 0, !3, i64 8, !4, i64 16, !3, i64 144, !14, i64 152, !14, i64 160, !14, i64 168, !9, i64 176, !9, i64 180, !9, i64 184, !14, i64 192, !14, i64 200, !3, i64 208, !3, i64 216, !3, i64 224, !3, i64 232, !3, i64 240, !3, i64 248, !3, i64 256, !3, i64 264, !3, i64 272, !3, i64 280, !3, i64 288, !3, i64 296, !3, i64 304, !3, i64 312, !3, i64 320, !3, i64 328, !3, i64 336, !3, i64 344, !3, i64 352, !3, i64 360, !3, i64 368, !14, i64 376, !14, i64 384, !14, i64 392, !14, i64 400, !14, i64 408, !14, i64 416, !14, i64 424, !14, i64 432, !14, i64 440, !14, i64 448, !14, i64 456, !14, i64 464, !14, i64 472, !14, i64 480, !14, i64 488, !14, i64 496, !3, i64 504, !3, i64 512, !9, i64 520, !9, i64 524, !9, i64 528, !9, i64 532, !14, i64 536, !14, i64 544, !9, i64 552, !9, i64 556, !15, i64 560, !9, i64 704, !3, i64 712}
!14 = !{!"long", !4, i64 0}
!15 = !{!"stat", !14, i64 0, !14, i64 8, !14, i64 16, !9, i64 24, !9, i64 28, !9, i64 32, !9, i64 36, !14, i64 40, !14, i64 48, !14, i64 56, !14, i64 64, !16, i64 72, !16, i64 88, !16, i64 104, !4, i64 120}
!16 = !{!"timespec", !14, i64 0, !14, i64 8}
!17 = !{!13, !9, i64 704}
!18 = !{!14, !14, i64 0}
!19 = !{!20, !14, i64 8}
!20 = !{!"strbuf", !3, i64 0, !14, i64 8}
!21 = !{!20, !3, i64 0}
!22 = !{!4, !4, i64 0}
!23 = !{!13, !14, i64 160}
!24 = !{!13, !14, i64 168}
!25 = !{!13, !14, i64 152}
!26 = !{!13, !9, i64 176}
!27 = !{!13, !9, i64 0}
