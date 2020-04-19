; ModuleID = 'W:/Desktop/kmeans/kmeans/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@kmeans_str = internal unnamed_addr constant [7 x i8] c"kmeans\00"

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define void @kmeans([65536 x i16]* %image_in, [65536 x i16]* %final) nounwind {
  call void (...)* @_ssdm_op_SpecBitsMap([65536 x i16]* %image_in) nounwind, !map !7
  call void (...)* @_ssdm_op_SpecBitsMap([65536 x i16]* %final) nounwind, !map !13
  call void (...)* @_ssdm_op_SpecTopModule([7 x i8]* @kmeans_str) nounwind
  %empty = alloca [65536 x i16], align 2
  %empty_3 = alloca [65536 x i16], align 2
  %empty_4 = alloca [65536 x i16], align 2
  %empty_5 = alloca [65536 x i16], align 2
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.preheader40
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %0
  %s = phi i9 [ 0, %0 ], [ %s_1, %.loopexit.loopexit ]
  %exitcond1 = icmp eq i9 %s, -256
  %empty_6 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 256, i64 256, i64 256) nounwind
  %s_1 = add i9 %s, 1
  br i1 %exitcond1, label %.preheader39.preheader, label %.preheader40.preheader

.preheader39.preheader:                           ; preds = %.loopexit
  %cluster = alloca i16
  %ab_3_6 = alloca i16
  %ab_3_9 = alloca i16
  %ab_3_10 = alloca i16
  %ab_3_11 = alloca i16
  store i16 0, i16* %cluster
  br label %.preheader39

.preheader40.preheader:                           ; preds = %.loopexit
  %tmp_2 = trunc i9 %s to i8
  %tmp_1 = call i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8 %tmp_2, i8 0)
  br label %.preheader40

.preheader40:                                     ; preds = %1, %.preheader40.preheader
  %t = phi i9 [ %t_1, %1 ], [ 0, %.preheader40.preheader ]
  %t_cast = zext i9 %t to i16
  %exitcond3 = icmp eq i9 %t, -256
  %empty_7 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 256, i64 256, i64 256) nounwind
  %t_1 = add i9 %t, 1
  br i1 %exitcond3, label %.loopexit.loopexit, label %1

; <label>:1                                       ; preds = %.preheader40
  %p_sum1 = add i16 %tmp_1, %t_cast
  %p_sum1_cast = zext i16 %p_sum1 to i32
  %p_addr = getelementptr inbounds [65536 x i16]* %empty, i32 0, i32 %p_sum1_cast
  store i16 0, i16* %p_addr, align 2
  %p_addr_1 = getelementptr inbounds [65536 x i16]* %empty_3, i32 0, i32 %p_sum1_cast
  store i16 0, i16* %p_addr_1, align 2
  %p_addr_2 = getelementptr inbounds [65536 x i16]* %empty_4, i32 0, i32 %p_sum1_cast
  store i16 0, i16* %p_addr_2, align 2
  %p_addr_3 = getelementptr inbounds [65536 x i16]* %empty_5, i32 0, i32 %p_sum1_cast
  store i16 0, i16* %p_addr_3, align 2
  br label %.preheader40

.preheader39.loopexit:                            ; preds = %.preheader38
  br label %.preheader39

.preheader39:                                     ; preds = %.preheader39.loopexit, %.preheader39.preheader
  %i = phi i9 [ 0, %.preheader39.preheader ], [ %i_1, %.preheader39.loopexit ]
  %exitcond2 = icmp eq i9 %i, -256
  %empty_8 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 256, i64 256, i64 256) nounwind
  %i_1 = add i9 %i, 1
  br i1 %exitcond2, label %.preheader36.preheader, label %.preheader38.preheader

.preheader36.preheader:                           ; preds = %.preheader39
  br label %.preheader36

.preheader38.preheader:                           ; preds = %.preheader39
  %tmp_6 = call i17 @_ssdm_op_BitConcatenate.i17.i9.i8(i9 %i, i8 0)
  %tmp_21_cast = zext i17 %tmp_6 to i18
  %tmp_5 = trunc i9 %i to i8
  %tmp_3 = call i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8 %tmp_5, i8 0)
  br label %.preheader38

.preheader38:                                     ; preds = %._crit_edge44, %.preheader38.preheader
  %j = phi i9 [ 0, %.preheader38.preheader ], [ %j_1, %._crit_edge44 ]
  %exitcond5 = icmp eq i9 %j, -256
  %empty_9 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 256, i64 256, i64 256) nounwind
  %j_1 = add i9 %j, 1
  br i1 %exitcond5, label %.preheader39.loopexit, label %2

