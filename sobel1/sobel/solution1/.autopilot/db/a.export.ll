; ModuleID = 'W:/Desktop/sobel1/sobel/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@sobel_str = internal unnamed_addr constant [6 x i8] c"sobel\00"

define void @sobel([65536 x i32]* %input_image, [65536 x i32]* %output_image) nounwind {
  call void (...)* @_ssdm_op_SpecBitsMap([65536 x i32]* %input_image) nounwind, !map !7
  call void (...)* @_ssdm_op_SpecBitsMap([65536 x i32]* %output_image) nounwind, !map !13
  call void (...)* @_ssdm_op_SpecTopModule([6 x i8]* @sobel_str) nounwind
  %image = alloca [65536 x i32], align 4
  %image_addr = getelementptr [65536 x i32]* %image, i32 0, i32 257
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.preheader10
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %0
  %i = phi i9 [ 0, %0 ], [ %i_1, %.loopexit.loopexit ]
  %tmp_s = call i17 @_ssdm_op_BitConcatenate.i17.i9.i8(i9 %i, i8 0)
  %tmp_3 = zext i17 %tmp_s to i32
  %tmp_26_cast = zext i17 %tmp_s to i18
  %output_image_addr_3 = getelementptr [65536 x i32]* %output_image, i32 0, i32 %tmp_3
  %tmp_10 = or i17 %tmp_s, 255
  %tmp_15 = call i32 @_ssdm_op_BitConcatenate.i32.i15.i17(i15 0, i17 %tmp_10)
  %output_image_addr_4 = getelementptr [65536 x i32]* %output_image, i32 0, i32 %tmp_15
  %exitcond5 = icmp eq i9 %i, -256
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 256, i64 256, i64 256) nounwind
  %i_1 = add i9 %i, 1
  br i1 %exitcond5, label %7, label %.preheader10.preheader

.preheader10.preheader:                           ; preds = %.loopexit
  %tmp = icmp ne i9 %i, 0
  %tmp_1 = icmp ult i9 %i, 255
  %tmp_16 = call i17 @_ssdm_op_BitConcatenate.i17.i9.i8(i9 %i_1, i8 0)
  %tmp_30_cast = zext i17 %tmp_16 to i18
  %tmp_4 = icmp eq i9 %i, 0
  %tmp_5 = icmp eq i9 %i, 255
  %sum = add i9 %i, -1
  %tmp_25 = call i17 @_ssdm_op_BitConcatenate.i17.i9.i8(i9 %sum, i8 0)
  %tmp_32_cast = sext i17 %tmp_25 to i18
  %tmp1 = and i1 %tmp, %tmp_1
  br label %.preheader10

.preheader10:                                     ; preds = %._crit_edge19, %.preheader10.preheader
  %j = phi i9 [ %j_1, %._crit_edge19 ], [ 0, %.preheader10.preheader ]
  %j_cast8 = zext i9 %j to i32
  %j_cast8_cast1 = zext i9 %j to i17
  %j_cast8_cast = zext i9 %j to i18
  %tmp_26 = add i18 %tmp_32_cast, %j_cast8_cast
  %tmp_33_cast = sext i18 %tmp_26 to i32
  %input_image_addr_1 = getelementptr [65536 x i32]* %input_image, i32 0, i32 %tmp_33_cast
  %tmp_27 = add i18 %tmp_30_cast, %j_cast8_cast
  %tmp_34_cast = zext i18 %tmp_27 to i32
  %input_image_addr_6 = getelementptr [65536 x i32]* %input_image, i32 0, i32 %tmp_34_cast
  %output_image_addr = getelementptr [65536 x i32]* %output_image, i32 0, i32 %j_cast8
  %tmp_28 = add i17 %j_cast8_cast1, 65280
  %tmp_35_cast = zext i17 %tmp_28 to i32
  %output_image_addr_2 = getelementptr [65536 x i32]* %output_image, i32 0, i32 %tmp_35_cast
  %tmp_29 = add i18 %tmp_26_cast, %j_cast8_cast
  %tmp_36_cast = zext i18 %tmp_29 to i32
  %image_addr_1 = getelementptr [65536 x i32]* %image, i32 0, i32 %tmp_36_cast
  %exitcond4 = icmp eq i9 %j, -256
  %empty_3 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 256, i64 256, i64 256) nounwind
  %j_1 = add i9 %j, 1
  br i1 %exitcond4, label %.loopexit.loopexit, label %1

