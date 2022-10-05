; ModuleID = 'timers.c'
source_filename = "timers.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.TimerStruct = type { void (i8*, %struct.timeval*)*, %union.ClientData, i64, i32, %struct.timeval, %struct.TimerStruct*, %struct.TimerStruct*, i32 }
%union.ClientData = type { i8* }
%struct.timeval = type { i64, i64 }

@timers = internal global [67 x %struct.TimerStruct*] zeroinitializer, align 16
@free_timers = internal unnamed_addr global %struct.TimerStruct* null, align 8
@free_count = internal unnamed_addr global i32 0, align 4
@active_count = internal unnamed_addr global i32 0, align 4
@tmr_timeout.timeout = internal global %struct.timeval zeroinitializer, align 8
@.str = private unnamed_addr constant [44 x i8] c"  timers - %d allocated, %d active, %d free\00", align 1
@JunkClientData = dso_local local_unnamed_addr global %union.ClientData zeroinitializer, align 8

; Function Attrs: nounwind uwtable
define dso_local void @tmr_init() local_unnamed_addr #0 {
entry:
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast ([67 x %struct.TimerStruct*]* @timers to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 2) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 4) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 6) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 8) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 10) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 12) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 14) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 16) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 18) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 20) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 22) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 24) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 26) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 28) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 30) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 32) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 34) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 36) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 38) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 40) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 42) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 44) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 46) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 48) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 50) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 52) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 54) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 56) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 58) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 60) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 62) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store <2 x %struct.TimerStruct*> zeroinitializer, <2 x %struct.TimerStruct*>* bitcast (%struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 64) to <2 x %struct.TimerStruct*>*), align 16, !tbaa !2
  store %struct.TimerStruct* null, %struct.TimerStruct** getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 66), align 16, !tbaa !2
  store %struct.TimerStruct* null, %struct.TimerStruct** @free_timers, align 8, !tbaa !2
  store i32 0, i32* @free_count, align 4, !tbaa !6
  store i32 0, i32* @active_count, align 4, !tbaa !6
  ret void
}

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #1

; Function Attrs: nounwind uwtable
define dso_local %struct.TimerStruct* @tmr_create(%struct.timeval* readonly %nowP, void (i8*, %struct.timeval*)* %timer_proc, i8* %client_data.coerce, i64 %msecs, i32 %periodic) local_unnamed_addr #0 {
entry:
  %0 = load %struct.TimerStruct*, %struct.TimerStruct** @free_timers, align 8, !tbaa !2, !nonnull !8
  %next = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %0, i64 0, i32 6
  %1 = load %struct.TimerStruct*, %struct.TimerStruct** %next, align 8, !tbaa !2
  store %struct.TimerStruct* %1, %struct.TimerStruct** @free_timers, align 8, !tbaa !2
  %2 = load i32, i32* @free_count, align 4, !tbaa !6
  %dec = add nsw i32 %2, -1
  store i32 %dec, i32* @free_count, align 4, !tbaa !6
  %timer_proc7 = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %0, i64 0, i32 0
  store void (i8*, %struct.timeval*)* %timer_proc, void (i8*, %struct.timeval*)** %timer_proc7, align 8, !tbaa !2
  %client_data.sroa.0.0..sroa_idx = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %0, i64 0, i32 1, i32 0
  store i8* %client_data.coerce, i8** %client_data.sroa.0.0..sroa_idx, align 8, !tbaa.struct !9
  %msecs15 = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %0, i64 0, i32 2
  store i64 %msecs, i64* %msecs15, align 8, !tbaa !12
  %periodic19 = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %0, i64 0, i32 3
  store i32 %periodic, i32* %periodic19, align 8, !tbaa !15
  %cmp20.not = icmp eq %struct.timeval* %nowP, null
  call void @llvm.assume(i1 %cmp20.not)
  %time32 = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %0, i64 0, i32 4
  %call33 = tail call i32 @gettimeofday(%struct.timeval* nonnull %time32, i8* null) #7
  unreachable
}

; Function Attrs: nofree noreturn nounwind
declare dso_local noundef i32 @gettimeofday(%struct.timeval* nocapture noundef, i8* nocapture noundef) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local %struct.timeval* @tmr_timeout(%struct.timeval* readonly %nowP) local_unnamed_addr #0 {
entry:
  %_Dynamic_check.non_null4.not.i = icmp eq %struct.timeval* %nowP, null
  %tv_sec7.i = getelementptr inbounds %struct.timeval, %struct.timeval* %nowP, i64 0, i32 0
  %tv_usec15.i = getelementptr inbounds %struct.timeval, %struct.timeval* %nowP, i64 0, i32 1
  br label %_Dynamic_check.succeeded.i

