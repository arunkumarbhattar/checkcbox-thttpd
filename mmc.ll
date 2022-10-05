; ModuleID = 'mmc.c'
source_filename = "mmc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.MapStruct = type { i64, i64, i64, i64, i32, i64, i8*, i32, i32, %struct.MapStruct* }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.timeval = type { i64, i64 }

@free_maps = internal unnamed_addr global %struct.MapStruct* null, align 8
@free_count = internal unnamed_addr global i32 0, align 4
@maps = internal unnamed_addr global %struct.MapStruct* null, align 8
@map_count = internal unnamed_addr global i32 0, align 4
@.str.7 = private unnamed_addr constant [32 x i8] c"mmc_unmap failed to find entry!\00", align 1
@.str.8 = private unnamed_addr constant [43 x i8] c"mmc_unmap found zero or negative refcount!\00", align 1
@expire_age = internal unnamed_addr global i64 600, align 8
@.str.9 = private unnamed_addr constant [94 x i8] c"  map cache - %d allocated, %d active (%lld bytes), %d free; hash size: %zd; expire age: %lld\00", align 1

; Function Attrs: nounwind uwtable
define dso_local i8* @mmc_map(i8* %filename, %struct.stat* readonly %sbP, %struct.timeval* readonly %nowP) local_unnamed_addr #0 {
entry:
  unreachable
}

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #1

; Function Attrs: noreturn
declare dso_local void @syslog(i32, i8*, ...) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare dso_local i64 @time(i64*) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define dso_local void @mmc_unmap(i8* readnone %addr, %struct.stat* readonly %sbP, %struct.timeval* readonly %nowP) local_unnamed_addr #0 {
entry:
  %cmp.not = icmp eq %struct.stat* %sbP, null
  br i1 %cmp.not, label %for.cond.preheader, label %_Dynamic_check.failed.i

for.cond.preheader:                               ; preds = %entry
  %m.167 = load %struct.MapStruct*, %struct.MapStruct** @maps, align 8, !tbaa !2
  %cmp8.not68 = icmp eq %struct.MapStruct* %m.167, null
  br i1 %cmp8.not68, label %if.then21, label %_Dynamic_check.succeeded11

_Dynamic_check.failed.i:                          ; preds = %entry
  tail call void @llvm.trap() #5
  unreachable

_Dynamic_check.succeeded11:                       ; preds = %for.cond.preheader, %_Dynamic_check.succeeded18
  %m.169 = phi %struct.MapStruct* [ %m.1, %_Dynamic_check.succeeded18 ], [ %m.167, %for.cond.preheader ]
  %addr12 = getelementptr inbounds %struct.MapStruct, %struct.MapStruct* %m.169, i64 0, i32 6
  %0 = load i8*, i8** %addr12, align 8, !tbaa !6
  %cmp13 = icmp eq i8* %0, %addr
  br i1 %cmp13, label %_Dynamic_check.succeeded24, label %_Dynamic_check.succeeded18

_Dynamic_check.succeeded18:                       ; preds = %_Dynamic_check.succeeded11
  %next = getelementptr inbounds %struct.MapStruct, %struct.MapStruct* %m.169, i64 0, i32 9
  %m.1 = load %struct.MapStruct*, %struct.MapStruct** %next, align 8, !tbaa !2
  %cmp8.not = icmp eq %struct.MapStruct* %m.1, null
  br i1 %cmp8.not, label %if.then21, label %_Dynamic_check.succeeded11, !llvm.loop !10

if.then21:                                        ; preds = %_Dynamic_check.succeeded18, %for.cond.preheader
  tail call void (i32, i8*, ...) @syslog(i32 3, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.7, i64 0, i64 0)) #6
  unreachable

_Dynamic_check.succeeded24:                       ; preds = %_Dynamic_check.succeeded11
  %refcount = getelementptr inbounds %struct.MapStruct, %struct.MapStruct* %m.169, i64 0, i32 4
  %1 = load i32, i32* %refcount, align 8, !tbaa !12
  %cmp25 = icmp slt i32 %1, 1
  br i1 %cmp25, label %if.then26, label %_Dynamic_check.succeeded30

