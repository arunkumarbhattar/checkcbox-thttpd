; ModuleID = 'thttpd.c'
source_filename = "thttpd.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@terminate = dso_local local_unnamed_addr global i32 0, align 4
@stats_time = dso_local local_unnamed_addr global i64 0, align 8
@start_time = dso_local local_unnamed_addr global i64 0, align 8
@stats_connections = dso_local local_unnamed_addr global i64 0, align 8
@stats_bytes = dso_local local_unnamed_addr global i64 0, align 8
@stats_simultaneous = dso_local local_unnamed_addr global i32 0, align 4

; Function Attrs: noreturn nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** readonly %argv) local_unnamed_addr #0 {
entry:
  %_Dynamic_check.non_null.not = icmp eq i8** %argv, null
  br i1 %_Dynamic_check.non_null.not, label %_Dynamic_check.failed, label %_Dynamic_check.succeeded

_Dynamic_check.succeeded:                         ; preds = %entry
  %_Dynamic_check.upper = icmp slt i32 %argc, 1
  call void @llvm.assume(i1 %_Dynamic_check.upper)
  tail call void @llvm.trap() #3
  unreachable

_Dynamic_check.failed:                            ; preds = %entry
  tail call void @llvm.trap() #3
  unreachable
}

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #1

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #2

attributes #0 = { noreturn nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { cold noreturn nounwind }
attributes #2 = { nofree nosync nounwind willreturn }
attributes #3 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0 (https://github.com/arunkumarbhattar/CheckCBox_Compiler.git 4662b53f5430220537b911f7ed7b6c0da47f272b)"}