_Dynamic_check.succeeded.i:                       ; preds = %for.inc.i, %entry
  %indvars.iv.i = phi i64 [ 0, %entry ], [ %indvars.iv.next.i, %for.inc.i ]
  %msecs.054.i = phi i64 [ 0, %entry ], [ %msecs.1.i, %for.inc.i ]
  %gotone.053.i = phi i32 [ 0, %entry ], [ %gotone.1.i, %for.inc.i ]
  %arrayidx.i = getelementptr inbounds [67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 %indvars.iv.i
  %0 = load %struct.TimerStruct*, %struct.TimerStruct** %arrayidx.i, align 8, !tbaa !2
  %cmp1.not.i = icmp eq %struct.TimerStruct* %0, null
  br i1 %cmp1.not.i, label %for.inc.i, label %_Dynamic_check.succeeded3.i

_Dynamic_check.succeeded3.i:                      ; preds = %_Dynamic_check.succeeded.i
  br i1 %_Dynamic_check.non_null4.not.i, label %_Dynamic_check.failed5.i, label %_Dynamic_check.succeeded6.i

_Dynamic_check.succeeded6.i:                      ; preds = %_Dynamic_check.succeeded3.i
  %tv_sec.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %0, i64 0, i32 4, i32 0
  %1 = load i64, i64* %tv_sec.i, align 8, !tbaa !16
  %2 = load i64, i64* %tv_sec7.i, align 8, !tbaa !17
  %sub.i = sub nsw i64 %1, %2
  %mul.i = mul nsw i64 %sub.i, 1000
  %tv_usec.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %0, i64 0, i32 4, i32 1
  %3 = load i64, i64* %tv_usec.i, align 8, !tbaa !18
  %4 = load i64, i64* %tv_usec15.i, align 8, !tbaa !19
  %sub16.i = sub nsw i64 %3, %4
  %div.i = sdiv i64 %sub16.i, 1000
  %add.i = add nsw i64 %div.i, %mul.i
  %tobool.not.i = icmp eq i32 %gotone.053.i, 0
  br i1 %tobool.not.i, label %for.inc.i, label %if.else.i

_Dynamic_check.failed5.i:                         ; preds = %_Dynamic_check.succeeded3.i
  tail call void @llvm.trap() #8
  unreachable

if.else.i:                                        ; preds = %_Dynamic_check.succeeded6.i
  %cmp18.i = icmp slt i64 %add.i, %msecs.054.i
  %spec.select.i = select i1 %cmp18.i, i64 %add.i, i64 %msecs.054.i
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.else.i, %_Dynamic_check.succeeded6.i, %_Dynamic_check.succeeded.i
  %gotone.1.i = phi i32 [ %gotone.053.i, %_Dynamic_check.succeeded.i ], [ 1, %_Dynamic_check.succeeded6.i ], [ 1, %if.else.i ]
  %msecs.1.i = phi i64 [ %msecs.054.i, %_Dynamic_check.succeeded.i ], [ %add.i, %_Dynamic_check.succeeded6.i ], [ %spec.select.i, %if.else.i ]
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.not.i = icmp eq i64 %indvars.iv.next.i, 67
  br i1 %exitcond.not.i, label %tmr_mstimeout.exit, label %_Dynamic_check.succeeded.i, !llvm.loop !20

tmr_mstimeout.exit:                               ; preds = %for.inc.i
  %tobool22.not.i = icmp eq i32 %gotone.1.i, 0
  %cmp25.inv.i = icmp sgt i64 %msecs.1.i, 0
  %spec.select47.i = select i1 %cmp25.inv.i, i64 %msecs.1.i, i64 0
  %retval.0.i = select i1 %tobool22.not.i, i64 -1, i64 %spec.select47.i
  br i1 %tobool22.not.i, label %cleanup, label %if.end

if.end:                                           ; preds = %tmr_mstimeout.exit
  %div = sdiv i64 %retval.0.i, 1000
  store i64 %div, i64* getelementptr inbounds (%struct.timeval, %struct.timeval* @tmr_timeout.timeout, i64 0, i32 0), align 8, !tbaa !17
  %rem = srem i64 %retval.0.i, 1000
  %mul = mul nsw i64 %rem, 1000
  store i64 %mul, i64* getelementptr inbounds (%struct.timeval, %struct.timeval* @tmr_timeout.timeout, i64 0, i32 1), align 8, !tbaa !19
  br label %cleanup

cleanup:                                          ; preds = %tmr_mstimeout.exit, %if.end
  %retval.0 = phi %struct.timeval* [ @tmr_timeout.timeout, %if.end ], [ null, %tmr_mstimeout.exit ]
  ret %struct.timeval* %retval.0
}

; Function Attrs: nounwind uwtable
define dso_local i64 @tmr_mstimeout(%struct.timeval* readonly %nowP) local_unnamed_addr #0 {
entry:
  %_Dynamic_check.non_null4.not = icmp eq %struct.timeval* %nowP, null
  %tv_sec7 = getelementptr inbounds %struct.timeval, %struct.timeval* %nowP, i64 0, i32 0
  %tv_usec15 = getelementptr inbounds %struct.timeval, %struct.timeval* %nowP, i64 0, i32 1
  br label %_Dynamic_check.succeeded