if.then26:                                        ; preds = %_Dynamic_check.succeeded24
  tail call void (i32, i8*, ...) @syslog(i32 3, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.8, i64 0, i64 0)) #6
  unreachable

_Dynamic_check.succeeded30:                       ; preds = %_Dynamic_check.succeeded24
  %dec = add nsw i32 %1, -1
  store i32 %dec, i32* %refcount, align 8, !tbaa !12
  %cmp32.not = icmp eq %struct.timeval* %nowP, null
  br i1 %cmp32.not, label %if.else38, label %if.end46

if.else38:                                        ; preds = %_Dynamic_check.succeeded30
  %call39 = tail call i64 @time(i64* null) #6
  unreachable

if.end46:                                         ; preds = %_Dynamic_check.succeeded30
  %tv_sec34 = getelementptr inbounds %struct.timeval, %struct.timeval* %nowP, i64 0, i32 0
  %2 = load i64, i64* %tv_sec34, align 8, !tbaa !13
  %reftime = getelementptr inbounds %struct.MapStruct, %struct.MapStruct* %m.169, i64 0, i32 5
  store i64 %2, i64* %reftime, align 8, !tbaa !15
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @mmc_cleanup(%struct.timeval* readonly %nowP) local_unnamed_addr #0 {
entry:
  %cmp.not = icmp eq %struct.timeval* %nowP, null
  br i1 %cmp.not, label %if.else, label %if.end

if.else:                                          ; preds = %entry
  %call = tail call i64 @time(i64* null) #6
  unreachable

if.end:                                           ; preds = %entry
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %nowP, i64 0, i32 0
  %0 = load i64, i64* %tv_sec, align 8, !tbaa !13
  %1 = load %struct.MapStruct*, %struct.MapStruct** @maps, align 8, !tbaa !2
  %cmp4.not78 = icmp eq %struct.MapStruct* %1, null
  br i1 %cmp4.not78, label %if.else30, label %_Dynamic_check.succeeded10.lr.ph

_Dynamic_check.succeeded10.lr.ph:                 ; preds = %if.end
  %2 = load i64, i64* @expire_age, align 8
  br label %_Dynamic_check.succeeded10

_Dynamic_check.succeeded10:                       ; preds = %_Dynamic_check.succeeded10.lr.ph, %_Dynamic_check.succeeded23
  %3 = phi %struct.MapStruct* [ %1, %_Dynamic_check.succeeded10.lr.ph ], [ %11, %_Dynamic_check.succeeded23 ]
  %mm.079 = phi %struct.MapStruct** [ @maps, %_Dynamic_check.succeeded10.lr.ph ], [ %next, %_Dynamic_check.succeeded23 ]
  %refcount = getelementptr inbounds %struct.MapStruct, %struct.MapStruct* %3, i64 0, i32 4
  %4 = load i32, i32* %refcount, align 8, !tbaa !12
  %cmp11 = icmp eq i32 %4, 0
  br i1 %cmp11, label %_Dynamic_check.succeeded14, label %_Dynamic_check.succeeded23

_Dynamic_check.succeeded14:                       ; preds = %_Dynamic_check.succeeded10
  %reftime = getelementptr inbounds %struct.MapStruct, %struct.MapStruct* %3, i64 0, i32 5
  %5 = load i64, i64* %reftime, align 8, !tbaa !15
  %sub = sub nsw i64 %0, %5
  %cmp15.not = icmp slt i64 %sub, %2
  br i1 %cmp15.not, label %_Dynamic_check.succeeded23, label %_Dynamic_check.succeeded3.i

