; ModuleID = 'W:/Desktop/sobel1/sobel/solution1/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@sobel_str = internal unnamed_addr constant [6 x i8] c"sobel\00" ; [#uses=1 type=[6 x i8]*]

; [#uses=0]
define void @sobel([65536 x i32]* %input_image, [65536 x i32]* %output_image) nounwind {
  call void (...)* @_ssdm_op_SpecBitsMap([65536 x i32]* %input_image) nounwind, !map !7
  call void (...)* @_ssdm_op_SpecBitsMap([65536 x i32]* %output_image) nounwind, !map !13
  call void (...)* @_ssdm_op_SpecTopModule([6 x i8]* @sobel_str) nounwind
  %image = alloca [65536 x i32], align 4          ; [#uses=4 type=[65536 x i32]*]
  %image_addr = getelementptr [65536 x i32]* %image, i32 0, i32 257, !dbg !17 ; [#uses=1 type=i32*] [debug line = 53:1]
  call void @llvm.dbg.value(metadata !{[65536 x i32]* %input_image}, i64 0, metadata !30), !dbg !33 ; [debug line = 5:16] [debug variable = input_image]
  call void @llvm.dbg.value(metadata !{[65536 x i32]* %output_image}, i64 0, metadata !34), !dbg !35 ; [debug line = 5:42] [debug variable = output_image]
  call void @llvm.dbg.declare(metadata !{[65536 x i32]* %image}, metadata !36), !dbg !37 ; [debug line = 9:6] [debug variable = image]
  br label %.loopexit, !dbg !38                   ; [debug line = 20:5]

.loopexit.loopexit:                               ; preds = %.preheader10
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %0
  %i = phi i9 [ 0, %0 ], [ %i_1, %.loopexit.loopexit ] ; [#uses=8 type=i9]
  %tmp_s = call i17 @_ssdm_op_BitConcatenate.i17.i9.i8(i9 %i, i8 0) ; [#uses=3 type=i17]
  %tmp_3 = zext i17 %tmp_s to i32, !dbg !40       ; [#uses=1 type=i32] [debug line = 26:4]
  %tmp_26_cast = zext i17 %tmp_s to i18, !dbg !45 ; [#uses=3 type=i18] [debug line = 43:4]
  %output_image_addr_3 = getelementptr [65536 x i32]* %output_image, i32 0, i32 %tmp_3, !dbg !45 ; [#uses=1 type=i32*] [debug line = 43:4]
  %tmp_10 = or i17 %tmp_s, 255                    ; [#uses=1 type=i17]
  %tmp_15 = call i32 @_ssdm_op_BitConcatenate.i32.i15.i17(i15 0, i17 %tmp_10), !dbg !47 ; [#uses=1 type=i32] [debug line = 47:4]
  %output_image_addr_4 = getelementptr [65536 x i32]* %output_image, i32 0, i32 %tmp_15, !dbg !47 ; [#uses=1 type=i32*] [debug line = 47:4]
  %exitcond5 = icmp eq i9 %i, -256, !dbg !38      ; [#uses=1 type=i1] [debug line = 20:5]
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 256, i64 256, i64 256) nounwind ; [#uses=0 type=i32]
  %i_1 = add i9 %i, 1, !dbg !40                   ; [#uses=2 type=i9] [debug line = 26:4]
  br i1 %exitcond5, label %7, label %.preheader10.preheader, !dbg !38 ; [debug line = 20:5]

.preheader10.preheader:                           ; preds = %.loopexit
  %tmp = icmp ne i9 %i, 0, !dbg !49               ; [#uses=1 type=i1] [debug line = 24:3]
  %tmp_1 = icmp ult i9 %i, 255, !dbg !49          ; [#uses=1 type=i1] [debug line = 24:3]
  %tmp_16 = call i17 @_ssdm_op_BitConcatenate.i17.i9.i8(i9 %i_1, i8 0) ; [#uses=1 type=i17]
  %tmp_30_cast = zext i17 %tmp_16 to i18, !dbg !50 ; [#uses=3 type=i18] [debug line = 20:15]
  call void @llvm.dbg.value(metadata !{i9 %i_1}, i64 0, metadata !51), !dbg !50 ; [debug line = 20:15] [debug variable = i]
  %tmp_4 = icmp eq i9 %i, 0, !dbg !52             ; [#uses=1 type=i1] [debug line = 32:3]
  %tmp_5 = icmp eq i9 %i, 255, !dbg !53           ; [#uses=1 type=i1] [debug line = 36:3]
  %sum = add i9 %i, -1                            ; [#uses=1 type=i9]
  %tmp_25 = call i17 @_ssdm_op_BitConcatenate.i17.i9.i8(i9 %sum, i8 0) ; [#uses=1 type=i17]
  %tmp_32_cast = sext i17 %tmp_25 to i18, !dbg !49 ; [#uses=3 type=i18] [debug line = 24:3]
  %tmp1 = and i1 %tmp, %tmp_1, !dbg !49           ; [#uses=1 type=i1] [debug line = 24:3]
  br label %.preheader10, !dbg !54                ; [debug line = 22:6]

.preheader10:                                     ; preds = %._crit_edge19, %.preheader10.preheader
  %j = phi i9 [ %j_1, %._crit_edge19 ], [ 0, %.preheader10.preheader ] ; [#uses=10 type=i9]
  %j_cast8 = zext i9 %j to i32, !dbg !54          ; [#uses=1 type=i32] [debug line = 22:6]
  %j_cast8_cast1 = zext i9 %j to i17, !dbg !40    ; [#uses=1 type=i17] [debug line = 26:4]
  %j_cast8_cast = zext i9 %j to i18, !dbg !40     ; [#uses=3 type=i18] [debug line = 26:4]
  %tmp_26 = add i18 %tmp_32_cast, %j_cast8_cast, !dbg !40 ; [#uses=1 type=i18] [debug line = 26:4]
  %tmp_33_cast = sext i18 %tmp_26 to i32, !dbg !40 ; [#uses=1 type=i32] [debug line = 26:4]
  %input_image_addr_1 = getelementptr [65536 x i32]* %input_image, i32 0, i32 %tmp_33_cast, !dbg !40 ; [#uses=1 type=i32*] [debug line = 26:4]
  %tmp_27 = add i18 %tmp_30_cast, %j_cast8_cast, !dbg !40 ; [#uses=1 type=i18] [debug line = 26:4]
  %tmp_34_cast = zext i18 %tmp_27 to i32, !dbg !40 ; [#uses=1 type=i32] [debug line = 26:4]
  %input_image_addr_6 = getelementptr [65536 x i32]* %input_image, i32 0, i32 %tmp_34_cast, !dbg !40 ; [#uses=1 type=i32*] [debug line = 26:4]
  %output_image_addr = getelementptr [65536 x i32]* %output_image, i32 0, i32 %j_cast8, !dbg !55 ; [#uses=1 type=i32*] [debug line = 34:4]
  %tmp_28 = add i17 %j_cast8_cast1, 65280, !dbg !57 ; [#uses=1 type=i17] [debug line = 38:4]
  %tmp_35_cast = zext i17 %tmp_28 to i32, !dbg !57 ; [#uses=1 type=i32] [debug line = 38:4]
  %output_image_addr_2 = getelementptr [65536 x i32]* %output_image, i32 0, i32 %tmp_35_cast, !dbg !57 ; [#uses=1 type=i32*] [debug line = 38:4]
  %tmp_29 = add i18 %tmp_26_cast, %j_cast8_cast, !dbg !59 ; [#uses=1 type=i18] [debug line = 29:4]
  %tmp_36_cast = zext i18 %tmp_29 to i32, !dbg !59 ; [#uses=1 type=i32] [debug line = 29:4]
  %image_addr_1 = getelementptr [65536 x i32]* %image, i32 0, i32 %tmp_36_cast, !dbg !59 ; [#uses=1 type=i32*] [debug line = 29:4]
  %exitcond4 = icmp eq i9 %j, -256, !dbg !54      ; [#uses=1 type=i1] [debug line = 22:6]
  %empty_3 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 256, i64 256, i64 256) nounwind ; [#uses=0 type=i32]
  %j_1 = add i9 %j, 1, !dbg !60                   ; [#uses=2 type=i9] [debug line = 22:16]
  br i1 %exitcond4, label %.loopexit.loopexit, label %1, !dbg !54 ; [debug line = 22:6]

; <label>:1                                       ; preds = %.preheader10
  %tmp_7 = icmp ne i9 %j, 0, !dbg !49             ; [#uses=1 type=i1] [debug line = 24:3]
  %tmp_8 = icmp ult i9 %j, 255, !dbg !49          ; [#uses=1 type=i1] [debug line = 24:3]
  %tmp2 = and i1 %tmp_7, %tmp_8, !dbg !49         ; [#uses=1 type=i1] [debug line = 24:3]
  %or_cond7 = and i1 %tmp2, %tmp1, !dbg !49       ; [#uses=1 type=i1] [debug line = 24:3]
  br i1 %or_cond7, label %2, label %._crit_edge, !dbg !49 ; [debug line = 24:3]

; <label>:2                                       ; preds = %1
  %tmp_9 = add i9 -1, %j, !dbg !40                ; [#uses=1 type=i9] [debug line = 26:4]
  %tmp_9_cast_cast = zext i9 %tmp_9 to i18, !dbg !40 ; [#uses=3 type=i18] [debug line = 26:4]
  %tmp_32 = add i18 %tmp_32_cast, %tmp_9_cast_cast, !dbg !40 ; [#uses=1 type=i18] [debug line = 26:4]
  %tmp_39_cast = sext i18 %tmp_32 to i32, !dbg !40 ; [#uses=1 type=i32] [debug line = 26:4]
  %input_image_addr = getelementptr [65536 x i32]* %input_image, i32 0, i32 %tmp_39_cast, !dbg !40 ; [#uses=1 type=i32*] [debug line = 26:4]
  %tmp_33 = add i18 %tmp_26_cast, %tmp_9_cast_cast, !dbg !40 ; [#uses=1 type=i18] [debug line = 26:4]
  %tmp_40_cast = zext i18 %tmp_33 to i32, !dbg !40 ; [#uses=1 type=i32] [debug line = 26:4]
  %input_image_addr_3 = getelementptr [65536 x i32]* %input_image, i32 0, i32 %tmp_40_cast, !dbg !40 ; [#uses=1 type=i32*] [debug line = 26:4]
  %tmp_34 = add i18 %tmp_30_cast, %tmp_9_cast_cast, !dbg !40 ; [#uses=1 type=i18] [debug line = 26:4]
  %tmp_41_cast = zext i18 %tmp_34 to i32, !dbg !40 ; [#uses=1 type=i32] [debug line = 26:4]
  %input_image_addr_5 = getelementptr [65536 x i32]* %input_image, i32 0, i32 %tmp_41_cast, !dbg !40 ; [#uses=1 type=i32*] [debug line = 26:4]
  %input_image_load = load i32* %input_image_addr, align 4, !dbg !40 ; [#uses=2 type=i32] [debug line = 26:4]
  %input_image_load_1 = load i32* %input_image_addr_1, align 4, !dbg !40 ; [#uses=1 type=i32] [debug line = 26:4]
  %tmp_cast_cast = zext i9 %j_1 to i18, !dbg !40  ; [#uses=3 type=i18] [debug line = 26:4]
  %tmp_35 = add i18 %tmp_32_cast, %tmp_cast_cast, !dbg !40 ; [#uses=1 type=i18] [debug line = 26:4]
  %tmp_42_cast = sext i18 %tmp_35 to i32, !dbg !40 ; [#uses=1 type=i32] [debug line = 26:4]
  %input_image_addr_2 = getelementptr [65536 x i32]* %input_image, i32 0, i32 %tmp_42_cast, !dbg !40 ; [#uses=1 type=i32*] [debug line = 26:4]
  %tmp_36 = add i18 %tmp_26_cast, %tmp_cast_cast, !dbg !40 ; [#uses=1 type=i18] [debug line = 26:4]
  %tmp_43_cast = zext i18 %tmp_36 to i32, !dbg !40 ; [#uses=1 type=i32] [debug line = 26:4]
  %input_image_addr_4 = getelementptr [65536 x i32]* %input_image, i32 0, i32 %tmp_43_cast, !dbg !40 ; [#uses=1 type=i32*] [debug line = 26:4]
  %tmp_37 = add i18 %tmp_30_cast, %tmp_cast_cast, !dbg !40 ; [#uses=1 type=i18] [debug line = 26:4]
  %tmp_44_cast = zext i18 %tmp_37 to i32, !dbg !40 ; [#uses=1 type=i32] [debug line = 26:4]
  %input_image_addr_7 = getelementptr [65536 x i32]* %input_image, i32 0, i32 %tmp_44_cast, !dbg !40 ; [#uses=1 type=i32*] [debug line = 26:4]
  %input_image_load_2 = load i32* %input_image_addr_2, align 4, !dbg !40 ; [#uses=2 type=i32] [debug line = 26:4]
  %input_image_load_3 = load i32* %input_image_addr_3, align 4, !dbg !40 ; [#uses=1 type=i32] [debug line = 26:4]
  %tmp_38 = shl i32 %input_image_load_3, 1, !dbg !40 ; [#uses=1 type=i32] [debug line = 26:4]
  %input_image_load_4 = load i32* %input_image_addr_4, align 4, !dbg !40 ; [#uses=1 type=i32] [debug line = 26:4]
  %tmp_39 = shl i32 %input_image_load_4, 1, !dbg !40 ; [#uses=1 type=i32] [debug line = 26:4]
  %input_image_load_5 = load i32* %input_image_addr_5, align 4, !dbg !40 ; [#uses=2 type=i32] [debug line = 26:4]
  %input_image_load_6 = load i32* %input_image_addr_6, align 4, !dbg !40 ; [#uses=1 type=i32] [debug line = 26:4]
  %input_image_load_7 = load i32* %input_image_addr_7, align 4, !dbg !40 ; [#uses=2 type=i32] [debug line = 26:4]
  %tmp_11 = sub i32 %input_image_load_2, %input_image_load, !dbg !40 ; [#uses=1 type=i32] [debug line = 26:4]
  %tmp_12 = sub i32 %tmp_11, %tmp_38, !dbg !40    ; [#uses=1 type=i32] [debug line = 26:4]
  %tmp_13 = add i32 %tmp_39, %tmp_12, !dbg !40    ; [#uses=1 type=i32] [debug line = 26:4]
  %tmp_14 = sub i32 %tmp_13, %input_image_load_5, !dbg !40 ; [#uses=1 type=i32] [debug line = 26:4]
  %x_dir = add i32 %tmp_14, %input_image_load_7, !dbg !40 ; [#uses=3 type=i32] [debug line = 26:4]
  call void @llvm.dbg.value(metadata !{i32 %x_dir}, i64 0, metadata !61), !dbg !40 ; [debug line = 26:4] [debug variable = x_dir]
  %tmp_40 = shl i32 %input_image_load_1, 1, !dbg !62 ; [#uses=1 type=i32] [debug line = 27:4]
  %tmp_41 = shl i32 %input_image_load_6, 1, !dbg !62 ; [#uses=1 type=i32] [debug line = 27:4]
  %tmp3 = add i32 %tmp_40, %input_image_load_2, !dbg !62 ; [#uses=1 type=i32] [debug line = 27:4]
  %tmp_17 = add i32 %input_image_load, %tmp3, !dbg !62 ; [#uses=1 type=i32] [debug line = 27:4]
  %tmp_18 = sub i32 %tmp_17, %input_image_load_5, !dbg !62 ; [#uses=1 type=i32] [debug line = 27:4]
  %tmp_19 = sub i32 %tmp_18, %tmp_41, !dbg !62    ; [#uses=1 type=i32] [debug line = 27:4]
  %y_dir = sub i32 %tmp_19, %input_image_load_7, !dbg !62 ; [#uses=3 type=i32] [debug line = 27:4]
  call void @llvm.dbg.value(metadata !{i32 %y_dir}, i64 0, metadata !63), !dbg !62 ; [debug line = 27:4] [debug variable = y_dir]
  %neg = sub i32 0, %x_dir                        ; [#uses=1 type=i32]
  %abscond = icmp sgt i32 %x_dir, 0               ; [#uses=1 type=i1]
  %abs = select i1 %abscond, i32 %x_dir, i32 %neg ; [#uses=1 type=i32]
  %neg1 = sub i32 0, %y_dir                       ; [#uses=1 type=i32]
  %abscond1 = icmp sgt i32 %y_dir, 0              ; [#uses=1 type=i1]
  %abs1 = select i1 %abscond1, i32 %y_dir, i32 %neg1 ; [#uses=1 type=i32]
  %edge_weight = add nsw i32 %abs, %abs1, !dbg !64 ; [#uses=1 type=i32] [debug line = 28:31]
  call void @llvm.dbg.value(metadata !{i32 %edge_weight}, i64 0, metadata !65), !dbg !64 ; [debug line = 28:31] [debug variable = edge_weight]
  store i32 %edge_weight, i32* %image_addr_1, align 4, !dbg !59 ; [debug line = 29:4]
  br label %._crit_edge, !dbg !66                 ; [debug line = 31:3]

._crit_edge:                                      ; preds = %2, %1
  br i1 %tmp_4, label %3, label %._crit_edge16, !dbg !52 ; [debug line = 32:3]

; <label>:3                                       ; preds = %._crit_edge
  store i32 0, i32* %output_image_addr, align 4, !dbg !55 ; [debug line = 34:4]
  br label %._crit_edge16, !dbg !67               ; [debug line = 35:3]

._crit_edge16:                                    ; preds = %3, %._crit_edge
  br i1 %tmp_5, label %4, label %._crit_edge17, !dbg !53 ; [debug line = 36:3]

; <label>:4                                       ; preds = %._crit_edge16
  store i32 0, i32* %output_image_addr_2, align 4, !dbg !57 ; [debug line = 38:4]
  br label %._crit_edge17, !dbg !68               ; [debug line = 39:3]

._crit_edge17:                                    ; preds = %4, %._crit_edge16
  %tmp_21 = icmp eq i9 %j, 0, !dbg !69            ; [#uses=1 type=i1] [debug line = 41:3]
  br i1 %tmp_21, label %5, label %._crit_edge18, !dbg !69 ; [debug line = 41:3]

; <label>:5                                       ; preds = %._crit_edge17
  store i32 0, i32* %output_image_addr_3, align 4, !dbg !45 ; [debug line = 43:4]
  br label %._crit_edge18, !dbg !70               ; [debug line = 44:3]

._crit_edge18:                                    ; preds = %5, %._crit_edge17
  %tmp_24 = icmp eq i9 %j, 255, !dbg !71          ; [#uses=1 type=i1] [debug line = 45:3]
  br i1 %tmp_24, label %6, label %._crit_edge19, !dbg !71 ; [debug line = 45:3]

; <label>:6                                       ; preds = %._crit_edge18
  store i32 0, i32* %output_image_addr_4, align 4, !dbg !47 ; [debug line = 47:4]
  br label %._crit_edge19, !dbg !72               ; [debug line = 48:3]

._crit_edge19:                                    ; preds = %6, %._crit_edge18
  call void @llvm.dbg.value(metadata !{i9 %j_1}, i64 0, metadata !73), !dbg !60 ; [debug line = 22:16] [debug variable = j]
  br label %.preheader10, !dbg !60                ; [debug line = 22:16]

; <label>:7                                       ; preds = %.loopexit
  %min = alloca i32                               ; [#uses=4 type=i32*]
  call void @llvm.dbg.declare(metadata !{i32* %min}, metadata !74) ; [debug variable = min]
  %min_1 = alloca i32                             ; [#uses=4 type=i32*]
  call void @llvm.dbg.declare(metadata !{i32* %min_1}, metadata !74) ; [debug variable = min]
  %max_1 = load i32* %image_addr, align 4, !dbg !17 ; [#uses=2 type=i32] [debug line = 53:1]
  call void @llvm.dbg.value(metadata !{i32 %max_1}, i64 0, metadata !75), !dbg !17 ; [debug line = 53:1] [debug variable = max]
  call void @llvm.dbg.value(metadata !{i32 %max_1}, i64 0, metadata !74), !dbg !76 ; [debug line = 54:1] [debug variable = min]
  store i32 %max_1, i32* %min_1, !dbg !76         ; [debug line = 54:1]
  store i32 %max_1, i32* %min, !dbg !76           ; [debug line = 54:1]
  br label %8, !dbg !77                           ; [debug line = 56:6]

; <label>:8                                       ; preds = %9, %7
  %c = phi i8 [ 1, %7 ], [ %c_1, %9 ]             ; [#uses=3 type=i8]
  %exitcond3 = icmp eq i8 %c, -1, !dbg !77        ; [#uses=1 type=i1] [debug line = 56:6]
  %empty_4 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 254, i64 254, i64 254) nounwind ; [#uses=0 type=i32]
  br i1 %exitcond3, label %.preheader8.preheader, label %.preheader9.preheader, !dbg !77 ; [debug line = 56:6]

.preheader9.preheader:                            ; preds = %8
  br label %.preheader9

.preheader8.preheader:                            ; preds = %8
  %min_load = load i32* %min, !dbg !79            ; [#uses=1 type=i32] [debug line = 78:4]
  %min_1_load = load i32* %min_1, !dbg !79        ; [#uses=1 type=i32] [debug line = 78:4]
  %tmp_6 = sub nsw i32 %min_load, %min_1_load, !dbg !79 ; [#uses=1 type=i32] [debug line = 78:4]
  br label %.preheader8, !dbg !84                 ; [debug line = 74:5]

.preheader9:                                      ; preds = %._crit_edge20, %.preheader9.preheader
  %d = phi i8 [ %d_1, %._crit_edge20 ], [ 1, %.preheader9.preheader ] ; [#uses=3 type=i8]
  %tmp_30 = call i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8 %c, i8 %d) ; [#uses=1 type=i16]
  %tmp_31 = zext i16 %tmp_30 to i32, !dbg !85     ; [#uses=1 type=i32] [debug line = 60:7]
  %image_addr_2 = getelementptr [65536 x i32]* %image, i32 0, i32 %tmp_31, !dbg !85 ; [#uses=1 type=i32*] [debug line = 60:7]
  %exitcond2 = icmp eq i8 %d, -1, !dbg !89        ; [#uses=1 type=i1] [debug line = 58:11]
  %empty_5 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 254, i64 254, i64 254) nounwind ; [#uses=0 type=i32]
  br i1 %exitcond2, label %9, label %._crit_edge20, !dbg !89 ; [debug line = 58:11]

._crit_edge20:                                    ; preds = %.preheader9
  %min_load_1 = load i32* %min, !dbg !85          ; [#uses=2 type=i32] [debug line = 60:7]
  %min_1_load_1 = load i32* %min_1, !dbg !90      ; [#uses=2 type=i32] [debug line = 65:7]
  %max_2 = load i32* %image_addr_2, align 4, !dbg !85 ; [#uses=4 type=i32] [debug line = 60:7]
  call void @llvm.dbg.value(metadata !{i32 %max_2}, i64 0, metadata !75), !dbg !91 ; [debug line = 62:8] [debug variable = max]
  %tmp_2 = icmp sgt i32 %max_2, %min_load_1, !dbg !85 ; [#uses=1 type=i1] [debug line = 60:7]
  %max_6_max_1 = select i1 %tmp_2, i32 %max_2, i32 %min_load_1, !dbg !85 ; [#uses=1 type=i32] [debug line = 60:7]
  %tmp_20 = icmp slt i32 %max_2, %min_1_load_1, !dbg !90 ; [#uses=1 type=i1] [debug line = 65:7]
  call void @llvm.dbg.value(metadata !{i32 %max_2}, i64 0, metadata !74), !dbg !93 ; [debug line = 67:8] [debug variable = min]
  %max = select i1 %tmp_20, i32 %max_2, i32 %min_1_load_1, !dbg !90 ; [#uses=1 type=i32] [debug line = 65:7]
  call void @llvm.dbg.value(metadata !{i32 %max}, i64 0, metadata !75), !dbg !90 ; [debug line = 65:7] [debug variable = max]
  %d_1 = add i8 %d, 1, !dbg !95                   ; [#uses=1 type=i8] [debug line = 58:27]
  call void @llvm.dbg.value(metadata !{i8 %d_1}, i64 0, metadata !96), !dbg !95 ; [debug line = 58:27] [debug variable = d]
  store i32 %max, i32* %min_1, !dbg !90           ; [debug line = 65:7]
  store i32 %max_6_max_1, i32* %min
  br label %.preheader9, !dbg !95                 ; [debug line = 58:27]

; <label>:9                                       ; preds = %.preheader9
  %c_1 = add i8 %c, 1, !dbg !97                   ; [#uses=1 type=i8] [debug line = 56:22]
  call void @llvm.dbg.value(metadata !{i8 %c_1}, i64 0, metadata !98), !dbg !97 ; [debug line = 56:22] [debug variable = c]
  br label %8, !dbg !97                           ; [debug line = 56:22]

.preheader8:                                      ; preds = %11, %.preheader8.preheader
  %k = phi i8 [ %k_1, %11 ], [ 1, %.preheader8.preheader ] ; [#uses=3 type=i8]
  %exitcond1 = icmp eq i8 %k, -1, !dbg !84        ; [#uses=1 type=i1] [debug line = 74:5]
  %empty_6 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 254, i64 254, i64 254) nounwind ; [#uses=0 type=i32]
  br i1 %exitcond1, label %12, label %.preheader.preheader, !dbg !84 ; [debug line = 74:5]

.preheader.preheader:                             ; preds = %.preheader8
  br label %.preheader

.preheader:                                       ; preds = %10, %.preheader.preheader
  %l = phi i8 [ %l_1, %10 ], [ 1, %.preheader.preheader ] ; [#uses=3 type=i8]
  %tmp_42 = call i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8 %k, i8 %l) ; [#uses=1 type=i16]
  %tmp_43 = zext i16 %tmp_42 to i32, !dbg !79     ; [#uses=2 type=i32] [debug line = 78:4]
  %output_image_addr_1 = getelementptr [65536 x i32]* %output_image, i32 0, i32 %tmp_43, !dbg !79 ; [#uses=1 type=i32*] [debug line = 78:4]
  %image_addr_3 = getelementptr [65536 x i32]* %image, i32 0, i32 %tmp_43, !dbg !79 ; [#uses=1 type=i32*] [debug line = 78:4]
  %exitcond = icmp eq i8 %l, -1, !dbg !99         ; [#uses=1 type=i1] [debug line = 76:7]
  %empty_7 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 254, i64 254, i64 254) nounwind ; [#uses=0 type=i32]
  br i1 %exitcond, label %11, label %10, !dbg !99 ; [debug line = 76:7]

; <label>:10                                      ; preds = %.preheader
  %image_load = load i32* %image_addr_3, align 4, !dbg !79 ; [#uses=2 type=i32] [debug line = 78:4]
  %tmp_44 = shl i32 %image_load, 8, !dbg !79      ; [#uses=1 type=i32] [debug line = 78:4]
  %tmp_22 = sub i32 %tmp_44, %image_load, !dbg !79 ; [#uses=1 type=i32] [debug line = 78:4]
  %tmp_23 = sdiv i32 %tmp_22, %tmp_6, !dbg !79    ; [#uses=1 type=i32] [debug line = 78:4]
  store i32 %tmp_23, i32* %output_image_addr_1, align 4, !dbg !79 ; [debug line = 78:4]
  %l_1 = add i8 1, %l, !dbg !100                  ; [#uses=1 type=i8] [debug line = 76:17]
  call void @llvm.dbg.value(metadata !{i8 %l_1}, i64 0, metadata !101), !dbg !100 ; [debug line = 76:17] [debug variable = l]
  br label %.preheader, !dbg !100                 ; [debug line = 76:17]

; <label>:11                                      ; preds = %.preheader
  %k_1 = add i8 %k, 1, !dbg !102                  ; [#uses=1 type=i8] [debug line = 74:15]
  call void @llvm.dbg.value(metadata !{i8 %k_1}, i64 0, metadata !103), !dbg !102 ; [debug line = 74:15] [debug variable = k]
  br label %.preheader8, !dbg !102                ; [debug line = 74:15]

; <label>:12                                      ; preds = %.preheader8
  ret void, !dbg !104                             ; [debug line = 84:1]
}

; [#uses=16]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=3]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=1]
define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

; [#uses=6]
define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

; [#uses=2]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=0]
declare i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=0]
declare i24 @_ssdm_op_PartSelect.i24.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=0]
declare i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31, i1) nounwind readnone

; [#uses=0]
declare i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24, i8) nounwind readnone

; [#uses=1]
define weak i32 @_ssdm_op_BitConcatenate.i32.i15.i17(i15, i17) nounwind readnone {
entry:
  %empty = zext i15 %0 to i32                     ; [#uses=1 type=i32]
  %empty_8 = zext i17 %1 to i32                   ; [#uses=1 type=i32]
  %empty_9 = shl i32 %empty, 17                   ; [#uses=1 type=i32]
  %empty_10 = or i32 %empty_9, %empty_8           ; [#uses=1 type=i32]
  ret i32 %empty_10
}

; [#uses=3]
define weak i17 @_ssdm_op_BitConcatenate.i17.i9.i8(i9, i8) nounwind readnone {
entry:
  %empty = zext i9 %0 to i17                      ; [#uses=1 type=i17]
  %empty_11 = zext i8 %1 to i17                   ; [#uses=1 type=i17]
  %empty_12 = shl i17 %empty, 8                   ; [#uses=1 type=i17]
  %empty_13 = or i17 %empty_12, %empty_11         ; [#uses=1 type=i17]
  ret i17 %empty_13
}

; [#uses=2]
define weak i16 @_ssdm_op_BitConcatenate.i16.i8.i8(i8, i8) nounwind readnone {
entry:
  %empty = zext i8 %0 to i16                      ; [#uses=1 type=i16]
  %empty_14 = zext i8 %1 to i16                   ; [#uses=1 type=i16]
  %empty_15 = shl i16 %empty, 8                   ; [#uses=1 type=i16]
  %empty_16 = or i16 %empty_15, %empty_14         ; [#uses=1 type=i16]
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
!17 = metadata !{i32 53, i32 1, metadata !18, null}
!18 = metadata !{i32 786443, metadata !19, i32 6, i32 1, metadata !20, i32 0} ; [ DW_TAG_lexical_block ]
!19 = metadata !{i32 786478, i32 0, metadata !20, metadata !"sobel", metadata !"sobel", metadata !"", metadata !20, i32 5, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !28, i32 6} ; [ DW_TAG_subprogram ]
!20 = metadata !{i32 786473, metadata !"sobel.c", metadata !"W:\5CDesktop\5Csobel1", null} ; [ DW_TAG_file_type ]
!21 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!22 = metadata !{null, metadata !23, metadata !23}
!23 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !24} ; [ DW_TAG_pointer_type ]
!24 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8192, i64 32, i32 0, i32 0, metadata !25, metadata !26, i32 0, i32 0} ; [ DW_TAG_array_type ]
!25 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!26 = metadata !{metadata !27}
!27 = metadata !{i32 786465, i64 0, i64 255}      ; [ DW_TAG_subrange_type ]
!28 = metadata !{metadata !29}
!29 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!30 = metadata !{i32 786689, metadata !19, metadata !"input_image", null, i32 5, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!31 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2097152, i64 32, i32 0, i32 0, metadata !25, metadata !32, i32 0, i32 0} ; [ DW_TAG_array_type ]
!32 = metadata !{metadata !27, metadata !27}
!33 = metadata !{i32 5, i32 16, metadata !19, null}
!34 = metadata !{i32 786689, metadata !19, metadata !"output_image", null, i32 5, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!35 = metadata !{i32 5, i32 42, metadata !19, null}
!36 = metadata !{i32 786688, metadata !18, metadata !"image", metadata !20, i32 9, metadata !31, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!37 = metadata !{i32 9, i32 6, metadata !18, null}
!38 = metadata !{i32 20, i32 5, metadata !39, null}
!39 = metadata !{i32 786443, metadata !18, i32 20, i32 1, metadata !20, i32 1} ; [ DW_TAG_lexical_block ]
!40 = metadata !{i32 26, i32 4, metadata !41, null}
!41 = metadata !{i32 786443, metadata !42, i32 25, i32 3, metadata !20, i32 5} ; [ DW_TAG_lexical_block ]
!42 = metadata !{i32 786443, metadata !43, i32 23, i32 2, metadata !20, i32 4} ; [ DW_TAG_lexical_block ]
!43 = metadata !{i32 786443, metadata !44, i32 22, i32 2, metadata !20, i32 3} ; [ DW_TAG_lexical_block ]
!44 = metadata !{i32 786443, metadata !39, i32 21, i32 2, metadata !20, i32 2} ; [ DW_TAG_lexical_block ]
!45 = metadata !{i32 43, i32 4, metadata !46, null}
!46 = metadata !{i32 786443, metadata !42, i32 42, i32 3, metadata !20, i32 8} ; [ DW_TAG_lexical_block ]
!47 = metadata !{i32 47, i32 4, metadata !48, null}
!48 = metadata !{i32 786443, metadata !42, i32 46, i32 3, metadata !20, i32 9} ; [ DW_TAG_lexical_block ]
!49 = metadata !{i32 24, i32 3, metadata !42, null}
!50 = metadata !{i32 20, i32 15, metadata !39, null}
!51 = metadata !{i32 786688, metadata !18, metadata !"i", metadata !20, i32 10, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!52 = metadata !{i32 32, i32 3, metadata !42, null}
!53 = metadata !{i32 36, i32 3, metadata !42, null}
!54 = metadata !{i32 22, i32 6, metadata !43, null}
!55 = metadata !{i32 34, i32 4, metadata !56, null}
!56 = metadata !{i32 786443, metadata !42, i32 33, i32 3, metadata !20, i32 6} ; [ DW_TAG_lexical_block ]
!57 = metadata !{i32 38, i32 4, metadata !58, null}
!58 = metadata !{i32 786443, metadata !42, i32 37, i32 3, metadata !20, i32 7} ; [ DW_TAG_lexical_block ]
!59 = metadata !{i32 29, i32 4, metadata !41, null}
!60 = metadata !{i32 22, i32 16, metadata !43, null}
!61 = metadata !{i32 786688, metadata !18, metadata !"x_dir", metadata !20, i32 16, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!62 = metadata !{i32 27, i32 4, metadata !41, null}
!63 = metadata !{i32 786688, metadata !18, metadata !"y_dir", metadata !20, i32 16, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!64 = metadata !{i32 28, i32 31, metadata !41, null}
!65 = metadata !{i32 786688, metadata !18, metadata !"edge_weight", metadata !20, i32 16, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!66 = metadata !{i32 31, i32 3, metadata !41, null}
!67 = metadata !{i32 35, i32 3, metadata !56, null}
!68 = metadata !{i32 39, i32 3, metadata !58, null}
!69 = metadata !{i32 41, i32 3, metadata !42, null}
!70 = metadata !{i32 44, i32 3, metadata !46, null}
!71 = metadata !{i32 45, i32 3, metadata !42, null}
!72 = metadata !{i32 48, i32 3, metadata !48, null}
!73 = metadata !{i32 786688, metadata !18, metadata !"j", metadata !20, i32 11, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!74 = metadata !{i32 786688, metadata !18, metadata !"min", metadata !20, i32 12, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!75 = metadata !{i32 786688, metadata !18, metadata !"max", metadata !20, i32 12, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!76 = metadata !{i32 54, i32 1, metadata !18, null}
!77 = metadata !{i32 56, i32 6, metadata !78, null}
!78 = metadata !{i32 786443, metadata !18, i32 56, i32 1, metadata !20, i32 10} ; [ DW_TAG_lexical_block ]
!79 = metadata !{i32 78, i32 4, metadata !80, null}
!80 = metadata !{i32 786443, metadata !81, i32 77, i32 3, metadata !20, i32 19} ; [ DW_TAG_lexical_block ]
!81 = metadata !{i32 786443, metadata !82, i32 76, i32 3, metadata !20, i32 18} ; [ DW_TAG_lexical_block ]
!82 = metadata !{i32 786443, metadata !83, i32 75, i32 2, metadata !20, i32 17} ; [ DW_TAG_lexical_block ]
!83 = metadata !{i32 786443, metadata !18, i32 74, i32 1, metadata !20, i32 16} ; [ DW_TAG_lexical_block ]
!84 = metadata !{i32 74, i32 5, metadata !83, null}
!85 = metadata !{i32 60, i32 7, metadata !86, null}
!86 = metadata !{i32 786443, metadata !87, i32 59, i32 6, metadata !20, i32 13} ; [ DW_TAG_lexical_block ]
!87 = metadata !{i32 786443, metadata !88, i32 58, i32 6, metadata !20, i32 12} ; [ DW_TAG_lexical_block ]
!88 = metadata !{i32 786443, metadata !78, i32 57, i32 2, metadata !20, i32 11} ; [ DW_TAG_lexical_block ]
!89 = metadata !{i32 58, i32 11, metadata !87, null}
!90 = metadata !{i32 65, i32 7, metadata !86, null}
!91 = metadata !{i32 62, i32 8, metadata !92, null}
!92 = metadata !{i32 786443, metadata !86, i32 61, i32 7, metadata !20, i32 14} ; [ DW_TAG_lexical_block ]
!93 = metadata !{i32 67, i32 8, metadata !94, null}
!94 = metadata !{i32 786443, metadata !86, i32 66, i32 7, metadata !20, i32 15} ; [ DW_TAG_lexical_block ]
!95 = metadata !{i32 58, i32 27, metadata !87, null}
!96 = metadata !{i32 786688, metadata !18, metadata !"d", metadata !20, i32 8, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!97 = metadata !{i32 56, i32 22, metadata !78, null}
!98 = metadata !{i32 786688, metadata !18, metadata !"c", metadata !20, i32 8, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!99 = metadata !{i32 76, i32 7, metadata !81, null}
!100 = metadata !{i32 76, i32 17, metadata !81, null}
!101 = metadata !{i32 786688, metadata !18, metadata !"l", metadata !20, i32 8, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!102 = metadata !{i32 74, i32 15, metadata !83, null}
!103 = metadata !{i32 786688, metadata !18, metadata !"k", metadata !20, i32 8, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!104 = metadata !{i32 84, i32 1, metadata !18, null}