_Dynamic_check.succeeded:                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %msecs.054 = phi i64 [ 0, %entry ], [ %msecs.1, %for.inc ]
  %gotone.053 = phi i32 [ 0, %entry ], [ %gotone.1, %for.inc ]
  %arrayidx = getelementptr inbounds [67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 %indvars.iv
  %0 = load %struct.TimerStruct*, %struct.TimerStruct** %arrayidx, align 8, !tbaa !2
  %cmp1.not = icmp eq %struct.TimerStruct* %0, null
  br i1 %cmp1.not, label %for.inc, label %_Dynamic_check.succeeded3

_Dynamic_check.succeeded3:                        ; preds = %_Dynamic_check.succeeded
  br i1 %_Dynamic_check.non_null4.not, label %_Dynamic_check.failed5, label %_Dynamic_check.succeeded6

_Dynamic_check.succeeded6:                        ; preds = %_Dynamic_check.succeeded3
  %tv_sec = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %0, i64 0, i32 4, i32 0
  %1 = load i64, i64* %tv_sec, align 8, !tbaa !16
  %2 = load i64, i64* %tv_sec7, align 8, !tbaa !17
  %sub = sub nsw i64 %1, %2
  %mul = mul nsw i64 %sub, 1000
  %tv_usec = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %0, i64 0, i32 4, i32 1
  %3 = load i64, i64* %tv_usec, align 8, !tbaa !18
  %4 = load i64, i64* %tv_usec15, align 8, !tbaa !19
  %sub16 = sub nsw i64 %3, %4
  %div = sdiv i64 %sub16, 1000
  %add = add nsw i64 %div, %mul
  %tobool.not = icmp eq i32 %gotone.053, 0
  br i1 %tobool.not, label %for.inc, label %if.else

_Dynamic_check.failed5:                           ; preds = %_Dynamic_check.succeeded3
  tail call void @llvm.trap() #8
  unreachable

if.else:                                          ; preds = %_Dynamic_check.succeeded6
  %cmp18 = icmp slt i64 %add, %msecs.054
  %spec.select = select i1 %cmp18, i64 %add, i64 %msecs.054
  br label %for.inc

for.inc:                                          ; preds = %if.else, %_Dynamic_check.succeeded6, %_Dynamic_check.succeeded
  %gotone.1 = phi i32 [ %gotone.053, %_Dynamic_check.succeeded ], [ 1, %_Dynamic_check.succeeded6 ], [ 1, %if.else ]
  %msecs.1 = phi i64 [ %msecs.054, %_Dynamic_check.succeeded ], [ %add, %_Dynamic_check.succeeded6 ], [ %spec.select, %if.else ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 67
  br i1 %exitcond.not, label %for.end, label %_Dynamic_check.succeeded, !llvm.loop !20

for.end:                                          ; preds = %for.inc
  %tobool22.not = icmp eq i32 %gotone.1, 0
  %cmp25.inv = icmp sgt i64 %msecs.1, 0
  %spec.select47 = select i1 %cmp25.inv, i64 %msecs.1, i64 0
  %retval.0 = select i1 %tobool22.not, i64 -1, i64 %spec.select47
  ret i64 %retval.0
}

; Function Attrs: nounwind uwtable
define dso_local void @tmr_run(%struct.timeval* %nowP) local_unnamed_addr #0 {
entry:
  %_Dynamic_check.non_null10.not = icmp eq %struct.timeval* %nowP, null
  %tv_sec13 = getelementptr inbounds %struct.timeval, %struct.timeval* %nowP, i64 0, i32 0
  %tv_usec32 = getelementptr inbounds %struct.timeval, %struct.timeval* %nowP, i64 0, i32 1
  br label %_Dynamic_check.succeeded

_Dynamic_check.succeeded:                         ; preds = %for.inc89, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc89 ]
  %arrayidx = getelementptr inbounds [67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 %indvars.iv
  %0 = load %struct.TimerStruct*, %struct.TimerStruct** %arrayidx, align 8, !tbaa !2
  %cmp2.not119 = icmp eq %struct.TimerStruct* %0, null
  br i1 %cmp2.not119, label %for.inc89, label %_Dynamic_check.succeeded5.lr.ph

_Dynamic_check.succeeded5.lr.ph:                  ; preds = %_Dynamic_check.succeeded
  br i1 %_Dynamic_check.non_null10.not, label %_Dynamic_check.failed11.split, label %_Dynamic_check.succeeded5

_Dynamic_check.succeeded5:                        ; preds = %_Dynamic_check.succeeded5.lr.ph, %for.inc
  %t.0120 = phi %struct.TimerStruct* [ %1, %for.inc ], [ %0, %_Dynamic_check.succeeded5.lr.ph ]
  %next6 = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t.0120, i64 0, i32 6
  %1 = load %struct.TimerStruct*, %struct.TimerStruct** %next6, align 8, !tbaa !2
  %tv_sec = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t.0120, i64 0, i32 4, i32 0
  %2 = load i64, i64* %tv_sec, align 8, !tbaa !16
  %3 = load i64, i64* %tv_sec13, align 8, !tbaa !17
  %cmp14 = icmp sgt i64 %2, %3
  br i1 %cmp14, label %for.inc89, label %_Dynamic_check.succeeded22

_Dynamic_check.succeeded22:                       ; preds = %_Dynamic_check.succeeded5
  %cmp24 = icmp eq i64 %2, %3
  br i1 %cmp24, label %_Dynamic_check.succeeded31, label %_Dynamic_check.succeeded39

_Dynamic_check.succeeded31:                       ; preds = %_Dynamic_check.succeeded22
  %tv_usec = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t.0120, i64 0, i32 4, i32 1
  %4 = load i64, i64* %tv_usec, align 8, !tbaa !18
  %5 = load i64, i64* %tv_usec32, align 8, !tbaa !19
  %cmp33 = icmp sgt i64 %4, %5
  br i1 %cmp33, label %for.inc89, label %_Dynamic_check.succeeded39

_Dynamic_check.failed11.split:                    ; preds = %_Dynamic_check.succeeded5.lr.ph
  tail call void @llvm.trap() #8
  unreachable

_Dynamic_check.succeeded39:                       ; preds = %_Dynamic_check.succeeded31, %_Dynamic_check.succeeded22
  %timer_proc = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t.0120, i64 0, i32 0
  %6 = load void (i8*, %struct.timeval*)*, void (i8*, %struct.timeval*)** %timer_proc, align 8, !tbaa !2
  %coerce.dive = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t.0120, i64 0, i32 1, i32 0
  %7 = load i8*, i8** %coerce.dive, align 8
  tail call void %6(i8* %7, %struct.timeval* nonnull %nowP) #7
  %periodic = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t.0120, i64 0, i32 3
  %8 = load i32, i32* %periodic, align 8, !tbaa !15
  %tobool.not = icmp eq i32 %8, 0
  br i1 %tobool.not, label %_Dynamic_check.succeeded.i.i, label %_Dynamic_check.succeeded46

_Dynamic_check.succeeded46:                       ; preds = %_Dynamic_check.succeeded39
  %msecs = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t.0120, i64 0, i32 2
  %9 = load i64, i64* %msecs, align 8, !tbaa !12
  %div = sdiv i64 %9, 1000
  %10 = load i64, i64* %tv_sec, align 8, !tbaa !16
  %add = add nsw i64 %10, %div
  store i64 %add, i64* %tv_sec, align 8, !tbaa !16
  %rem = srem i64 %9, 1000
  %mul = mul nsw i64 %rem, 1000
  %tv_usec60 = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t.0120, i64 0, i32 4, i32 1
  %11 = load i64, i64* %tv_usec60, align 8, !tbaa !18
  %add61 = add nsw i64 %11, %mul
  store i64 %add61, i64* %tv_usec60, align 8, !tbaa !18
  %cmp67 = icmp sgt i64 %add61, 999999
  br i1 %cmp67, label %_Dynamic_check.succeeded77, label %if.end87

_Dynamic_check.succeeded77:                       ; preds = %_Dynamic_check.succeeded46
  %div74117 = udiv i64 %add61, 1000000
  %add80 = add nsw i64 %div74117, %add
  store i64 %add80, i64* %tv_sec, align 8, !tbaa !16
  %rem86118 = urem i64 %add61, 1000000
  store i64 %rem86118, i64* %tv_usec60, align 8, !tbaa !18
  br label %if.end87

if.end87:                                         ; preds = %_Dynamic_check.succeeded77, %_Dynamic_check.succeeded46
  tail call fastcc void @l_resort(%struct.TimerStruct* nonnull %t.0120)
  br label %for.inc

_Dynamic_check.succeeded.i.i:                     ; preds = %_Dynamic_check.succeeded39
  %hash.i.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t.0120, i64 0, i32 7
  %12 = load i32, i32* %hash.i.i, align 8, !tbaa !22
  %prev.i.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t.0120, i64 0, i32 5
  %13 = load %struct.TimerStruct*, %struct.TimerStruct** %prev.i.i, align 8, !tbaa !2
  %cmp.i.i = icmp eq %struct.TimerStruct* %13, null
  br i1 %cmp.i.i, label %_Dynamic_check.succeeded6.i.i, label %_Dynamic_check.succeeded11.i.i

_Dynamic_check.succeeded6.i.i:                    ; preds = %_Dynamic_check.succeeded.i.i
  %idxprom.i.i = sext i32 %12 to i64
  %arrayidx.i.i = getelementptr inbounds [67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 %idxprom.i.i
  %_Dynamic_check.lower.i.i = icmp sgt i32 %12, -1
  %_Dynamic_check.upper.i.i = icmp ult %struct.TimerStruct** %arrayidx.i.i, getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 1, i64 0)
  %_Dynamic_check.range.i.i = and i1 %_Dynamic_check.lower.i.i, %_Dynamic_check.upper.i.i
  br i1 %_Dynamic_check.range.i.i, label %_Dynamic_check.succeeded8.i.i, label %_Dynamic_check.failed7.i.i

_Dynamic_check.succeeded8.i.i:                    ; preds = %_Dynamic_check.succeeded6.i.i
  %14 = load %struct.TimerStruct*, %struct.TimerStruct** %next6, align 8, !tbaa !2
  store %struct.TimerStruct* %14, %struct.TimerStruct** %arrayidx.i.i, align 8, !tbaa !2
  br label %_Dynamic_check.succeeded23.i.i

_Dynamic_check.failed7.i.i:                       ; preds = %_Dynamic_check.succeeded6.i.i
  tail call void @llvm.trap() #8
  unreachable

_Dynamic_check.succeeded11.i.i:                   ; preds = %_Dynamic_check.succeeded.i.i
  %15 = load %struct.TimerStruct*, %struct.TimerStruct** %next6, align 8, !tbaa !2
  %next20.i.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %13, i64 0, i32 6
  store %struct.TimerStruct* %15, %struct.TimerStruct** %next20.i.i, align 8, !tbaa !2
  br label %_Dynamic_check.succeeded23.i.i

_Dynamic_check.succeeded23.i.i:                   ; preds = %_Dynamic_check.succeeded11.i.i, %_Dynamic_check.succeeded8.i.i
  %16 = load %struct.TimerStruct*, %struct.TimerStruct** %next6, align 8, !tbaa !2
  %cmp25.not.i.i = icmp eq %struct.TimerStruct* %16, null
  br i1 %cmp25.not.i.i, label %tmr_cancel.exit, label %_Dynamic_check.succeeded29.i.i

_Dynamic_check.succeeded29.i.i:                   ; preds = %_Dynamic_check.succeeded23.i.i
  %17 = load %struct.TimerStruct*, %struct.TimerStruct** %prev.i.i, align 8, !tbaa !2
  %prev38.i.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %16, i64 0, i32 5
  store %struct.TimerStruct* %17, %struct.TimerStruct** %prev38.i.i, align 8, !tbaa !2
  br label %tmr_cancel.exit

tmr_cancel.exit:                                  ; preds = %_Dynamic_check.succeeded23.i.i, %_Dynamic_check.succeeded29.i.i
  %18 = load i32, i32* @active_count, align 4, !tbaa !6
  %dec.i = add nsw i32 %18, -1
  store i32 %dec.i, i32* @active_count, align 4, !tbaa !6
  %19 = load %struct.TimerStruct*, %struct.TimerStruct** @free_timers, align 8, !tbaa !2
  store %struct.TimerStruct* %19, %struct.TimerStruct** %next6, align 8, !tbaa !2
  store %struct.TimerStruct* %t.0120, %struct.TimerStruct** @free_timers, align 8, !tbaa !2
  %20 = load i32, i32* @free_count, align 4, !tbaa !6
  %inc.i = add nsw i32 %20, 1
  store i32 %inc.i, i32* @free_count, align 4, !tbaa !6
  store %struct.TimerStruct* null, %struct.TimerStruct** %prev.i.i, align 8, !tbaa !2
  br label %for.inc

for.inc:                                          ; preds = %if.end87, %tmr_cancel.exit
  %cmp2.not = icmp eq %struct.TimerStruct* %1, null
  br i1 %cmp2.not, label %for.inc89, label %_Dynamic_check.succeeded5, !llvm.loop !23

for.inc89:                                        ; preds = %_Dynamic_check.succeeded5, %_Dynamic_check.succeeded31, %for.inc, %_Dynamic_check.succeeded
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 67
  br i1 %exitcond.not, label %for.end90, label %_Dynamic_check.succeeded, !llvm.loop !24

for.end90:                                        ; preds = %for.inc89
  ret void
}