; <label>:2                                       ; preds = %.preheader38
  %tmp_cast1 = zext i9 %j to i18
  %tmp_21 = add i18 %tmp_21_cast, %tmp_cast1
  %tmp_26_cast = zext i18 %tmp_21 to i32
  %image_in_addr = getelementptr [65536 x i16]* %image_in, i32 0, i32 %tmp_26_cast
  %tmp_cast = zext i9 %j to i16
  %r = load i16* %image_in_addr, align 2
  %tmp_4 = sext i16 %r to i32
  br label %3

; <label>:3                                       ; preds = %_ifconv, %2
  %p = phi i3 [ 0, %2 ], [ %p_1, %_ifconv ]
  %min_1 = load i16* %ab_3_6
  %exitcond8 = icmp eq i3 %p, -4
  %empty_10 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4) nounwind
  %p_1 = add i3 %p, 1
  br i1 %exitcond8, label %.preheader50.preheader, label %_ifconv

.preheader50.preheader:                           ; preds = %3
  br label %.preheader50

_ifconv:                                          ; preds = %3
  %ab_3_9_load = load i16* %ab_3_9
  %ab_3_10_load = load i16* %ab_3_10
  %ab_3_11_load = load i16* %ab_3_11
  %tmp_23 = trunc i3 %p to i2
  %tmp = call i32 @_ssdm_op_Mux.ap_auto.4i32.i2(i32 5, i32 40, i32 80, i32 180, i2 %tmp_23) nounwind
  %tmp_8 = sub nsw i32 %tmp_4, %tmp
  %tmp_24 = trunc i32 %tmp_8 to i16
  %abscond = icmp sgt i32 %tmp_8, 0
  %tmp_11 = sub i16 0, %tmp_24
  %ab_0 = select i1 %abscond, i16 %tmp_24, i16 %tmp_11
  %sel_tmp = icmp eq i2 %tmp_23, -2
  %ab_3 = select i1 %sel_tmp, i16 %ab_3_11_load, i16 %ab_0
  %sel_tmp2 = icmp eq i2 %tmp_23, 1
  %ab_3_1 = select i1 %sel_tmp2, i16 %ab_3_11_load, i16 %ab_3
  %sel_tmp4 = icmp eq i2 %tmp_23, 0
  %ab_3_2 = select i1 %sel_tmp4, i16 %ab_3_11_load, i16 %ab_3_1
  %ab_3_3 = select i1 %sel_tmp, i16 %ab_0, i16 %ab_3_10_load
  %ab_3_4 = select i1 %sel_tmp2, i16 %ab_3_10_load, i16 %ab_3_3
  %ab_3_5 = select i1 %sel_tmp4, i16 %ab_3_10_load, i16 %ab_3_4
  %ab_3_7 = select i1 %sel_tmp2, i16 %ab_0, i16 %ab_3_9_load
  %ab_3_8 = select i1 %sel_tmp4, i16 %ab_3_9_load, i16 %ab_3_7
  %ab_3_14 = select i1 %sel_tmp4, i16 %ab_0, i16 %min_1
  store i16 %ab_3_2, i16* %ab_3_11
  store i16 %ab_3_5, i16* %ab_3_10
  store i16 %ab_3_8, i16* %ab_3_9
  store i16 %ab_3_14, i16* %ab_3_6
  br label %3

.preheader50:                                     ; preds = %.preheader50.preheader, %_ifconv24
  %min1 = phi i16 [ %min_2_phi_min1, %_ifconv24 ], [ %min_1, %.preheader50.preheader ]
  %cluster_1 = phi i3 [ %p_2, %_ifconv24 ], [ 1, %.preheader50.preheader ]
  %cluster_3_cast = zext i3 %cluster_1 to i16
  %exitcond9 = icmp eq i3 %cluster_1, -4
  %empty_11 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3) nounwind
  br i1 %exitcond9, label %4, label %_ifconv24

_ifconv24:                                        ; preds = %.preheader50
  %cluster_load_1 = load i16* %cluster
  %ab_3_9_load_1 = load i16* %ab_3_9
  %ab_3_10_load_1 = load i16* %ab_3_10
  %ab_3_11_load_1 = load i16* %ab_3_11
  %tmp_25 = trunc i3 %cluster_1 to i2
  %sel_tmp3 = icmp eq i2 %tmp_25, -2
  %ab_3_15 = select i1 %sel_tmp3, i16 %ab_3_10_load_1, i16 %ab_3_11_load_1
  %sel_tmp6 = icmp eq i2 %tmp_25, 1
  %ab_3_17 = select i1 %sel_tmp6, i16 %ab_3_9_load_1, i16 %ab_3_15
  %tmp_15 = icmp slt i16 %ab_3_17, %min1
  %cluster_4_cluster_2 = select i1 %tmp_15, i16 %cluster_3_cast, i16 %cluster_load_1
  %min_2_phi_min1 = select i1 %tmp_15, i16 %ab_3_17, i16 %min1
  %p_2 = add i3 1, %cluster_1
  store i16 %cluster_4_cluster_2, i16* %cluster
  br label %.preheader50

