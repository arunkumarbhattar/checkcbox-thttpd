; ModuleID = 'checkedc_utils.c'
source_filename = "checkedc_utils.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local noalias i8* @malloc_nt(i64 %size) local_unnamed_addr #0 {
entry:
  unreachable
}

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #1

; Function Attrs: nounwind uwtable
define dso_local noalias i8* @realloc_nt(i8* nocapture %ptr, i64 %size) local_unnamed_addr #0 {
entry:
  unreachable
}

; Function Attrs: nounwind uwtable
define dso_local i64 @xstrbcpy(i8* noalias %dest, i8* noalias readonly %src, i64 %size) local_unnamed_addr #0 {
entry:
  %_Dynamic_check.non_null18.not = icmp eq i8* %src, null
  br i1 %_Dynamic_check.non_null18.not, label %_Dynamic_check.failed19, label %_Dynamic_check.succeeded28.lr.ph

_Dynamic_check.succeeded28.lr.ph:                 ; preds = %entry
  %_Dynamic_check.non_null47.not = icmp eq i8* %dest, null
  %0 = icmp sgt i64 %size, 0
  %smax = select i1 %0, i64 %size, i64 0
  %1 = load i8, i8* %src, align 1, !tbaa !2
  %cmp.not108 = icmp eq i8 %1, 0
  br i1 %cmp.not108, label %for.end, label %_Dynamic_check.succeeded46

_Dynamic_check.succeeded46:                       ; preds = %_Dynamic_check.succeeded28.lr.ph, %_Dynamic_check.succeeded56
  %2 = phi i8 [ %3, %_Dynamic_check.succeeded56 ], [ %1, %_Dynamic_check.succeeded28.lr.ph ]
  %i.0100109 = phi i64 [ %inc, %_Dynamic_check.succeeded56 ], [ 0, %_Dynamic_check.succeeded28.lr.ph ]
  br i1 %_Dynamic_check.non_null47.not, label %_Dynamic_check.failed48, label %_Dynamic_check.succeeded49

_Dynamic_check.succeeded49:                       ; preds = %_Dynamic_check.succeeded46
  %exitcond.not = icmp eq i64 %i.0100109, %smax
  br i1 %exitcond.not, label %_Dynamic_check.failed55, label %_Dynamic_check.succeeded56

_Dynamic_check.succeeded56:                       ; preds = %_Dynamic_check.succeeded49
  %arrayidx50 = getelementptr inbounds i8, i8* %dest, i64 %i.0100109
  store i8 %2, i8* %arrayidx50, align 1, !tbaa !2
  %inc = add nuw i64 %i.0100109, 1
  %arrayidx = getelementptr inbounds i8, i8* %src, i64 %inc
  %3 = load i8, i8* %arrayidx, align 1, !tbaa !2
  %cmp.not = icmp eq i8 %3, 0
  br i1 %cmp.not, label %for.end, label %_Dynamic_check.succeeded46

_Dynamic_check.failed19:                          ; preds = %entry
  tail call void @llvm.trap() #5
  unreachable

_Dynamic_check.failed48:                          ; preds = %_Dynamic_check.succeeded46
  tail call void @llvm.trap() #5
  unreachable

_Dynamic_check.failed55:                          ; preds = %_Dynamic_check.succeeded49
  tail call void @llvm.trap() #5
  unreachable

for.end:                                          ; preds = %_Dynamic_check.succeeded56, %_Dynamic_check.succeeded28.lr.ph
  %i.0100.lcssa = phi i64 [ 0, %_Dynamic_check.succeeded28.lr.ph ], [ %inc, %_Dynamic_check.succeeded56 ]
  br i1 %_Dynamic_check.non_null47.not, label %_Dynamic_check.failed58, label %_Dynamic_check.succeeded59

_Dynamic_check.succeeded59:                       ; preds = %for.end
  %.not = icmp sgt i64 %i.0100.lcssa, %size
  br i1 %.not, label %_Dynamic_check.failed67, label %_Dynamic_check.succeeded69