; Function Attrs: nounwind uwtable
define internal fastcc void @l_resort(%struct.TimerStruct* %t) unnamed_addr #0 {
entry:
  %_Dynamic_check.non_null.not.i = icmp eq %struct.TimerStruct* %t, null
  br i1 %_Dynamic_check.non_null.not.i, label %_Dynamic_check.failed.i, label %_Dynamic_check.succeeded.i

_Dynamic_check.succeeded.i:                       ; preds = %entry
  %hash.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t, i64 0, i32 7
  %0 = load i32, i32* %hash.i, align 8, !tbaa !22
  %prev.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t, i64 0, i32 5
  %1 = load %struct.TimerStruct*, %struct.TimerStruct** %prev.i, align 8, !tbaa !2
  %cmp.i = icmp eq %struct.TimerStruct* %1, null
  br i1 %cmp.i, label %_Dynamic_check.succeeded6.i, label %_Dynamic_check.succeeded11.i

_Dynamic_check.succeeded6.i:                      ; preds = %_Dynamic_check.succeeded.i
  %idxprom.i = sext i32 %0 to i64
  %arrayidx.i = getelementptr inbounds [67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 %idxprom.i
  %_Dynamic_check.lower.i = icmp sgt i32 %0, -1
  %_Dynamic_check.upper.i = icmp ult %struct.TimerStruct** %arrayidx.i, getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 1, i64 0)
  %_Dynamic_check.range.i = and i1 %_Dynamic_check.lower.i, %_Dynamic_check.upper.i
  br i1 %_Dynamic_check.range.i, label %_Dynamic_check.succeeded8.i, label %_Dynamic_check.failed7.i

_Dynamic_check.succeeded8.i:                      ; preds = %_Dynamic_check.succeeded6.i
  %next.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t, i64 0, i32 6
  %2 = load %struct.TimerStruct*, %struct.TimerStruct** %next.i, align 8, !tbaa !2
  store %struct.TimerStruct* %2, %struct.TimerStruct** %arrayidx.i, align 8, !tbaa !2
  br label %_Dynamic_check.succeeded23.i

_Dynamic_check.failed.i:                          ; preds = %entry
  tail call void @llvm.trap() #8
  unreachable

_Dynamic_check.failed7.i:                         ; preds = %_Dynamic_check.succeeded6.i
  tail call void @llvm.trap() #8
  unreachable