; <label>:1                                       ; preds = %.preheader10
  %tmp_7 = icmp ne i9 %j, 0
  %tmp_8 = icmp ult i9 %j, 255
  %tmp2 = and i1 %tmp_7, %tmp_8
  %or_cond7 = and i1 %tmp2, %tmp1
  br i1 %or_cond7, label %2, label %._crit_edge

; <label>:2                                       ; preds = %1
  %tmp_9 = add i9 -1, %j
  %tmp_9_cast_cast = zext i9 %tmp_9 to i18
  %tmp_32 = add i18 %tmp_32_cast, %tmp_9_cast_cast
  %tmp_39_cast = sext i18 %tmp_32 to i32
  %input_image_addr = getelementptr [65536 x i32]* %input_image, i32 0, i32 %tmp_39_cast
  %tmp_33 = add i18 %tmp_26_cast, %tmp_9_cast_cast
  %tmp_40_cast = zext i18 %tmp_33 to i32
  %input_image_addr_3 = getelementptr [65536 x i32]* %input_image, i32 0, i32 %tmp_40_cast
  %tmp_34 = add i18 %tmp_30_cast, %tmp_9_cast_cast
  %tmp_41_cast = zext i18 %tmp_34 to i32
  %input_image_addr_5 = getelementptr [65536 x i32]* %input_image, i32 0, i32 %tmp_41_cast
  %input_image_load = load i32* %input_image_addr, align 4
  %input_image_load_1 = load i32* %input_image_addr_1, align 4
  %tmp_cast_cast = zext i9 %j_1 to i18
  %tmp_35 = add i18 %tmp_32_cast, %tmp_cast_cast
  %tmp_42_cast = sext i18 %tmp_35 to i32
  %input_image_addr_2 = getelementptr [65536 x i32]* %input_image, i32 0, i32 %tmp_42_cast
  %tmp_36 = add i18 %tmp_26_cast, %tmp_cast_cast
  %tmp_43_cast = zext i18 %tmp_36 to i32
  %input_image_addr_4 = getelementptr [65536 x i32]* %input_image, i32 0, i32 %tmp_43_cast
  %tmp_37 = add i18 %tmp_30_cast, %tmp_cast_cast
  %tmp_44_cast = zext i18 %tmp_37 to i32
  %input_image_addr_7 = getelementptr [65536 x i32]* %input_image, i32 0, i32 %tmp_44_cast
  %input_image_load_2 = load i32* %input_image_addr_2, align 4
  %input_image_load_3 = load i32* %input_image_addr_3, align 4
  %tmp_38 = shl i32 %input_image_load_3, 1
  %input_image_load_4 = load i32* %input_image_addr_4, align 4
  %tmp_39 = shl i32 %input_image_load_4, 1
  %input_image_load_5 = load i32* %input_image_addr_5, align 4
  %input_image_load_6 = load i32* %input_image_addr_6, align 4
  %input_image_load_7 = load i32* %input_image_addr_7, align 4
  %tmp_11 = sub i32 %input_image_load_2, %input_image_load
  %tmp_12 = sub i32 %tmp_11, %tmp_38
  %tmp_13 = add i32 %tmp_39, %tmp_12
  %tmp_14 = sub i32 %tmp_13, %input_image_load_5
  %x_dir = add i32 %tmp_14, %input_image_load_7
  %tmp_40 = shl i32 %input_image_load_1, 1
  %tmp_41 = shl i32 %input_image_load_6, 1
  %tmp3 = add i32 %tmp_40, %input_image_load_2
  %tmp_17 = add i32 %input_image_load, %tmp3
  %tmp_18 = sub i32 %tmp_17, %input_image_load_5
  %tmp_19 = sub i32 %tmp_18, %tmp_41
  %y_dir = sub i32 %tmp_19, %input_image_load_7
  %neg = sub i32 0, %x_dir
  %abscond = icmp sgt i32 %x_dir, 0
  %abs = select i1 %abscond, i32 %x_dir, i32 %neg
  %neg1 = sub i32 0, %y_dir
  %abscond1 = icmp sgt i32 %y_dir, 0
  %abs1 = select i1 %abscond1, i32 %y_dir, i32 %neg1
  %edge_weight = add nsw i32 %abs, %abs1
  store i32 %edge_weight, i32* %image_addr_1, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %2, %1
  br i1 %tmp_4, label %3, label %._crit_edge16