_Dynamic_check.succeeded69:                       ; preds = %_Dynamic_check.succeeded59
  %arrayidx60 = getelementptr inbounds i8, i8* %dest, i64 %i.0100.lcssa
  store i8 0, i8* %arrayidx60, align 1, !tbaa !2
  ret i64 %i.0100.lcssa

_Dynamic_check.failed58:                          ; preds = %for.end
  tail call void @llvm.trap() #5
  unreachable

_Dynamic_check.failed67:                          ; preds = %_Dynamic_check.succeeded59
  tail call void @llvm.trap() #5
  unreachable
}

; Function Attrs: nounwind uwtable
define dso_local i64 @xstrbcat(i8* noalias %dest, i8* noalias readonly %src, i64 %size) local_unnamed_addr #0 {
entry:
  %cmp.not = icmp eq i64 %size, 0
  br i1 %cmp.not, label %_Dynamic_check.failed, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %_Dynamic_check.non_null.not = icmp eq i8* %dest, null
  br i1 %_Dynamic_check.non_null.not, label %_Dynamic_check.failed1, label %_Dynamic_check.succeeded2.preheader

_Dynamic_check.succeeded2.preheader:              ; preds = %for.cond.preheader
  %_Dynamic_check.upper145 = icmp sgt i64 %size, -1
  br i1 %_Dynamic_check.upper145, label %_Dynamic_check.succeeded4, label %_Dynamic_check.failed3

_Dynamic_check.succeeded4:                        ; preds = %_Dynamic_check.succeeded2.preheader, %for.inc
  %dest_i.0130146 = phi i64 [ %inc, %for.inc ], [ 0, %_Dynamic_check.succeeded2.preheader ]
  %arrayidx = getelementptr inbounds i8, i8* %dest, i64 %dest_i.0130146
  %0 = load i8, i8* %arrayidx, align 1, !tbaa !2
  %cmp5.not = icmp eq i8 %0, 0
  br i1 %cmp5.not, label %for.cond30.preheader, label %for.inc

for.cond30.preheader:                             ; preds = %_Dynamic_check.succeeded4
  %_Dynamic_check.non_null31.not = icmp eq i8* %src, null
  br i1 %_Dynamic_check.non_null31.not, label %_Dynamic_check.failed32, label %_Dynamic_check.succeeded33.preheader

_Dynamic_check.succeeded33.preheader:             ; preds = %for.cond30.preheader
  %1 = sub i64 %size, %dest_i.0130146
  br label %_Dynamic_check.succeeded43

for.inc:                                          ; preds = %_Dynamic_check.succeeded4
  %inc = add nuw i64 %dest_i.0130146, 1
  %_Dynamic_check.lower = icmp sgt i64 %inc, -1
  %_Dynamic_check.upper = icmp sle i64 %inc, %size
  %_Dynamic_check.range = and i1 %_Dynamic_check.lower, %_Dynamic_check.upper
  br i1 %_Dynamic_check.range, label %_Dynamic_check.succeeded4, label %_Dynamic_check.failed3

_Dynamic_check.failed:                            ; preds = %entry
  tail call void @llvm.trap() #5
  unreachable

_Dynamic_check.failed1:                           ; preds = %for.cond.preheader
  tail call void @llvm.trap() #5
  unreachable

_Dynamic_check.failed3:                           ; preds = %for.inc, %_Dynamic_check.succeeded2.preheader
  tail call void @llvm.trap() #5
  unreachable

_Dynamic_check.succeeded43:                       ; preds = %_Dynamic_check.succeeded33.preheader, %_Dynamic_check.succeeded70
  %src_i.0128144 = phi i64 [ 0, %_Dynamic_check.succeeded33.preheader ], [ %inc73, %_Dynamic_check.succeeded70 ]
  %dest_i.1129143 = phi i64 [ %dest_i.0130146, %_Dynamic_check.succeeded33.preheader ], [ %inc72, %_Dynamic_check.succeeded70 ]
  %arrayidx34 = getelementptr inbounds i8, i8* %src, i64 %src_i.0128144
  %2 = load i8, i8* %arrayidx34, align 1, !tbaa !2
  %cmp45.not = icmp eq i8 %2, 0
  br i1 %cmp45.not, label %_Dynamic_check.succeeded77, label %_Dynamic_check.succeeded63