_Dynamic_check.succeeded11.i:                     ; preds = %_Dynamic_check.succeeded.i
  %next12.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t, i64 0, i32 6
  %3 = load %struct.TimerStruct*, %struct.TimerStruct** %next12.i, align 8, !tbaa !2
  %next20.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %1, i64 0, i32 6
  store %struct.TimerStruct* %3, %struct.TimerStruct** %next20.i, align 8, !tbaa !2
  br label %_Dynamic_check.succeeded23.i

_Dynamic_check.succeeded23.i:                     ; preds = %_Dynamic_check.succeeded11.i, %_Dynamic_check.succeeded8.i
  %next24.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t, i64 0, i32 6
  %4 = load %struct.TimerStruct*, %struct.TimerStruct** %next24.i, align 8, !tbaa !2
  %cmp25.not.i = icmp eq %struct.TimerStruct* %4, null
  br i1 %cmp25.not.i, label %_Dynamic_check.succeeded.i11, label %_Dynamic_check.succeeded29.i

_Dynamic_check.succeeded29.i:                     ; preds = %_Dynamic_check.succeeded23.i
  %5 = load %struct.TimerStruct*, %struct.TimerStruct** %prev.i, align 8, !tbaa !2
  %prev38.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %4, i64 0, i32 5
  store %struct.TimerStruct* %5, %struct.TimerStruct** %prev38.i, align 8, !tbaa !2
  br label %_Dynamic_check.succeeded.i11

_Dynamic_check.succeeded.i11:                     ; preds = %_Dynamic_check.succeeded29.i, %_Dynamic_check.succeeded23.i
  %tv_sec.i16 = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t, i64 0, i32 4, i32 0
  %6 = load i64, i64* %tv_sec.i16, align 8, !tbaa !16
  %tv_usec.i17 = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t, i64 0, i32 4, i32 1
  %7 = load i64, i64* %tv_usec.i17, align 8, !tbaa !18
  %xor7.i = xor i64 %7, %6
  %xor.i = trunc i64 %xor7.i to i32
  %rem.i = urem i32 %xor.i, 67
  store i32 %rem.i, i32* %hash.i, align 8, !tbaa !22
  %idxprom.i6 = zext i32 %rem.i to i64
  %arrayidx.i7 = getelementptr inbounds [67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 %idxprom.i6
  %_Dynamic_check.upper.i9 = icmp ult %struct.TimerStruct** %arrayidx.i7, getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 1, i64 0)
  br i1 %_Dynamic_check.upper.i9, label %_Dynamic_check.succeeded2.i, label %_Dynamic_check.failed1.i

_Dynamic_check.succeeded2.i:                      ; preds = %_Dynamic_check.succeeded.i11
  %8 = load %struct.TimerStruct*, %struct.TimerStruct** %arrayidx.i7, align 8, !tbaa !2
  %cmp.i12 = icmp eq %struct.TimerStruct* %8, null
  br i1 %cmp.i12, label %_Dynamic_check.succeeded9.i, label %_Dynamic_check.succeeded18.i

_Dynamic_check.succeeded9.i:                      ; preds = %_Dynamic_check.succeeded2.i
  store %struct.TimerStruct* %t, %struct.TimerStruct** %arrayidx.i7, align 8, !tbaa !2
  %9 = bitcast %struct.TimerStruct** %prev.i to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %9, i8 0, i64 16, i1 false) #7
  br label %l_add.exit

_Dynamic_check.failed1.i:                         ; preds = %_Dynamic_check.succeeded.i11
  tail call void @llvm.trap() #8
  unreachable

_Dynamic_check.succeeded18.i:                     ; preds = %_Dynamic_check.succeeded2.i
  %tv_sec23.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %8, i64 0, i32 4, i32 0
  %10 = load i64, i64* %tv_sec23.i, align 8, !tbaa !16
  %cmp24.i = icmp slt i64 %6, %10
  br i1 %cmp24.i, label %_Dynamic_check.succeeded53.i, label %_Dynamic_check.succeeded32.i

_Dynamic_check.succeeded32.i:                     ; preds = %_Dynamic_check.succeeded18.i
  %cmp35.i = icmp eq i64 %6, %10
  br i1 %cmp35.i, label %_Dynamic_check.succeeded42.i, label %_Dynamic_check.succeeded69.i

_Dynamic_check.succeeded42.i:                     ; preds = %_Dynamic_check.succeeded32.i
  %tv_usec44.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %8, i64 0, i32 4, i32 1
  %11 = load i64, i64* %tv_usec44.i, align 8, !tbaa !18
  %cmp45.not.i = icmp sgt i64 %7, %11
  br i1 %cmp45.not.i, label %_Dynamic_check.succeeded69.i, label %_Dynamic_check.succeeded53.i

_Dynamic_check.succeeded53.i:                     ; preds = %_Dynamic_check.succeeded42.i, %_Dynamic_check.succeeded18.i
  store %struct.TimerStruct* %t, %struct.TimerStruct** %arrayidx.i7, align 8, !tbaa !2
  store %struct.TimerStruct* null, %struct.TimerStruct** %prev.i, align 8, !tbaa !2
  store %struct.TimerStruct* %8, %struct.TimerStruct** %next24.i, align 8, !tbaa !2
  %prev65.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %8, i64 0, i32 5
  store %struct.TimerStruct* %t, %struct.TimerStruct** %prev65.i, align 8, !tbaa !2
  br label %l_add.exit

_Dynamic_check.succeeded69.i:                     ; preds = %_Dynamic_check.succeeded42.i, %_Dynamic_check.succeeded32.i
  %t2.0.in194.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %8, i64 0, i32 6
  %t2.0195.i = load %struct.TimerStruct*, %struct.TimerStruct** %t2.0.in194.i, align 8, !tbaa !2
  %cmp71.not196.i = icmp eq %struct.TimerStruct* %t2.0195.i, null
  br i1 %cmp71.not196.i, label %_Dynamic_check.succeeded130.i, label %_Dynamic_check.succeeded74.i.preheader

_Dynamic_check.succeeded74.i.preheader:           ; preds = %_Dynamic_check.succeeded69.i
  %tv_sec81.i22 = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t2.0195.i, i64 0, i32 4, i32 0
  %12 = load i64, i64* %tv_sec81.i22, align 8, !tbaa !16
  %cmp82.i23 = icmp slt i64 %6, %12
  br i1 %cmp82.i23, label %_Dynamic_check.succeeded110.i, label %_Dynamic_check.succeeded91.i