; <label>:4                                       ; preds = %.preheader50
  %cluster_load = load i16* %cluster
  %tmp_14 = icmp eq i16 %cluster_load, 0
  br i1 %tmp_14, label %5, label %._crit_edge41

; <label>:5                                       ; preds = %4
  %p_sum3 = add i16 %tmp_3, %tmp_cast
  %p_sum3_cast = zext i16 %p_sum3 to i32
  %p_addr_7 = getelementptr inbounds [65536 x i16]* %empty, i32 0, i32 %p_sum3_cast
  store i16 %r, i16* %p_addr_7, align 2
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %5, %4
  %cluster_load_2 = load i16* %cluster
  %tmp_17 = icmp eq i16 %cluster_load_2, 1
  br i1 %tmp_17, label %6, label %._crit_edge42

; <label>:6                                       ; preds = %._crit_edge41
  %p_sum4 = add i16 %tmp_3, %tmp_cast
  %p_sum4_cast = zext i16 %p_sum4 to i32
  %p_addr_9 = getelementptr inbounds [65536 x i16]* %empty_3, i32 0, i32 %p_sum4_cast
  store i16 %r, i16* %p_addr_9, align 2
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %6, %._crit_edge41
  %cluster_load_3 = load i16* %cluster
  %tmp_19 = icmp eq i16 %cluster_load_3, 2
  br i1 %tmp_19, label %7, label %._crit_edge43

; <label>:7                                       ; preds = %._crit_edge42
  %p_sum5 = add i16 %tmp_3, %tmp_cast
  %p_sum5_cast = zext i16 %p_sum5 to i32
  %p_addr_10 = getelementptr inbounds [65536 x i16]* %empty_4, i32 0, i32 %p_sum5_cast
  store i16 %r, i16* %p_addr_10, align 2
  br label %._crit_edge43

._crit_edge43:                                    ; preds = %7, %._crit_edge42
  %cluster_load_4 = load i16* %cluster
  %tmp_20 = icmp eq i16 %cluster_load_4, 3
  br i1 %tmp_20, label %8, label %._crit_edge44

; <label>:8                                       ; preds = %._crit_edge43
  %p_sum6 = add i16 %tmp_3, %tmp_cast
  %p_sum6_cast = zext i16 %p_sum6 to i32
  %p_addr_11 = getelementptr inbounds [65536 x i16]* %empty_5, i32 0, i32 %p_sum6_cast
  store i16 %r, i16* %p_addr_11, align 2
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %8, %._crit_edge43
  br label %.preheader38

.preheader36.loopexit:                            ; preds = %.preheader
  br label %.preheader36

.preheader36:                                     ; preds = %.preheader36.preheader, %.preheader36.loopexit
  %l = phi i9 [ %l_1, %.preheader36.loopexit ], [ 0, %.preheader36.preheader ]
  %exitcond6 = icmp eq i9 %l, -256
  %empty_12 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 256, i64 256, i64 256) nounwind
  %l_1 = add i9 %l, 1
  br i1 %exitcond6, label %14, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader36
  %tmp_s = call i17 @_ssdm_op_BitConcatenate.i17.i9.i8(i9 %l, i8 0)
  %tmp_24_cast = zext i17 %tmp_s to i18
  %tmp_10 = trunc i9 %l to i8
  %tmp_9 = call i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8 %tmp_10, i8 0)
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge48, %.preheader.preheader
  %q = phi i9 [ %q_1, %._crit_edge48 ], [ 0, %.preheader.preheader ]
  %exitcond = icmp eq i9 %q, -256
  %empty_13 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 256, i64 256, i64 256) nounwind
  %q_1 = add i9 %q, 1
  br i1 %exitcond, label %.preheader36.loopexit, label %9

; <label>:9                                       ; preds = %.preheader
  %tmp_5_cast = zext i9 %q to i18
  %tmp_22 = add i18 %tmp_24_cast, %tmp_5_cast
  %tmp_27_cast = zext i18 %tmp_22 to i32
  %final_addr = getelementptr [65536 x i16]* %final, i32 0, i32 %tmp_27_cast
  %tmp_11_cast = zext i9 %q to i16
  %p_sum = add i16 %tmp_11_cast, %tmp_9
  %p_sum_cast = zext i16 %p_sum to i32
  %p_addr_4 = getelementptr inbounds [65536 x i16]* %empty, i32 0, i32 %p_sum_cast
  %empty_14 = load i16* %p_addr_4, align 2
  %tmp_7 = icmp sgt i16 %empty_14, 0
  br i1 %tmp_7, label %10, label %._crit_edge45