_Dynamic_check.succeeded3.i:                      ; preds = %_Dynamic_check.succeeded14
  %size.i = getelementptr inbounds %struct.MapStruct, %struct.MapStruct* %3, i64 0, i32 2
  %6 = load i64, i64* %size.i, align 8, !tbaa !16
  %cmp.not.i = icmp eq i64 %6, 0
  tail call void @llvm.assume(i1 %cmp.not.i) #6
  %next.i = getelementptr inbounds %struct.MapStruct, %struct.MapStruct* %3, i64 0, i32 9
  %7 = load %struct.MapStruct*, %struct.MapStruct** %next.i, align 8, !tbaa !2
  store %struct.MapStruct* %7, %struct.MapStruct** %mm.079, align 8, !tbaa !2
  %8 = load i32, i32* @map_count, align 4, !tbaa !17
  %dec.i = add nsw i32 %8, -1
  store i32 %dec.i, i32* @map_count, align 4, !tbaa !17
  %9 = load %struct.MapStruct*, %struct.MapStruct** @free_maps, align 8, !tbaa !2
  store %struct.MapStruct* %9, %struct.MapStruct** %next.i, align 8, !tbaa !2
  store %struct.MapStruct* %3, %struct.MapStruct** @free_maps, align 8, !tbaa !2
  %10 = load i32, i32* @free_count, align 4, !tbaa !17
  %inc.i = add nsw i32 %10, 1
  store i32 %inc.i, i32* @free_count, align 4, !tbaa !17
  tail call void @llvm.trap() #5
  unreachable

_Dynamic_check.succeeded23:                       ; preds = %_Dynamic_check.succeeded14, %_Dynamic_check.succeeded10
  %next = getelementptr inbounds %struct.MapStruct, %struct.MapStruct* %3, i64 0, i32 9
  %11 = load %struct.MapStruct*, %struct.MapStruct** %next, align 8, !tbaa !2
  %cmp4.not = icmp eq %struct.MapStruct* %11, null
  br i1 %cmp4.not, label %if.else30, label %_Dynamic_check.succeeded10, !llvm.loop !18

if.else30:                                        ; preds = %_Dynamic_check.succeeded23, %if.end
  %12 = load i32, i32* @map_count, align 4, !tbaa !17
  %cmp31 = icmp sgt i32 %12, 1000
  br i1 %cmp31, label %if.then32, label %if.else42

if.then32:                                        ; preds = %if.else30
  %13 = load i64, i64* @expire_age, align 8, !tbaa !19
  %cmp35 = icmp sgt i64 %13, 91
  br i1 %cmp35, label %cond.true36, label %while.cond.sink.split

cond.true36:                                      ; preds = %if.then32
  %mul33 = shl nuw nsw i64 %13, 1
  %div34 = sdiv i64 %mul33, 3
  br label %while.cond.sink.split

if.else42:                                        ; preds = %if.else30
  %cmp43 = icmp slt i32 %12, 500
  br i1 %cmp43, label %if.then44, label %while.cond

if.then44:                                        ; preds = %if.else42
  %14 = load i64, i64* @expire_age, align 8, !tbaa !19
  %mul45 = mul nsw i64 %14, 5
  %cmp47 = icmp slt i64 %mul45, 7200
  %div46 = sdiv i64 %mul45, 4
  %cond53 = select i1 %cmp47, i64 %div46, i64 1800
  br label %while.cond.sink.split

while.cond.sink.split:                            ; preds = %cond.true36, %if.then32, %if.then44
  %cond53.sink = phi i64 [ %cond53, %if.then44 ], [ %div34, %cond.true36 ], [ 60, %if.then32 ]
  store i64 %cond53.sink, i64* @expire_age, align 8, !tbaa !19
  br label %while.cond

while.cond:                                       ; preds = %while.cond.sink.split, %if.else42
  %15 = load i32, i32* @free_count, align 4, !tbaa !17
  %cmp57 = icmp sgt i32 %15, 100
  br i1 %cmp57, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %16 = load %struct.MapStruct*, %struct.MapStruct** @free_maps, align 8, !tbaa !2
  %_Dynamic_check.non_null58.not = icmp eq %struct.MapStruct* %16, null
  call void @llvm.assume(i1 %_Dynamic_check.non_null58.not)
  tail call void @llvm.trap() #5
  unreachable