_Dynamic_check.succeeded74.i:                     ; preds = %_Dynamic_check.succeeded126.i
  %tv_sec81.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t2.0.i, i64 0, i32 4, i32 0
  %13 = load i64, i64* %tv_sec81.i, align 8, !tbaa !16
  %cmp82.i = icmp slt i64 %6, %13
  br i1 %cmp82.i, label %_Dynamic_check.succeeded110.i, label %_Dynamic_check.succeeded91.i, !llvm.loop !25

_Dynamic_check.succeeded91.i:                     ; preds = %_Dynamic_check.succeeded74.i.preheader, %_Dynamic_check.succeeded74.i
  %14 = phi i64 [ %13, %_Dynamic_check.succeeded74.i ], [ %12, %_Dynamic_check.succeeded74.i.preheader ]
  %t2prev.0197.i27 = phi %struct.TimerStruct* [ %t2.0199.i24, %_Dynamic_check.succeeded74.i ], [ %8, %_Dynamic_check.succeeded74.i.preheader ]
  %t2.0.in198.i26 = phi %struct.TimerStruct** [ %t2.0.in.i, %_Dynamic_check.succeeded74.i ], [ %t2.0.in194.i, %_Dynamic_check.succeeded74.i.preheader ]
  %t2.0199.i24 = phi %struct.TimerStruct* [ %t2.0.i, %_Dynamic_check.succeeded74.i ], [ %t2.0195.i, %_Dynamic_check.succeeded74.i.preheader ]
  %cmp94.i = icmp eq i64 %6, %14
  br i1 %cmp94.i, label %_Dynamic_check.succeeded103.i, label %_Dynamic_check.succeeded126.i

_Dynamic_check.succeeded103.i:                    ; preds = %_Dynamic_check.succeeded91.i
  %tv_usec105.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t2.0199.i24, i64 0, i32 4, i32 1
  %15 = load i64, i64* %tv_usec105.i, align 8, !tbaa !18
  %cmp106.not.i = icmp sgt i64 %7, %15
  br i1 %cmp106.not.i, label %_Dynamic_check.succeeded126.i, label %_Dynamic_check.succeeded110.i

_Dynamic_check.succeeded110.i:                    ; preds = %_Dynamic_check.succeeded74.i, %_Dynamic_check.succeeded103.i, %_Dynamic_check.succeeded74.i.preheader
  %t2.0199.i.lcssa = phi %struct.TimerStruct* [ %t2.0195.i, %_Dynamic_check.succeeded74.i.preheader ], [ %t2.0199.i24, %_Dynamic_check.succeeded103.i ], [ %t2.0.i, %_Dynamic_check.succeeded74.i ]
  %t2.0.in198.i.lcssa = phi %struct.TimerStruct** [ %t2.0.in194.i, %_Dynamic_check.succeeded74.i.preheader ], [ %t2.0.in198.i26, %_Dynamic_check.succeeded103.i ], [ %t2.0.in.i, %_Dynamic_check.succeeded74.i ]
  %t2prev.0197.i.lcssa = phi %struct.TimerStruct* [ %8, %_Dynamic_check.succeeded74.i.preheader ], [ %t2prev.0197.i27, %_Dynamic_check.succeeded103.i ], [ %t2.0199.i24, %_Dynamic_check.succeeded74.i ]
  store %struct.TimerStruct* %t, %struct.TimerStruct** %t2.0.in198.i.lcssa, align 8, !tbaa !2
  store %struct.TimerStruct* %t2prev.0197.i.lcssa, %struct.TimerStruct** %prev.i, align 8, !tbaa !2
  store %struct.TimerStruct* %t2.0199.i.lcssa, %struct.TimerStruct** %next24.i, align 8, !tbaa !2
  %prev123.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t2.0199.i.lcssa, i64 0, i32 5
  store %struct.TimerStruct* %t, %struct.TimerStruct** %prev123.i, align 8, !tbaa !2
  br label %l_add.exit

_Dynamic_check.succeeded126.i:                    ; preds = %_Dynamic_check.succeeded103.i, %_Dynamic_check.succeeded91.i
  %t2.0.in.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t2.0199.i24, i64 0, i32 6
  %t2.0.i = load %struct.TimerStruct*, %struct.TimerStruct** %t2.0.in.i, align 8, !tbaa !2
  %cmp71.not.i = icmp eq %struct.TimerStruct* %t2.0.i, null
  br i1 %cmp71.not.i, label %_Dynamic_check.succeeded130.i, label %_Dynamic_check.succeeded74.i, !llvm.loop !25

_Dynamic_check.succeeded130.i:                    ; preds = %_Dynamic_check.succeeded126.i, %_Dynamic_check.succeeded69.i
  %t2prev.0.lcssa.i = phi %struct.TimerStruct* [ %8, %_Dynamic_check.succeeded69.i ], [ %t2.0199.i24, %_Dynamic_check.succeeded126.i ]
  %t2.0.in.lcssa.i = phi %struct.TimerStruct** [ %t2.0.in194.i, %_Dynamic_check.succeeded69.i ], [ %t2.0.in.i, %_Dynamic_check.succeeded126.i ]
  store %struct.TimerStruct* %t, %struct.TimerStruct** %t2.0.in.lcssa.i, align 8, !tbaa !2
  store %struct.TimerStruct* %t2prev.0.lcssa.i, %struct.TimerStruct** %prev.i, align 8, !tbaa !2
  store %struct.TimerStruct* null, %struct.TimerStruct** %next24.i, align 8, !tbaa !2
  br label %l_add.exit

l_add.exit:                                       ; preds = %_Dynamic_check.succeeded9.i, %_Dynamic_check.succeeded53.i, %_Dynamic_check.succeeded110.i, %_Dynamic_check.succeeded130.i
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @tmr_cancel(%struct.TimerStruct* %t) local_unnamed_addr #0 {
entry:
  %_Dynamic_check.non_null.not.i = icmp eq %struct.TimerStruct* %t, null
  br i1 %_Dynamic_check.non_null.not.i, label %_Dynamic_check.failed.i, label %_Dynamic_check.succeeded.i

_Dynamic_check.succeeded.i:                       ; preds = %entry
  %hash.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t, i64 0, i32 7
  %0 = load i32, i32* %hash.i, align 8, !tbaa !22
  %prev.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t, i64 0, i32 5
  %1 = load %struct.TimerStruct*, %struct.TimerStruct** %prev.i, align 8, !tbaa !2
  %cmp.i = icmp eq %struct.TimerStruct* %1, null
  br i1 %cmp.i, label %_Dynamic_check.succeeded6.i, label %_Dynamic_check.succeeded11.i