_Dynamic_check.succeeded63:                       ; preds = %_Dynamic_check.succeeded43
  %exitcond136.not = icmp eq i64 %src_i.0128144, %1
  br i1 %exitcond136.not, label %_Dynamic_check.failed69, label %_Dynamic_check.succeeded70

_Dynamic_check.succeeded70:                       ; preds = %_Dynamic_check.succeeded63
  %arrayidx64 = getelementptr inbounds i8, i8* %dest, i64 %dest_i.1129143
  store i8 %2, i8* %arrayidx64, align 1, !tbaa !2
  %inc72 = add nuw nsw i64 %dest_i.1129143, 1
  %inc73 = add nuw i64 %src_i.0128144, 1
  %exitcond = icmp eq i64 %inc73, -9223372036854775808
  br i1 %exitcond, label %_Dynamic_check.failed42, label %_Dynamic_check.succeeded43

_Dynamic_check.failed32:                          ; preds = %for.cond30.preheader
  tail call void @llvm.trap() #5
  unreachable

_Dynamic_check.failed42:                          ; preds = %_Dynamic_check.succeeded70
  tail call void @llvm.trap() #5
  unreachable

_Dynamic_check.failed69:                          ; preds = %_Dynamic_check.succeeded63
  tail call void @llvm.trap() #5
  unreachable

_Dynamic_check.succeeded77:                       ; preds = %_Dynamic_check.succeeded43
  %.not = icmp sgt i64 %dest_i.1129143, %size
  br i1 %.not, label %_Dynamic_check.failed85, label %_Dynamic_check.succeeded87

_Dynamic_check.succeeded87:                       ; preds = %_Dynamic_check.succeeded77
  %arrayidx78 = getelementptr inbounds i8, i8* %dest, i64 %dest_i.1129143
  store i8 0, i8* %arrayidx78, align 1, !tbaa !2
  ret i64 %dest_i.1129143

_Dynamic_check.failed85:                          ; preds = %_Dynamic_check.succeeded77
  tail call void @llvm.trap() #5
  unreachable
}

; Function Attrs: noreturn nounwind uwtable
define dso_local i32 @xsbprintf(i8* noalias nocapture readnone %s, i64 %size, i8* noalias nocapture readnone %format, ...) local_unnamed_addr #2 {
entry:
  unreachable
}

; Function Attrs: nounwind uwtable
define dso_local i8* @get_after_spn(i8* readonly %str, i8* nocapture readonly %search) local_unnamed_addr #0 {
entry:
  %_Dynamic_check.non_null.not = icmp eq i8* %str, null
  call void @llvm.assume(i1 %_Dynamic_check.non_null.not)
  tail call void @llvm.trap() #5
  unreachable
}

; Function Attrs: nounwind uwtable
define dso_local i8* @get_after_cspn(i8* readonly %str, i8* nocapture readonly %search) local_unnamed_addr #0 {
entry:
  %_Dynamic_check.non_null.not = icmp eq i8* %str, null
  call void @llvm.assume(i1 %_Dynamic_check.non_null.not)
  tail call void @llvm.trap() #5
  unreachable
}

; Function Attrs: noreturn nounwind readnone uwtable
define dso_local i32 @__isxdigit(i8 signext %c) local_unnamed_addr #3 {
entry:
  unreachable
}

; Function Attrs: noreturn nounwind readnone uwtable
define dso_local i32 @__isdigit(i8 signext %c) local_unnamed_addr #3 {
entry:
  unreachable
}

; Function Attrs: noreturn nounwind readnone uwtable
define dso_local i32 @__isupper(i8 signext %c) local_unnamed_addr #3 {
entry:
  unreachable
}

; Function Attrs: noreturn nounwind readnone uwtable
define dso_local i32 @__tolower(i8 signext %c) local_unnamed_addr #3 {
entry:
  unreachable
}

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #4

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { cold noreturn nounwind }
attributes #2 = { noreturn nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind readnone uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nofree nosync nounwind willreturn }
attributes #5 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0 (https://github.com/arunkumarbhattar/CheckCBox_Compiler.git 4662b53f5430220537b911f7ed7b6c0da47f272b)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