; <label>:3                                       ; preds = %._crit_edge
  store i32 0, i32* %output_image_addr, align 4
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %3, %._crit_edge
  br i1 %tmp_5, label %4, label %._crit_edge17

; <label>:4                                       ; preds = %._crit_edge16
  store i32 0, i32* %output_image_addr_2, align 4
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %4, %._crit_edge16
  %tmp_21 = icmp eq i9 %j, 0
  br i1 %tmp_21, label %5, label %._crit_edge18

; <label>:5                                       ; preds = %._crit_edge17
  store i32 0, i32* %output_image_addr_3, align 4
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %5, %._crit_edge17
  %tmp_24 = icmp eq i9 %j, 255
  br i1 %tmp_24, label %6, label %._crit_edge19

; <label>:6                                       ; preds = %._crit_edge18
  store i32 0, i32* %output_image_addr_4, align 4
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %6, %._crit_edge18
  br label %.preheader10

; <label>:7                                       ; preds = %.loopexit
  %min = alloca i32
  %min_1 = alloca i32
  %max_1 = load i32* %image_addr, align 4
  store i32 %max_1, i32* %min_1
  store i32 %max_1, i32* %min
  br label %8

; <label>:8                                       ; preds = %9, %7
  %c = phi i8 [ 1, %7 ], [ %c_1, %9 ]
  %exitcond3 = icmp eq i8 %c, -1
  %empty_4 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 254, i64 254, i64 254) nounwind
  br i1 %exitcond3, label %.preheader8.preheader, label %.preheader9.preheader

.preheader9.preheader:                            ; preds = %8
  br label %.preheader9

.preheader8.preheader:                            ; preds = %8
  %min_load = load i32* %min
  %min_1_load = load i32* %min_1
  %tmp_6 = sub nsw i32 %min_load, %min_1_load
  br label %.preheader8

.preheader9:                                      ; preds = %.preheader9.preheader, %._crit_edge20
  %d = phi i8 [ %d_1, %._crit_edge20 ], [ 1, %.preheader9.preheader ]
  %tmp_30 = call i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8 %c, i8 %d)
  %tmp_31 = zext i16 %tmp_30 to i32
  %image_addr_2 = getelementptr [65536 x i32]* %image, i32 0, i32 %tmp_31
  %exitcond2 = icmp eq i8 %d, -1
  %empty_5 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 254, i64 254, i64 254) nounwind
  br i1 %exitcond2, label %9, label %._crit_edge20

._crit_edge20:                                    ; preds = %.preheader9
  %min_load_1 = load i32* %min
  %min_1_load_1 = load i32* %min_1
  %max_2 = load i32* %image_addr_2, align 4
  %tmp_2 = icmp sgt i32 %max_2, %min_load_1
  %max_6_max_1 = select i1 %tmp_2, i32 %max_2, i32 %min_load_1
  %tmp_20 = icmp slt i32 %max_2, %min_1_load_1
  %max = select i1 %tmp_20, i32 %max_2, i32 %min_1_load_1
  %d_1 = add i8 %d, 1
  store i32 %max, i32* %min_1
  store i32 %max_6_max_1, i32* %min
  br label %.preheader9