while.end:                                        ; preds = %while.cond
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @mmc_term() local_unnamed_addr #0 {
entry:
  %0 = load %struct.MapStruct*, %struct.MapStruct** @maps, align 8, !tbaa !2
  %cmp.not = icmp eq %struct.MapStruct* %0, null
  br i1 %cmp.not, label %while.cond1, label %_Dynamic_check.succeeded3.i

_Dynamic_check.succeeded3.i:                      ; preds = %entry
  %size.i = getelementptr inbounds %struct.MapStruct, %struct.MapStruct* %0, i64 0, i32 2
  %1 = load i64, i64* %size.i, align 8, !tbaa !16
  %cmp.not.i = icmp eq i64 %1, 0
  tail call void @llvm.assume(i1 %cmp.not.i) #6
  %next.i = getelementptr inbounds %struct.MapStruct, %struct.MapStruct* %0, i64 0, i32 9
  %2 = load %struct.MapStruct*, %struct.MapStruct** %next.i, align 8, !tbaa !2
  store %struct.MapStruct* %2, %struct.MapStruct** @maps, align 8, !tbaa !2
  %3 = load i32, i32* @map_count, align 4, !tbaa !17
  %dec.i = add nsw i32 %3, -1
  store i32 %dec.i, i32* @map_count, align 4, !tbaa !17
  %4 = load %struct.MapStruct*, %struct.MapStruct** @free_maps, align 8, !tbaa !2
  store %struct.MapStruct* %4, %struct.MapStruct** %next.i, align 8, !tbaa !2
  store %struct.MapStruct* %0, %struct.MapStruct** @free_maps, align 8, !tbaa !2
  %5 = load i32, i32* @free_count, align 4, !tbaa !17
  %inc.i = add nsw i32 %5, 1
  store i32 %inc.i, i32* @free_count, align 4, !tbaa !17
  tail call void @llvm.trap() #5
  unreachable

while.cond1:                                      ; preds = %entry
  %6 = load %struct.MapStruct*, %struct.MapStruct** @free_maps, align 8, !tbaa !2
  %cmp2.not = icmp eq %struct.MapStruct* %6, null
  call void @llvm.assume(i1 %cmp2.not)
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @mmc_logstats(i64 %secs) local_unnamed_addr #0 {
entry:
  %0 = load i32, i32* @map_count, align 4, !tbaa !17
  %1 = load i32, i32* @free_count, align 4, !tbaa !17
  %2 = load i64, i64* @expire_age, align 8, !tbaa !19
  tail call void (i32, i8*, ...) @syslog(i32 5, i8* getelementptr inbounds ([94 x i8], [94 x i8]* @.str.9, i64 0, i64 0), i32 0, i32 %0, i64 0, i32 %1, i64 0, i64 %2) #6
  unreachable
}

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #4

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { cold noreturn nounwind }
attributes #2 = { noreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nofree nosync nounwind willreturn }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0 (https://github.com/arunkumarbhattar/CheckCBox_Compiler.git 7ced7e4fa0fecc9bea6792b99f3c5ac6ea85155c)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !3, i64 48}
!7 = !{!"MapStruct", !8, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !9, i64 32, !8, i64 40, !3, i64 48, !9, i64 56, !9, i64 60, !3, i64 64}
!8 = !{!"long", !4, i64 0}
!9 = !{!"int", !4, i64 0}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!7, !9, i64 32}
!13 = !{!14, !8, i64 0}
!14 = !{!"timeval", !8, i64 0, !8, i64 8}
!15 = !{!7, !8, i64 40}
!16 = !{!7, !8, i64 16}
!17 = !{!9, !9, i64 0}
!18 = distinct !{!18, !11}
!19 = !{!8, !8, i64 0}
