; ModuleID = 'checkedc_utils.c'
source_filename = "checkedc_utils.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local i8* @malloc_nt(i64 %size) local_unnamed_addr #0 {
entry:
  unreachable
}

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #1

; Function Attrs: noreturn
declare i32 @c_TPtoO(i8*) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local i8* @realloc_nt(i8* nocapture %ptr, i64 %size) local_unnamed_addr #0 {
entry:
  unreachable
}

; Function Attrs: nounwind uwtable
define dso_local i64 @xstrbcpy(i8* noalias %dest, i8* noalias %src, i64 %size) local_unnamed_addr #0 {
entry:
  %_Dynamic_check.is_null = icmp eq i8* %src, null
  br i1 %_Dynamic_check.is_null, label %_Dynamic_check.failed19, label %_Dynamic_check.subsumption

_Dynamic_check.subsumption:                       ; preds = %entry
  %0 = tail call i32 @c_TPtoO(i8* nonnull %src) #6
  unreachable

_Dynamic_check.failed19:                          ; preds = %entry
  tail call void @llvm.trap() #7
  unreachable
}

; Function Attrs: nounwind uwtable
define dso_local i64 @xstrbcat(i8* noalias %dest, i8* noalias %src, i64 %size) local_unnamed_addr #0 {
entry:
  %cmp.not = icmp eq i64 %size, 0
  br i1 %cmp.not, label %_Dynamic_check.failed, label %for.cond

for.cond:                                         ; preds = %entry
  %_Dynamic_check.non_null.not = icmp eq i8* %dest, null
  br i1 %_Dynamic_check.non_null.not, label %_Dynamic_check.failed1, label %_Dynamic_check.succeeded2

_Dynamic_check.succeeded2:                        ; preds = %for.cond
  %0 = tail call i32 @c_TPtoO(i8* nonnull %dest) #6
  unreachable

_Dynamic_check.failed:                            ; preds = %entry
  tail call void @llvm.trap() #7
  unreachable

_Dynamic_check.failed1:                           ; preds = %for.cond
  tail call void @llvm.trap() #7
  unreachable
}

; Function Attrs: noreturn nounwind uwtable
define dso_local i32 @xsbprintf(i8* noalias nocapture readnone %s, i64 %size, i8* noalias nocapture readnone %format, ...) local_unnamed_addr #3 {
entry:
  unreachable
}

; Function Attrs: nounwind uwtable
define dso_local noalias i8* @get_after_spn(i8* readonly %str, i8* nocapture readonly %search) local_unnamed_addr #0 {
entry:
  %_Dynamic_check.non_null.not = icmp eq i8* %str, null
  tail call void @llvm.assume(i1 %_Dynamic_check.non_null.not)
  tail call void @llvm.trap() #7
  unreachable
}

; Function Attrs: nounwind uwtable
define dso_local noalias i8* @get_after_cspn(i8* readonly %str, i8* nocapture readonly %search) local_unnamed_addr #0 {
entry:
  %_Dynamic_check.non_null.not = icmp eq i8* %str, null
  tail call void @llvm.assume(i1 %_Dynamic_check.non_null.not)
  tail call void @llvm.trap() #7
  unreachable
}

; Function Attrs: noreturn nounwind readnone uwtable
define dso_local i32 @__isxdigit(i8 signext %c) local_unnamed_addr #4 {
entry:
  unreachable
}

; Function Attrs: noreturn nounwind readnone uwtable
define dso_local i32 @__isdigit(i8 signext %c) local_unnamed_addr #4 {
entry:
  unreachable
}

; Function Attrs: noreturn nounwind readnone uwtable
define dso_local i32 @__isupper(i8 signext %c) local_unnamed_addr #4 {
entry:
  unreachable
}

; Function Attrs: noreturn nounwind readnone uwtable
define dso_local i32 @__tolower(i8 signext %c) local_unnamed_addr #4 {
entry:
  unreachable
}

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #5

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { cold noreturn nounwind }
attributes #2 = { noreturn }
attributes #3 = { noreturn nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind readnone uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nofree nosync nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0 (https://github.com/arunkumarbhattar/CheckCBox_Compiler.git 7ced7e4fa0fecc9bea6792b99f3c5ac6ea85155c)"}