_Dynamic_check.succeeded6.i:                      ; preds = %_Dynamic_check.succeeded.i
  %idxprom.i = sext i32 %0 to i64
  %arrayidx.i = getelementptr inbounds [67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 %idxprom.i
  %_Dynamic_check.lower.i = icmp sgt i32 %0, -1
  %_Dynamic_check.upper.i = icmp ult %struct.TimerStruct** %arrayidx.i, getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 1, i64 0)
  %_Dynamic_check.range.i = and i1 %_Dynamic_check.lower.i, %_Dynamic_check.upper.i
  br i1 %_Dynamic_check.range.i, label %_Dynamic_check.succeeded8.i, label %_Dynamic_check.failed7.i

_Dynamic_check.succeeded8.i:                      ; preds = %_Dynamic_check.succeeded6.i
  %next.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t, i64 0, i32 6
  %2 = load %struct.TimerStruct*, %struct.TimerStruct** %next.i, align 8, !tbaa !2
  store %struct.TimerStruct* %2, %struct.TimerStruct** %arrayidx.i, align 8, !tbaa !2
  br label %_Dynamic_check.succeeded23.i

_Dynamic_check.failed.i:                          ; preds = %entry
  tail call void @llvm.trap() #8
  unreachable

_Dynamic_check.failed7.i:                         ; preds = %_Dynamic_check.succeeded6.i
  tail call void @llvm.trap() #8
  unreachable

_Dynamic_check.succeeded11.i:                     ; preds = %_Dynamic_check.succeeded.i
  %next12.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t, i64 0, i32 6
  %3 = load %struct.TimerStruct*, %struct.TimerStruct** %next12.i, align 8, !tbaa !2
  %next20.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %1, i64 0, i32 6
  store %struct.TimerStruct* %3, %struct.TimerStruct** %next20.i, align 8, !tbaa !2
  br label %_Dynamic_check.succeeded23.i

_Dynamic_check.succeeded23.i:                     ; preds = %_Dynamic_check.succeeded11.i, %_Dynamic_check.succeeded8.i
  %next24.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %t, i64 0, i32 6
  %4 = load %struct.TimerStruct*, %struct.TimerStruct** %next24.i, align 8, !tbaa !2
  %cmp25.not.i = icmp eq %struct.TimerStruct* %4, null
  br i1 %cmp25.not.i, label %_Dynamic_check.succeeded, label %_Dynamic_check.succeeded29.i

_Dynamic_check.succeeded29.i:                     ; preds = %_Dynamic_check.succeeded23.i
  %5 = load %struct.TimerStruct*, %struct.TimerStruct** %prev.i, align 8, !tbaa !2
  %prev38.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %4, i64 0, i32 5
  store %struct.TimerStruct* %5, %struct.TimerStruct** %prev38.i, align 8, !tbaa !2
  br label %_Dynamic_check.succeeded

_Dynamic_check.succeeded:                         ; preds = %_Dynamic_check.succeeded29.i, %_Dynamic_check.succeeded23.i
  %6 = load i32, i32* @active_count, align 4, !tbaa !6
  %dec = add nsw i32 %6, -1
  store i32 %dec, i32* @active_count, align 4, !tbaa !6
  %7 = load %struct.TimerStruct*, %struct.TimerStruct** @free_timers, align 8, !tbaa !2
  store %struct.TimerStruct* %7, %struct.TimerStruct** %next24.i, align 8, !tbaa !2
  store %struct.TimerStruct* %t, %struct.TimerStruct** @free_timers, align 8, !tbaa !2
  %8 = load i32, i32* @free_count, align 4, !tbaa !6
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* @free_count, align 4, !tbaa !6
  store %struct.TimerStruct* null, %struct.TimerStruct** %prev.i, align 8, !tbaa !2
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @tmr_reset(%struct.timeval* readonly %nowP, %struct.TimerStruct* %t) local_unnamed_addr #0 {
entry:
  %_Dynamic_check.non_null.not = icmp eq %struct.TimerStruct* %t, null
  br i1 %_Dynamic_check.non_null.not, label %_Dynamic_check.failed, label %_Dynamic_check.succeeded

_Dynamic_check.succeeded:                         ; preds = %entry
  %_Dynamic_check.non_null1.not = icmp eq %struct.timeval* %nowP, null
  call void @llvm.assume(i1 %_Dynamic_check.non_null1.not)
  tail call void @llvm.trap() #8
  unreachable

_Dynamic_check.failed:                            ; preds = %entry
  tail call void @llvm.trap() #8
  unreachable
}

; Function Attrs: nounwind uwtable willreturn
define dso_local void @tmr_cleanup() local_unnamed_addr #3 {
while.cond:
  %0 = load %struct.TimerStruct*, %struct.TimerStruct** @free_timers, align 8, !tbaa !2
  %cmp.not = icmp eq %struct.TimerStruct* %0, null
  call void @llvm.assume(i1 %cmp.not)
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @tmr_term() local_unnamed_addr #0 {
entry:
  br label %_Dynamic_check.succeeded.preheader

_Dynamic_check.succeeded.preheader:               ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %arrayidx = getelementptr inbounds [67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 %indvars.iv
  %_Dynamic_check.upper = icmp ult %struct.TimerStruct** %arrayidx, getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 1, i64 0)
  br label %_Dynamic_check.succeeded

_Dynamic_check.succeeded:                         ; preds = %_Dynamic_check.succeeded.preheader, %tmr_cancel.exit
  %0 = load %struct.TimerStruct*, %struct.TimerStruct** %arrayidx, align 8, !tbaa !2
  %cmp1.not = icmp eq %struct.TimerStruct* %0, null
  br i1 %cmp1.not, label %for.inc, label %_Dynamic_check.succeeded.i.i

_Dynamic_check.succeeded.i.i:                     ; preds = %_Dynamic_check.succeeded
  %hash.i.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %0, i64 0, i32 7
  %1 = load i32, i32* %hash.i.i, align 8, !tbaa !22
  %prev.i.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %0, i64 0, i32 5
  %2 = load %struct.TimerStruct*, %struct.TimerStruct** %prev.i.i, align 8, !tbaa !2
  %cmp.i.i = icmp eq %struct.TimerStruct* %2, null
  br i1 %cmp.i.i, label %_Dynamic_check.succeeded6.i.i, label %_Dynamic_check.succeeded11.i.i

