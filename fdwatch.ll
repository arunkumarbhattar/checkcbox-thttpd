; ModuleID = 'fdwatch.c'
source_filename = "fdwatch.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.pollfd = type { i32, i16, i16 }

@nwatches = internal unnamed_addr global i64 0, align 8
@.str = private unnamed_addr constant [38 x i8] c"bad fd (%d) passed to fdwatch_add_fd!\00", align 1
@.str.1 = private unnamed_addr constant [38 x i8] c"bad fd (%d) passed to fdwatch_del_fd!\00", align 1
@next_ridx = internal unnamed_addr global i32 0, align 4
@.str.2 = private unnamed_addr constant [40 x i8] c"bad fd (%d) passed to fdwatch_check_fd!\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"  fdwatch - %ld %ss (%g/sec)\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"poll\00", align 1
@npoll_fds = internal unnamed_addr global i64 0, align 8
@.str.8 = private unnamed_addr constant [30 x i8] c"bad ridx (%d) in poll_get_fd!\00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @fdwatch_get_nfiles() local_unnamed_addr #0 {
entry:
  %call = tail call i32 @getdtablesize() #3
  unreachable
}

; Function Attrs: noreturn nounwind
declare dso_local i32 @getdtablesize() local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local void @fdwatch_add_fd(i32 %fd, i8* %client_data, i32 %rw) local_unnamed_addr #0 {
entry:
  tail call void (i32, i8*, ...) @syslog(i32 3, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i64 0, i64 0), i32 %fd) #3
  unreachable
}

; Function Attrs: noreturn
declare dso_local void @syslog(i32, i8*, ...) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local void @fdwatch_del_fd(i32 %fd) local_unnamed_addr #0 {
entry:
  tail call void (i32, i8*, ...) @syslog(i32 3, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.1, i64 0, i64 0), i32 %fd) #3
  unreachable
}

; Function Attrs: nounwind uwtable
define dso_local i32 @fdwatch(i64 %timeout_msecs) local_unnamed_addr #0 {
entry:
  %0 = load i64, i64* @nwatches, align 8, !tbaa !2
  %inc = add nsw i64 %0, 1
  store i64 %inc, i64* @nwatches, align 8, !tbaa !2
  %.pre.i = load i64, i64* @npoll_fds, align 8, !tbaa !2
  %conv.i = trunc i64 %timeout_msecs to i32
  %call.i = tail call i32 @poll(%struct.pollfd* null, i64 %.pre.i, i32 %conv.i) #3
  unreachable
}

; Function Attrs: nounwind uwtable
define dso_local i32 @fdwatch_check_fd(i32 %fd) local_unnamed_addr #0 {
entry:
  tail call void (i32, i8*, ...) @syslog(i32 3, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.2, i64 0, i64 0), i32 %fd) #3
  unreachable
}

; Function Attrs: nounwind uwtable
define dso_local i8* @fdwatch_get_next_client_data() local_unnamed_addr #0 {
entry:
  %0 = load i32, i32* @next_ridx, align 4, !tbaa !6
  %cmp.not = icmp slt i32 %0, 0
  br i1 %cmp.not, label %if.end, label %cleanup

if.end:                                           ; preds = %entry
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @next_ridx, align 4, !tbaa !6
  tail call void (i32, i8*, ...) @syslog(i32 3, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.8, i64 0, i64 0), i32 %0) #3
  unreachable

cleanup:                                          ; preds = %entry
  ret i8* inttoptr (i64 -1 to i8*)
}

; Function Attrs: nounwind uwtable
define dso_local void @fdwatch_logstats(i64 %secs) local_unnamed_addr #0 {
entry:
  %cmp = icmp sgt i64 %secs, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %0 = load i64, i64* @nwatches, align 8, !tbaa !2
  %conv = sitofp i64 %0 to float
  %conv1 = sitofp i64 %secs to float
  %div = fdiv float %conv, %conv1
  %conv2 = fpext float %div to double
  tail call void (i32, i8*, ...) @syslog(i32 5, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.3, i64 0, i64 0), i64 %0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i64 0, i64 0), double %conv2) #3
  unreachable

if.end:                                           ; preds = %entry
  store i64 0, i64* @nwatches, align 8, !tbaa !2
  ret void
}

; Function Attrs: noreturn
declare dso_local i32 @poll(%struct.pollfd*, i64, i32) local_unnamed_addr #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0 (https://github.com/arunkumarbhattar/CheckCBox_Compiler.git 4662b53f5430220537b911f7ed7b6c0da47f272b)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"long", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
