; ModuleID = 'tdate_parse.c'
source_filename = "tdate_parse.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.strlong = type { i8*, i64 }

@strlong_compare = dso_local local_unnamed_addr global i32 (i8*, i8*)* bitcast (i32 (%struct.strlong*, %struct.strlong*)* @__strlong_compare to i32 (i8*, i8*)*), align 8

; Function Attrs: noreturn nounwind uwtable
define internal i32 @__strlong_compare(%struct.strlong* readonly %v1, %struct.strlong* readonly %v2) #0 {
entry:
  %_Dynamic_check.non_null.not = icmp eq %struct.strlong* %v1, null
  br i1 %_Dynamic_check.non_null.not, label %_Dynamic_check.failed, label %_Dynamic_check.succeeded

_Dynamic_check.succeeded:                         ; preds = %entry
  %_Dynamic_check.non_null1.not = icmp eq %struct.strlong* %v2, null
  tail call void @llvm.assume(i1 %_Dynamic_check.non_null1.not)
  tail call void @llvm.trap() #4
  unreachable

_Dynamic_check.failed:                            ; preds = %entry
  tail call void @llvm.trap() #4
  unreachable
}

; Function Attrs: nounwind uwtable
define dso_local i64 @tdate_parse(i8* readonly %str) local_unnamed_addr #1 {
entry:
  unreachable
}

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #2

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #3

attributes #0 = { noreturn nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { cold noreturn nounwind }
attributes #3 = { nofree nosync nounwind willreturn }
attributes #4 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0 (https://github.com/arunkumarbhattar/CheckCBox_Compiler.git 4662b53f5430220537b911f7ed7b6c0da47f272b)"}