_Dynamic_check.succeeded6.i.i:                    ; preds = %_Dynamic_check.succeeded.i.i
  %idxprom.i.i = sext i32 %1 to i64
  %arrayidx.i.i = getelementptr inbounds [67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 0, i64 %idxprom.i.i
  %_Dynamic_check.lower.i.i = icmp sgt i32 %1, -1
  %_Dynamic_check.upper.i.i = icmp ult %struct.TimerStruct** %arrayidx.i.i, getelementptr inbounds ([67 x %struct.TimerStruct*], [67 x %struct.TimerStruct*]* @timers, i64 1, i64 0)
  %_Dynamic_check.range.i.i = and i1 %_Dynamic_check.lower.i.i, %_Dynamic_check.upper.i.i
  br i1 %_Dynamic_check.range.i.i, label %_Dynamic_check.succeeded8.i.i, label %_Dynamic_check.failed7.i.i

_Dynamic_check.succeeded8.i.i:                    ; preds = %_Dynamic_check.succeeded6.i.i
  %next.i.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %0, i64 0, i32 6
  %3 = load %struct.TimerStruct*, %struct.TimerStruct** %next.i.i, align 8, !tbaa !2
  store %struct.TimerStruct* %3, %struct.TimerStruct** %arrayidx.i.i, align 8, !tbaa !2
  br label %_Dynamic_check.succeeded23.i.i

_Dynamic_check.failed7.i.i:                       ; preds = %_Dynamic_check.succeeded6.i.i
  tail call void @llvm.trap() #8
  unreachable

_Dynamic_check.succeeded11.i.i:                   ; preds = %_Dynamic_check.succeeded.i.i
  %next12.i.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %0, i64 0, i32 6
  %4 = load %struct.TimerStruct*, %struct.TimerStruct** %next12.i.i, align 8, !tbaa !2
  %next20.i.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %2, i64 0, i32 6
  store %struct.TimerStruct* %4, %struct.TimerStruct** %next20.i.i, align 8, !tbaa !2
  br label %_Dynamic_check.succeeded23.i.i

_Dynamic_check.succeeded23.i.i:                   ; preds = %_Dynamic_check.succeeded11.i.i, %_Dynamic_check.succeeded8.i.i
  %next24.i.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %0, i64 0, i32 6
  %5 = load %struct.TimerStruct*, %struct.TimerStruct** %next24.i.i, align 8, !tbaa !2
  %cmp25.not.i.i = icmp eq %struct.TimerStruct* %5, null
  br i1 %cmp25.not.i.i, label %tmr_cancel.exit, label %_Dynamic_check.succeeded29.i.i

_Dynamic_check.succeeded29.i.i:                   ; preds = %_Dynamic_check.succeeded23.i.i
  %6 = load %struct.TimerStruct*, %struct.TimerStruct** %prev.i.i, align 8, !tbaa !2
  %prev38.i.i = getelementptr inbounds %struct.TimerStruct, %struct.TimerStruct* %5, i64 0, i32 5
  store %struct.TimerStruct* %6, %struct.TimerStruct** %prev38.i.i, align 8, !tbaa !2
  br label %tmr_cancel.exit

tmr_cancel.exit:                                  ; preds = %_Dynamic_check.succeeded23.i.i, %_Dynamic_check.succeeded29.i.i
  %7 = load i32, i32* @active_count, align 4, !tbaa !6
  %dec.i = add nsw i32 %7, -1
  store i32 %dec.i, i32* @active_count, align 4, !tbaa !6
  %8 = load %struct.TimerStruct*, %struct.TimerStruct** @free_timers, align 8, !tbaa !2
  store %struct.TimerStruct* %8, %struct.TimerStruct** %next24.i.i, align 8, !tbaa !2
  store %struct.TimerStruct* %0, %struct.TimerStruct** @free_timers, align 8, !tbaa !2
  %9 = load i32, i32* @free_count, align 4, !tbaa !6
  %inc.i = add nsw i32 %9, 1
  store i32 %inc.i, i32* @free_count, align 4, !tbaa !6
  store %struct.TimerStruct* null, %struct.TimerStruct** %prev.i.i, align 8, !tbaa !2
  br i1 %_Dynamic_check.upper, label %_Dynamic_check.succeeded, label %_Dynamic_check.failed, !llvm.loop !26

_Dynamic_check.failed:                            ; preds = %tmr_cancel.exit
  tail call void @llvm.trap() #8
  unreachable

for.inc:                                          ; preds = %_Dynamic_check.succeeded
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 67
  br i1 %exitcond.not, label %for.end, label %_Dynamic_check.succeeded.preheader, !llvm.loop !27

for.end:                                          ; preds = %for.inc
  %10 = load %struct.TimerStruct*, %struct.TimerStruct** @free_timers, align 8, !tbaa !2
  %cmp.not.i = icmp eq %struct.TimerStruct* %10, null
  tail call void @llvm.assume(i1 %cmp.not.i) #7
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @tmr_logstats(i64 %secs) local_unnamed_addr #0 {
entry:
  %0 = load i32, i32* @active_count, align 4, !tbaa !6
  %1 = load i32, i32* @free_count, align 4, !tbaa !6
  tail call void (i32, i8*, ...) @syslog(i32 5, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i64 0, i64 0), i32 0, i32 %0, i32 %1) #7
  unreachable
}

; Function Attrs: noreturn
declare dso_local void @syslog(i32, i8*, ...) local_unnamed_addr #4

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #6

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { cold noreturn nounwind }
attributes #2 = { nofree noreturn nounwind "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable willreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #6 = { nofree nosync nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0 (https://github.com/arunkumarbhattar/CheckCBox_Compiler.git 4662b53f5430220537b911f7ed7b6c0da47f272b)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
!8 = !{}
!9 = !{i64 0, i64 8, !2, i64 0, i64 4, !6, i64 0, i64 8, !10}
!10 = !{!11, !11, i64 0}
!11 = !{!"long", !4, i64 0}
!12 = !{!13, !11, i64 16}
!13 = !{!"TimerStruct", !3, i64 0, !4, i64 8, !11, i64 16, !7, i64 24, !14, i64 32, !3, i64 48, !3, i64 56, !7, i64 64}
!14 = !{!"timeval", !11, i64 0, !11, i64 8}
!15 = !{!13, !7, i64 24}
!16 = !{!13, !11, i64 32}
!17 = !{!14, !11, i64 0}
!18 = !{!13, !11, i64 40}
!19 = !{!14, !11, i64 8}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = !{!13, !7, i64 64}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !21}
!25 = distinct !{!25, !21}
!26 = distinct !{!26, !21}
!27 = distinct !{!27, !21}