; <label>:9                                       ; preds = %.preheader9
  %c_1 = add i8 %c, 1
  br label %8

.preheader8:                                      ; preds = %11, %.preheader8.preheader
  %k = phi i8 [ %k_1, %11 ], [ 1, %.preheader8.preheader ]
  %exitcond1 = icmp eq i8 %k, -1
  %empty_6 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 254, i64 254, i64 254) nounwind
  br i1 %exitcond1, label %12, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader8
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %10
  %l = phi i8 [ %l_1, %10 ], [ 1, %.preheader.preheader ]
  %tmp_42 = call i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8 %k, i8 %l)
  %tmp_43 = zext i16 %tmp_42 to i32
  %output_image_addr_1 = getelementptr [65536 x i32]* %output_image, i32 0, i32 %tmp_43
  %image_addr_3 = getelementptr [65536 x i32]* %image, i32 0, i32 %tmp_43
  %exitcond = icmp eq i8 %l, -1
  %empty_7 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 254, i64 254, i64 254) nounwind
  br i1 %exitcond, label %11, label %10

; <label>:10                                      ; preds = %.preheader
  %image_load = load i32* %image_addr_3, align 4
  %tmp_44 = shl i32 %image_load, 8
  %tmp_22 = sub i32 %tmp_44, %image_load
  %tmp_23 = sdiv i32 %tmp_22, %tmp_6
  store i32 %tmp_23, i32* %output_image_addr_1, align 4
  %l_1 = add i8 1, %l
  br label %.preheader

; <label>:11                                      ; preds = %.preheader
  %k_1 = add i8 %k, 1
  br label %.preheader8

; <label>:12                                      ; preds = %.preheader8
  ret void
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

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

declare i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i24 @_ssdm_op_PartSelect.i24.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31, i1) nounwind readnone

declare i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24, i8) nounwind readnone

define weak i32 @_ssdm_op_BitConcatenate.i32.i15.i17(i15, i17) nounwind readnone {
entry:
  %empty = zext i15 %0 to i32
  %empty_8 = zext i17 %1 to i32
  %empty_9 = shl i32 %empty, 17
  %empty_10 = or i32 %empty_9, %empty_8
  ret i32 %empty_10
}

define weak i17 @_ssdm_op_BitConcatenate.i17.i9.i8(i9, i8) nounwind readnone {
entry:
  %empty = zext i9 %0 to i17
  %empty_11 = zext i8 %1 to i17
  %empty_12 = shl i17 %empty, 8
  %empty_13 = or i17 %empty_12, %empty_11
  ret i17 %empty_13
}

define weak i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8, i8) nounwind readnone {
entry:
  %empty = zext i8 %0 to i16
  %empty_14 = zext i8 %1 to i16
  %empty_15 = shl i16 %empty, 8
  %empty_16 = or i16 %empty_15, %empty_14
  ret i16 %empty_16
}

!opencl.kernels = !{!0}
!hls.encrypted.func = !{}
!llvm.map.gv = !{}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"int [256]*", metadata !"int [256]*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"input_image", metadata !"output_image"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{metadata !8}
!8 = metadata !{i32 0, i32 31, metadata !9}
!9 = metadata !{metadata !10}
!10 = metadata !{metadata !"input_image", metadata !11, metadata !"int", i32 0, i32 31}
!11 = metadata !{metadata !12, metadata !12}
!12 = metadata !{i32 0, i32 255, i32 1}
!13 = metadata !{metadata !14}
!14 = metadata !{i32 0, i32 31, metadata !15}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !"output_image", metadata !11, metadata !"int", i32 0, i32 31}