; <label>:10                                      ; preds = %9
  store i16 50, i16* %p_addr_4, align 2
  br label %._crit_edge45

._crit_edge45:                                    ; preds = %10, %9
  %p_addr_5 = getelementptr inbounds [65536 x i16]* %empty_3, i32 0, i32 %p_sum_cast
  %empty_15 = load i16* %p_addr_5, align 2
  %tmp_12 = icmp sgt i16 %empty_15, 0
  br i1 %tmp_12, label %11, label %._crit_edge46

; <label>:11                                      ; preds = %._crit_edge45
  store i16 70, i16* %p_addr_5, align 2
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %11, %._crit_edge45
  %p_addr_6 = getelementptr inbounds [65536 x i16]* %empty_4, i32 0, i32 %p_sum_cast
  %empty_16 = load i16* %p_addr_6, align 2
  %tmp_13 = icmp sgt i16 %empty_16, 0
  br i1 %tmp_13, label %12, label %._crit_edge47

; <label>:12                                      ; preds = %._crit_edge46
  store i16 40, i16* %p_addr_6, align 2
  br label %._crit_edge47

._crit_edge47:                                    ; preds = %12, %._crit_edge46
  %p_addr_8 = getelementptr inbounds [65536 x i16]* %empty_5, i32 0, i32 %p_sum_cast
  %empty_17 = load i16* %p_addr_8, align 2
  %tmp_16 = icmp sgt i16 %empty_17, 0
  br i1 %tmp_16, label %13, label %._crit_edge48

; <label>:13                                      ; preds = %._crit_edge47
  store i16 220, i16* %p_addr_8, align 2
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %13, %._crit_edge47
  %empty_18 = load i16* %p_addr_4, align 2
  %empty_19 = load i16* %p_addr_5, align 2
  %empty_20 = load i16* %p_addr_6, align 2
  %empty_21 = load i16* %p_addr_8, align 2
  %tmp1 = add i16 %empty_19, %empty_18
  %tmp2 = add i16 %empty_20, %empty_21
  %tmp_18 = add i16 %tmp2, %tmp1
  store i16 %tmp_18, i16* %final_addr, align 2
  br label %.preheader

; <label>:14                                      ; preds = %.preheader36
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

declare i8 @_ssdm_op_PartSelect.i8.i9.i32.i32(i9, i32, i32) nounwind readnone

declare i2 @_ssdm_op_PartSelect.i2.i3.i32.i32(i3, i32, i32) nounwind readnone

declare i16 @_ssdm_op_PartSelect.i16.i32.i32.i32(i32, i32, i32) nounwind readnone

define weak i32 @_ssdm_op_Mux.ap_auto.4i32.i2(i32, i32, i32, i32, i2) {
entry:
  switch i2 %4, label %case3 [
    i2 0, label %case0
    i2 1, label %case1
    i2 -2, label %case2
  ]

case0:                                            ; preds = %case3, %case2, %case1, %entry
  %merge = phi i32 [ %0, %entry ], [ %1, %case1 ], [ %2, %case2 ], [ %3, %case3 ]
  ret i32 %merge

case1:                                            ; preds = %entry
  br label %case0

case2:                                            ; preds = %entry
  br label %case0

case3:                                            ; preds = %entry
  br label %case0
}

define weak i17 @_ssdm_op_BitConcatenate.i17.i9.i8(i9, i8) nounwind readnone {
entry:
  %empty = zext i9 %0 to i17
  %empty_22 = zext i8 %1 to i17
  %empty_23 = shl i17 %empty, 8
  %empty_24 = or i17 %empty_23, %empty_22
  ret i17 %empty_24
}

define weak i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8, i8) nounwind readnone {
entry:
  %empty = zext i8 %0 to i16
  %empty_25 = zext i8 %1 to i16
  %empty_26 = shl i16 %empty, 8
  %empty_27 = or i16 %empty_26, %empty_25
  ret i16 %empty_27
}

!opencl.kernels = !{!0}
!hls.encrypted.func = !{}
!llvm.map.gv = !{}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"short [256]*", metadata !"short [256]*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"image_in", metadata !"final"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{metadata !8}
!8 = metadata !{i32 0, i32 15, metadata !9}
!9 = metadata !{metadata !10}
!10 = metadata !{metadata !"image_in", metadata !11, metadata !"short", i32 0, i32 15}
!11 = metadata !{metadata !12, metadata !12}
!12 = metadata !{i32 0, i32 255, i32 1}
!13 = metadata !{metadata !14}
!14 = metadata !{i32 0, i32 15, metadata !15}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !"final", metadata !11, metadata !"short", i32 0, i32 15}
