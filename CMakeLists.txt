cmake_minimum_required(VERSION 2.8.8)
project(b'checkcbox-thttpd')
set(CMAKE_C_COMPILER /home/arun/Desktop/TheBox/CheckCBox_Compiler/llvm/cmake-build-debug/bin/clang)
add_library(checkcbox-thttpd OBJECT
    /home/arun/Desktop/originalthttpd/checkcbox-thttpd/mmc.c
    /home/arun/Desktop/originalthttpd/checkcbox-thttpd/cgi-src/redirect.c
    /home/arun/Desktop/originalthttpd/checkcbox-thttpd/libhttpd.c
)


target_compile_options(checkcbox-thttpd PRIVATE
    -O2
)

add_executable(unit-tests      /home/arun/Desktop/originalthttpd/checkcbox-thttpd/unit_tests.c
        /home/arun/Desktop/originalthttpd/checkcbox-thttpd/checkedc_utils.c
        )

target_compile_options(unit-tests PRIVATE
        -O2
        )
target_compile_definitions(checkcbox-thttpd PRIVATE
    HAVE__PROGNAME=1
    HAVE_FCNTL_H=1
    HAVE_GRP_H=1
    HAVE_MEMORY_H=1
    HAVE_PATHS_H=1
    HAVE_POLL_H=1
    HAVE_SYS_POLL_H=1
    TIME_WITH_SYS_TIME=1
    HAVE_DIRENT_H=1
    HAVE_LIBCRYPT=1
    HAVE_STRERROR=1
    HAVE_WAITPID=1
    HAVE_VSNPRINTF=1
    HAVE_DAEMON=1
    HAVE_SETSID=1
    HAVE_GETADDRINFO=1
    HAVE_GETNAMEINFO=1
    HAVE_GAI_STRERROR=1
    HAVE_SIGSET=1
    HAVE_ATOLL=1
    HAVE_UNISTD_H=1
    HAVE_GETPAGESIZE=1
    HAVE_SELECT=1
    HAVE_POLL=1
    HAVE_TM_GMTOFF=1
    HAVE_INT64T=1
    HAVE_SOCKLENT=1
)
target_include_directories(checkcbox-thttpd PRIVATE
    /home/arun/Desktop/originalthttpd/checkcbox-thttpd
)
