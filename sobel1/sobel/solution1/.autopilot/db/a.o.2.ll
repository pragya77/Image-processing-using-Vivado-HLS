; ModuleID = 'W:/Desktop/sobel1/sobel/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@sobel.str = internal unnamed_addr constant [6 x i8] c"sobel\00" ; [#uses=1 type=[6 x i8]*]

; [#uses=0]
define void @sobel([256 x [256 x i32]]* %input_image, [256 x [256 x i32]]* %output_image) nounwind {
  call void (...)* @_ssdm_op_SpecBitsMap([256 x [256 x i32]]* %input_image) nounwind, !map !27
  call void (...)* @_ssdm_op_SpecBitsMap([256 x [256 x i32]]* %output_image) nounwind, !map !33
  call void (...)* @_ssdm_op_SpecTopModule([6 x i8]* @sobel.str) nounwind
  %image = alloca [256 x [256 x i32]], align 4    ; [#uses=4 type=[256 x [256 x i32]]*]
  call void @llvm.dbg.value(metadata !{[256 x [256 x i32]]* %input_image}, i64 0, metadata !37), !dbg !40 ; [debug line = 5:16] [debug variable = input_image]
  call void @llvm.dbg.value(metadata !{[256 x [256 x i32]]* %output_image}, i64 0, metadata !41), !dbg !42 ; [debug line = 5:42] [debug variable = output_image]
  call void @llvm.dbg.declare(metadata !{[256 x [256 x i32]]* %image}, metadata !43), !dbg !45 ; [debug line = 9:6] [debug variable = image]
  br label %.loopexit, !dbg !46                   ; [debug line = 20:5]

.loopexit.loopexit:                               ; preds = %.preheader10
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %0
  %i = phi i9 [ 0, %0 ], [ %i.1, %.loopexit.loopexit ] ; [#uses=8 type=i9]
  %i.cast9 = zext i9 %i to i32, !dbg !46          ; [#uses=5 type=i32] [debug line = 20:5]
  %exitcond5 = icmp eq i9 %i, -256, !dbg !46      ; [#uses=1 type=i1] [debug line = 20:5]
  %1 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 256, i64 256, i64 256) nounwind ; [#uses=0 type=i32]
  br i1 %exitcond5, label %9, label %.preheader10.preheader, !dbg !46 ; [debug line = 20:5]

.preheader10.preheader:                           ; preds = %.loopexit
  %tmp = icmp ne i9 %i, 0, !dbg !48               ; [#uses=1 type=i1] [debug line = 24:3]
  %tmp.1 = icmp ult i9 %i, 255, !dbg !48          ; [#uses=1 type=i1] [debug line = 24:3]
  %i.1 = add i9 %i, 1, !dbg !52                   ; [#uses=2 type=i9] [debug line = 26:4]
  %i.1.cast = zext i9 %i.1 to i32, !dbg !52       ; [#uses=3 type=i32] [debug line = 26:4]
  call void @llvm.dbg.value(metadata !{i9 %i.1}, i64 0, metadata !54), !dbg !55 ; [debug line = 20:15] [debug variable = i]
  %tmp.4 = icmp eq i9 %i, 0, !dbg !56             ; [#uses=1 type=i1] [debug line = 32:3]
  %tmp.5 = icmp eq i9 %i, 255, !dbg !57           ; [#uses=1 type=i1] [debug line = 36:3]
  %sum = add i9 %i, -1                            ; [#uses=1 type=i9]
  %sum.cast = sext i9 %sum to i32                 ; [#uses=3 type=i32]
  %output_image.addr.3 = getelementptr [256 x [256 x i32]]* %output_image, i32 0, i32 %i.cast9, i32 0, !dbg !58 ; [#uses=1 type=i32*] [debug line = 43:4]
  %output_image.addr.4 = getelementptr [256 x [256 x i32]]* %output_image, i32 0, i32 %i.cast9, i32 255, !dbg !60 ; [#uses=1 type=i32*] [debug line = 47:4]
  br label %.preheader10, !dbg !62                ; [debug line = 22:6]

.preheader10:                                     ; preds = %._crit_edge19, %.preheader10.preheader
  %j = phi i9 [ %j.1, %._crit_edge19 ], [ 0, %.preheader10.preheader ] ; [#uses=9 type=i9]
  %j.cast8 = zext i9 %j to i32, !dbg !62          ; [#uses=5 type=i32] [debug line = 22:6]
  %exitcond4 = icmp eq i9 %j, -256, !dbg !62      ; [#uses=1 type=i1] [debug line = 22:6]
  %2 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 256, i64 256, i64 256) nounwind ; [#uses=0 type=i32]
  br i1 %exitcond4, label %.loopexit.loopexit, label %3, !dbg !62 ; [debug line = 22:6]

; <label>:3                                       ; preds = %.preheader10
  %tmp.7 = icmp ne i9 %j, 0, !dbg !48             ; [#uses=1 type=i1] [debug line = 24:3]
  %tmp.8 = icmp ult i9 %j, 255, !dbg !48          ; [#uses=1 type=i1] [debug line = 24:3]
  %tmp1 = and i1 %tmp, %tmp.1, !dbg !48           ; [#uses=1 type=i1] [debug line = 24:3]
  %tmp2 = and i1 %tmp.7, %tmp.8, !dbg !48         ; [#uses=1 type=i1] [debug line = 24:3]
  %or.cond7 = and i1 %tmp2, %tmp1, !dbg !48       ; [#uses=1 type=i1] [debug line = 24:3]
  br i1 %or.cond7, label %4, label %._crit_edge, !dbg !48 ; [debug line = 24:3]

; <label>:4                                       ; preds = %3
  %tmp.9 = add i9 %j, -1, !dbg !52                ; [#uses=1 type=i9] [debug line = 26:4]
  %tmp.9.cast = zext i9 %tmp.9 to i32, !dbg !52   ; [#uses=3 type=i32] [debug line = 26:4]
  %input_image.addr = getelementptr [256 x [256 x i32]]* %input_image, i32 0, i32 %sum.cast, i32 %tmp.9.cast, !dbg !52 ; [#uses=1 type=i32*] [debug line = 26:4]
  %input_image.load = load i32* %input_image.addr, align 4, !dbg !52 ; [#uses=2 type=i32] [debug line = 26:4]
  %input_image.addr.1 = getelementptr [256 x [256 x i32]]* %input_image, i32 0, i32 %sum.cast, i32 %j.cast8, !dbg !52 ; [#uses=1 type=i32*] [debug line = 26:4]
  %input_image.load.1 = load i32* %input_image.addr.1, align 4, !dbg !52 ; [#uses=1 type=i32] [debug line = 26:4]
  %tmp. = add i9 %j, 1, !dbg !52                  ; [#uses=1 type=i9] [debug line = 26:4]
  %tmp..cast = zext i9 %tmp. to i32, !dbg !52     ; [#uses=3 type=i32] [debug line = 26:4]
  %input_image.addr.2 = getelementptr [256 x [256 x i32]]* %input_image, i32 0, i32 %sum.cast, i32 %tmp..cast, !dbg !52 ; [#uses=1 type=i32*] [debug line = 26:4]
  %input_image.load.2 = load i32* %input_image.addr.2, align 4, !dbg !52 ; [#uses=2 type=i32] [debug line = 26:4]
  %input_image.addr.3 = getelementptr [256 x [256 x i32]]* %input_image, i32 0, i32 %i.cast9, i32 %tmp.9.cast, !dbg !52 ; [#uses=1 type=i32*] [debug line = 26:4]
  %input_image.load.3 = load i32* %input_image.addr.3, align 4, !dbg !52 ; [#uses=1 type=i32] [debug line = 26:4]
  %tmp.3 = shl nsw i32 %input_image.load.3, 1, !dbg !52 ; [#uses=1 type=i32] [debug line = 26:4]
  %input_image.addr.4 = getelementptr [256 x [256 x i32]]* %input_image, i32 0, i32 %i.cast9, i32 %tmp..cast, !dbg !52 ; [#uses=1 type=i32*] [debug line = 26:4]
  %input_image.load.4 = load i32* %input_image.addr.4, align 4, !dbg !52 ; [#uses=1 type=i32] [debug line = 26:4]
  %tmp.10 = shl i32 %input_image.load.4, 1, !dbg !52 ; [#uses=1 type=i32] [debug line = 26:4]
  %input_image.addr.5 = getelementptr [256 x [256 x i32]]* %input_image, i32 0, i32 %i.1.cast, i32 %tmp.9.cast, !dbg !52 ; [#uses=1 type=i32*] [debug line = 26:4]
  %input_image.load.5 = load i32* %input_image.addr.5, align 4, !dbg !52 ; [#uses=2 type=i32] [debug line = 26:4]
  %input_image.addr.6 = getelementptr [256 x [256 x i32]]* %input_image, i32 0, i32 %i.1.cast, i32 %j.cast8, !dbg !52 ; [#uses=1 type=i32*] [debug line = 26:4]
  %input_image.load.6 = load i32* %input_image.addr.6, align 4, !dbg !52 ; [#uses=1 type=i32] [debug line = 26:4]
  %input_image.addr.7 = getelementptr [256 x [256 x i32]]* %input_image, i32 0, i32 %i.1.cast, i32 %tmp..cast, !dbg !52 ; [#uses=1 type=i32*] [debug line = 26:4]
  %input_image.load.7 = load i32* %input_image.addr.7, align 4, !dbg !52 ; [#uses=2 type=i32] [debug line = 26:4]
  %tmp.11 = sub i32 %input_image.load.2, %input_image.load, !dbg !52 ; [#uses=1 type=i32] [debug line = 26:4]
  %tmp.12 = sub i32 %tmp.11, %tmp.3, !dbg !52     ; [#uses=1 type=i32] [debug line = 26:4]
  %tmp.13 = add i32 %tmp.10, %tmp.12, !dbg !52    ; [#uses=1 type=i32] [debug line = 26:4]
  %tmp.14 = sub i32 %tmp.13, %input_image.load.5, !dbg !52 ; [#uses=1 type=i32] [debug line = 26:4]
  %x_dir = add i32 %tmp.14, %input_image.load.7, !dbg !52 ; [#uses=3 type=i32] [debug line = 26:4]
  call void @llvm.dbg.value(metadata !{i32 %x_dir}, i64 0, metadata !63), !dbg !52 ; [debug line = 26:4] [debug variable = x_dir]
  %tmp.15 = shl i32 %input_image.load.1, 1, !dbg !64 ; [#uses=1 type=i32] [debug line = 27:4]
  %tmp.16 = shl nsw i32 %input_image.load.6, 1, !dbg !64 ; [#uses=1 type=i32] [debug line = 27:4]
  %tmp3 = add i32 %tmp.15, %input_image.load.2, !dbg !64 ; [#uses=1 type=i32] [debug line = 27:4]
  %tmp.17 = add i32 %input_image.load, %tmp3, !dbg !64 ; [#uses=1 type=i32] [debug line = 27:4]
  %tmp.18 = sub i32 %tmp.17, %input_image.load.5, !dbg !64 ; [#uses=1 type=i32] [debug line = 27:4]
  %tmp.19 = sub i32 %tmp.18, %tmp.16, !dbg !64    ; [#uses=1 type=i32] [debug line = 27:4]
  %y_dir = sub i32 %tmp.19, %input_image.load.7, !dbg !64 ; [#uses=3 type=i32] [debug line = 27:4]
  call void @llvm.dbg.value(metadata !{i32 %y_dir}, i64 0, metadata !65), !dbg !64 ; [debug line = 27:4] [debug variable = y_dir]
  %neg = sub i32 0, %x_dir                        ; [#uses=1 type=i32]
  %abscond = icmp sgt i32 %x_dir, 0               ; [#uses=1 type=i1]
  %abs = select i1 %abscond, i32 %x_dir, i32 %neg ; [#uses=1 type=i32]
  %neg1 = sub i32 0, %y_dir                       ; [#uses=1 type=i32]
  %abscond1 = icmp sgt i32 %y_dir, 0              ; [#uses=1 type=i1]
  %abs1 = select i1 %abscond1, i32 %y_dir, i32 %neg1 ; [#uses=1 type=i32]
  %edge_weight = add nsw i32 %abs, %abs1, !dbg !66 ; [#uses=1 type=i32] [debug line = 28:31]
  call void @llvm.dbg.value(metadata !{i32 %edge_weight}, i64 0, metadata !67), !dbg !66 ; [debug line = 28:31] [debug variable = edge_weight]
  %image.addr.1 = getelementptr inbounds [256 x [256 x i32]]* %image, i32 0, i32 %i.cast9, i32 %j.cast8, !dbg !68 ; [#uses=1 type=i32*] [debug line = 29:4]
  store i32 %edge_weight, i32* %image.addr.1, align 4, !dbg !68 ; [debug line = 29:4]
  br label %._crit_edge, !dbg !69                 ; [debug line = 31:3]

._crit_edge:                                      ; preds = %4, %3
  br i1 %tmp.4, label %5, label %._crit_edge16, !dbg !56 ; [debug line = 32:3]

; <label>:5                                       ; preds = %._crit_edge
  %output_image.addr = getelementptr [256 x [256 x i32]]* %output_image, i32 0, i32 0, i32 %j.cast8, !dbg !70 ; [#uses=1 type=i32*] [debug line = 34:4]
  store i32 0, i32* %output_image.addr, align 4, !dbg !70 ; [debug line = 34:4]
  br label %._crit_edge16, !dbg !72               ; [debug line = 35:3]

._crit_edge16:                                    ; preds = %5, %._crit_edge
  br i1 %tmp.5, label %6, label %._crit_edge17, !dbg !57 ; [debug line = 36:3]

; <label>:6                                       ; preds = %._crit_edge16
  %output_image.addr.2 = getelementptr [256 x [256 x i32]]* %output_image, i32 0, i32 255, i32 %j.cast8, !dbg !73 ; [#uses=1 type=i32*] [debug line = 38:4]
  store i32 0, i32* %output_image.addr.2, align 4, !dbg !73 ; [debug line = 38:4]
  br label %._crit_edge17, !dbg !75               ; [debug line = 39:3]

._crit_edge17:                                    ; preds = %6, %._crit_edge16
  %tmp.21 = icmp eq i9 %j, 0, !dbg !76            ; [#uses=1 type=i1] [debug line = 41:3]
  br i1 %tmp.21, label %7, label %._crit_edge18, !dbg !76 ; [debug line = 41:3]

; <label>:7                                       ; preds = %._crit_edge17
  store i32 0, i32* %output_image.addr.3, align 4, !dbg !58 ; [debug line = 43:4]
  br label %._crit_edge18, !dbg !77               ; [debug line = 44:3]

._crit_edge18:                                    ; preds = %7, %._crit_edge17
  %tmp.24 = icmp eq i9 %j, 255, !dbg !78          ; [#uses=1 type=i1] [debug line = 45:3]
  br i1 %tmp.24, label %8, label %._crit_edge19, !dbg !78 ; [debug line = 45:3]

; <label>:8                                       ; preds = %._crit_edge18
  store i32 0, i32* %output_image.addr.4, align 4, !dbg !60 ; [debug line = 47:4]
  br label %._crit_edge19, !dbg !79               ; [debug line = 48:3]

._crit_edge19:                                    ; preds = %8, %._crit_edge18
  %j.1 = add i9 %j, 1, !dbg !80                   ; [#uses=1 type=i9] [debug line = 22:16]
  call void @llvm.dbg.value(metadata !{i9 %j.1}, i64 0, metadata !81), !dbg !80 ; [debug line = 22:16] [debug variable = j]
  br label %.preheader10, !dbg !80                ; [debug line = 22:16]

; <label>:9                                       ; preds = %.loopexit
  %image.addr = getelementptr inbounds [256 x [256 x i32]]* %image, i32 0, i32 1, i32 1, !dbg !82 ; [#uses=1 type=i32*] [debug line = 53:1]
  %max.5 = load i32* %image.addr, align 4, !dbg !82 ; [#uses=2 type=i32] [debug line = 53:1]
  call void @llvm.dbg.value(metadata !{i32 %max.5}, i64 0, metadata !83), !dbg !82 ; [debug line = 53:1] [debug variable = max]
  call void @llvm.dbg.value(metadata !{i32 %max.5}, i64 0, metadata !84), !dbg !85 ; [debug line = 54:1] [debug variable = min]
  br label %10, !dbg !86                          ; [debug line = 56:6]

; <label>:10                                      ; preds = %13, %9
  %min1 = phi i32 [ %max.5, %9 ], [ %min.1.lcssa, %13 ] ; [#uses=2 type=i32]
  %max = phi i32 [ %max.5, %9 ], [ %max.1.lcssa, %13 ] ; [#uses=2 type=i32]
  %c = phi i8 [ 1, %9 ], [ %c.1, %13 ]            ; [#uses=3 type=i8]
  %c.cast7 = zext i8 %c to i32, !dbg !86          ; [#uses=1 type=i32] [debug line = 56:6]
  %exitcond3 = icmp eq i8 %c, -1, !dbg !86        ; [#uses=1 type=i1] [debug line = 56:6]
  %11 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 254, i64 254, i64 254) nounwind ; [#uses=0 type=i32]
  br i1 %exitcond3, label %.preheader8.preheader, label %.preheader9.preheader, !dbg !86 ; [debug line = 56:6]

.preheader9.preheader:                            ; preds = %10
  br label %.preheader9, !dbg !88                 ; [debug line = 58:11]

.preheader8.preheader:                            ; preds = %10
  %max.lcssa = phi i32 [ %max, %10 ]              ; [#uses=1 type=i32]
  %min1.lcssa = phi i32 [ %min1, %10 ]            ; [#uses=1 type=i32]
  %tmp.6 = sub nsw i32 %max.lcssa, %min1.lcssa, !dbg !91 ; [#uses=1 type=i32] [debug line = 78:4]
  br label %.preheader8, !dbg !96                 ; [debug line = 74:5]

.preheader9:                                      ; preds = %._crit_edge20, %.preheader9.preheader
  %min.1 = phi i32 [ %max.4, %._crit_edge20 ], [ %min1, %.preheader9.preheader ] ; [#uses=3 type=i32]
  %max.1 = phi i32 [ %max.6.max.1, %._crit_edge20 ], [ %max, %.preheader9.preheader ] ; [#uses=3 type=i32]
  %d = phi i8 [ %d.1, %._crit_edge20 ], [ 1, %.preheader9.preheader ] ; [#uses=3 type=i8]
  %d.cast6 = zext i8 %d to i32, !dbg !88          ; [#uses=1 type=i32] [debug line = 58:11]
  %exitcond2 = icmp eq i8 %d, -1, !dbg !88        ; [#uses=1 type=i1] [debug line = 58:11]
  %12 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 254, i64 254, i64 254) nounwind ; [#uses=0 type=i32]
  br i1 %exitcond2, label %13, label %._crit_edge20, !dbg !88 ; [debug line = 58:11]

._crit_edge20:                                    ; preds = %.preheader9
  %image.addr.2 = getelementptr inbounds [256 x [256 x i32]]* %image, i32 0, i32 %c.cast7, i32 %d.cast6, !dbg !97 ; [#uses=1 type=i32*] [debug line = 60:7]
  %max.6 = load i32* %image.addr.2, align 4, !dbg !97 ; [#uses=4 type=i32] [debug line = 60:7]
  call void @llvm.dbg.value(metadata !{i32 %max.6}, i64 0, metadata !83), !dbg !99 ; [debug line = 62:8] [debug variable = max]
  %tmp.2 = icmp sgt i32 %max.6, %max.1, !dbg !97  ; [#uses=1 type=i1] [debug line = 60:7]
  %max.6.max.1 = select i1 %tmp.2, i32 %max.6, i32 %max.1, !dbg !97 ; [#uses=1 type=i32] [debug line = 60:7]
  %tmp.20 = icmp slt i32 %max.6, %min.1, !dbg !101 ; [#uses=1 type=i1] [debug line = 65:7]
  call void @llvm.dbg.value(metadata !{i32 %max.6}, i64 0, metadata !84), !dbg !102 ; [debug line = 67:8] [debug variable = min]
  %max.4 = select i1 %tmp.20, i32 %max.6, i32 %min.1, !dbg !101 ; [#uses=1 type=i32] [debug line = 65:7]
  call void @llvm.dbg.value(metadata !{i32 %max.4}, i64 0, metadata !83), !dbg !101 ; [debug line = 65:7] [debug variable = max]
  %d.1 = add i8 %d, 1, !dbg !104                  ; [#uses=1 type=i8] [debug line = 58:27]
  call void @llvm.dbg.value(metadata !{i8 %d.1}, i64 0, metadata !105), !dbg !104 ; [debug line = 58:27] [debug variable = d]
  br label %.preheader9, !dbg !104                ; [debug line = 58:27]

; <label>:13                                      ; preds = %.preheader9
  %max.1.lcssa = phi i32 [ %max.1, %.preheader9 ] ; [#uses=1 type=i32]
  %min.1.lcssa = phi i32 [ %min.1, %.preheader9 ] ; [#uses=1 type=i32]
  %c.1 = add i8 %c, 1, !dbg !106                  ; [#uses=1 type=i8] [debug line = 56:22]
  call void @llvm.dbg.value(metadata !{i8 %c.1}, i64 0, metadata !107), !dbg !106 ; [debug line = 56:22] [debug variable = c]
  br label %10, !dbg !106                         ; [debug line = 56:22]

.preheader8:                                      ; preds = %17, %.preheader8.preheader
  %k = phi i8 [ %k.1, %17 ], [ 1, %.preheader8.preheader ] ; [#uses=3 type=i8]
  %k.cast5 = zext i8 %k to i32, !dbg !96          ; [#uses=2 type=i32] [debug line = 74:5]
  %exitcond1 = icmp eq i8 %k, -1, !dbg !96        ; [#uses=1 type=i1] [debug line = 74:5]
  %14 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 254, i64 254, i64 254) nounwind ; [#uses=0 type=i32]
  br i1 %exitcond1, label %18, label %.preheader.preheader, !dbg !96 ; [debug line = 74:5]

.preheader.preheader:                             ; preds = %.preheader8
  br label %.preheader, !dbg !108                 ; [debug line = 76:7]

.preheader:                                       ; preds = %16, %.preheader.preheader
  %l = phi i8 [ %l.1, %16 ], [ 1, %.preheader.preheader ] ; [#uses=3 type=i8]
  %l.cast4 = zext i8 %l to i32, !dbg !108         ; [#uses=2 type=i32] [debug line = 76:7]
  %exitcond = icmp eq i8 %l, -1, !dbg !108        ; [#uses=1 type=i1] [debug line = 76:7]
  %15 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 254, i64 254, i64 254) nounwind ; [#uses=0 type=i32]
  br i1 %exitcond, label %17, label %16, !dbg !108 ; [debug line = 76:7]

; <label>:16                                      ; preds = %.preheader
  %image.addr.3 = getelementptr inbounds [256 x [256 x i32]]* %image, i32 0, i32 %k.cast5, i32 %l.cast4, !dbg !91 ; [#uses=1 type=i32*] [debug line = 78:4]
  %image.load = load i32* %image.addr.3, align 4, !dbg !91 ; [#uses=2 type=i32] [debug line = 78:4]
  %_shl = shl i32 %image.load, 8, !dbg !91        ; [#uses=1 type=i32] [debug line = 78:4]
  %tmp.22 = sub i32 %_shl, %image.load, !dbg !91  ; [#uses=1 type=i32] [debug line = 78:4]
  %tmp.23 = sdiv i32 %tmp.22, %tmp.6, !dbg !91    ; [#uses=1 type=i32] [debug line = 78:4]
  %output_image.addr.1 = getelementptr [256 x [256 x i32]]* %output_image, i32 0, i32 %k.cast5, i32 %l.cast4, !dbg !91 ; [#uses=1 type=i32*] [debug line = 78:4]
  store i32 %tmp.23, i32* %output_image.addr.1, align 4, !dbg !91 ; [debug line = 78:4]
  %l.1 = add i8 %l, 1, !dbg !109                  ; [#uses=1 type=i8] [debug line = 76:17]
  call void @llvm.dbg.value(metadata !{i8 %l.1}, i64 0, metadata !110), !dbg !109 ; [debug line = 76:17] [debug variable = l]
  br label %.preheader, !dbg !109                 ; [debug line = 76:17]

; <label>:17                                      ; preds = %.preheader
  %k.1 = add i8 %k, 1, !dbg !111                  ; [#uses=1 type=i8] [debug line = 74:15]
  call void @llvm.dbg.value(metadata !{i8 %k.1}, i64 0, metadata !112), !dbg !111 ; [debug line = 74:15] [debug variable = k]
  br label %.preheader8, !dbg !111                ; [debug line = 74:15]

; <label>:18                                      ; preds = %.preheader8
  ret void, !dbg !113                             ; [debug line = 84:1]
}

; [#uses=16]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=1]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=6]
declare i32 @_ssdm_op_SpecLoopTripCount(...)

; [#uses=2]
declare void @_ssdm_op_SpecBitsMap(...)

!llvm.dbg.cu = !{!0}
!opencl.kernels = !{!20}
!hls.encrypted.func = !{}
!llvm.map.gv = !{}

!0 = metadata !{i32 786449, i32 0, i32 1, metadata !"W:/Desktop/sobel1/sobel/solution1/.autopilot/db/sobel.pragma.2.c", metadata !"W:\5CDesktop\5Csobel1", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !16} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"sobel", metadata !"sobel", metadata !"", metadata !6, i32 5, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !14, i32 6} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"sobel.c", metadata !"W:\5CDesktop\5Csobel1", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{null, metadata !9, metadata !9}
!9 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8192, i64 32, i32 0, i32 0, metadata !11, metadata !12, i32 0, i32 0} ; [ DW_TAG_array_type ]
!11 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!12 = metadata !{metadata !13}
!13 = metadata !{i32 786465, i64 0, i64 255}      ; [ DW_TAG_subrange_type ]
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!16 = metadata !{metadata !17}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 786484, i32 0, null, metadata !"_sys_nerr", metadata !"_sys_nerr", metadata !"", metadata !19, i32 157, metadata !11, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!19 = metadata !{i32 786473, metadata !"C:/Xilinx/Vivado_HLS/2016.3/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\5Cstdlib.h", metadata !"W:\5CDesktop\5Csobel1", null} ; [ DW_TAG_file_type ]
!20 = metadata !{null, metadata !21, metadata !22, metadata !23, metadata !24, metadata !25, metadata !26}
!21 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1}
!22 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!23 = metadata !{metadata !"kernel_arg_type", metadata !"int [256]*", metadata !"int [256]*"}
!24 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!25 = metadata !{metadata !"kernel_arg_name", metadata !"input_image", metadata !"output_image"}
!26 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!27 = metadata !{metadata !28}
!28 = metadata !{i32 0, i32 31, metadata !29}
!29 = metadata !{metadata !30}
!30 = metadata !{metadata !"input_image", metadata !31, metadata !"int", i32 0, i32 31}
!31 = metadata !{metadata !32, metadata !32}
!32 = metadata !{i32 0, i32 255, i32 1}
!33 = metadata !{metadata !34}
!34 = metadata !{i32 0, i32 31, metadata !35}
!35 = metadata !{metadata !36}
!36 = metadata !{metadata !"output_image", metadata !31, metadata !"int", i32 0, i32 31}
!37 = metadata !{i32 786689, metadata !5, metadata !"input_image", null, i32 5, metadata !38, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!38 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2097152, i64 32, i32 0, i32 0, metadata !11, metadata !39, i32 0, i32 0} ; [ DW_TAG_array_type ]
!39 = metadata !{metadata !13, metadata !13}
!40 = metadata !{i32 5, i32 16, metadata !5, null}
!41 = metadata !{i32 786689, metadata !5, metadata !"output_image", null, i32 5, metadata !38, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!42 = metadata !{i32 5, i32 42, metadata !5, null}
!43 = metadata !{i32 786688, metadata !44, metadata !"image", metadata !6, i32 9, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!44 = metadata !{i32 786443, metadata !5, i32 6, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!45 = metadata !{i32 9, i32 6, metadata !44, null}
!46 = metadata !{i32 20, i32 5, metadata !47, null}
!47 = metadata !{i32 786443, metadata !44, i32 20, i32 1, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!48 = metadata !{i32 24, i32 3, metadata !49, null}
!49 = metadata !{i32 786443, metadata !50, i32 23, i32 2, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!50 = metadata !{i32 786443, metadata !51, i32 22, i32 2, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!51 = metadata !{i32 786443, metadata !47, i32 21, i32 2, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!52 = metadata !{i32 26, i32 4, metadata !53, null}
!53 = metadata !{i32 786443, metadata !49, i32 25, i32 3, metadata !6, i32 5} ; [ DW_TAG_lexical_block ]
!54 = metadata !{i32 786688, metadata !44, metadata !"i", metadata !6, i32 10, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!55 = metadata !{i32 20, i32 15, metadata !47, null}
!56 = metadata !{i32 32, i32 3, metadata !49, null}
!57 = metadata !{i32 36, i32 3, metadata !49, null}
!58 = metadata !{i32 43, i32 4, metadata !59, null}
!59 = metadata !{i32 786443, metadata !49, i32 42, i32 3, metadata !6, i32 8} ; [ DW_TAG_lexical_block ]
!60 = metadata !{i32 47, i32 4, metadata !61, null}
!61 = metadata !{i32 786443, metadata !49, i32 46, i32 3, metadata !6, i32 9} ; [ DW_TAG_lexical_block ]
!62 = metadata !{i32 22, i32 6, metadata !50, null}
!63 = metadata !{i32 786688, metadata !44, metadata !"x_dir", metadata !6, i32 16, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!64 = metadata !{i32 27, i32 4, metadata !53, null}
!65 = metadata !{i32 786688, metadata !44, metadata !"y_dir", metadata !6, i32 16, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!66 = metadata !{i32 28, i32 31, metadata !53, null}
!67 = metadata !{i32 786688, metadata !44, metadata !"edge_weight", metadata !6, i32 16, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!68 = metadata !{i32 29, i32 4, metadata !53, null}
!69 = metadata !{i32 31, i32 3, metadata !53, null}
!70 = metadata !{i32 34, i32 4, metadata !71, null}
!71 = metadata !{i32 786443, metadata !49, i32 33, i32 3, metadata !6, i32 6} ; [ DW_TAG_lexical_block ]
!72 = metadata !{i32 35, i32 3, metadata !71, null}
!73 = metadata !{i32 38, i32 4, metadata !74, null}
!74 = metadata !{i32 786443, metadata !49, i32 37, i32 3, metadata !6, i32 7} ; [ DW_TAG_lexical_block ]
!75 = metadata !{i32 39, i32 3, metadata !74, null}
!76 = metadata !{i32 41, i32 3, metadata !49, null}
!77 = metadata !{i32 44, i32 3, metadata !59, null}
!78 = metadata !{i32 45, i32 3, metadata !49, null}
!79 = metadata !{i32 48, i32 3, metadata !61, null}
!80 = metadata !{i32 22, i32 16, metadata !50, null}
!81 = metadata !{i32 786688, metadata !44, metadata !"j", metadata !6, i32 11, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!82 = metadata !{i32 53, i32 1, metadata !44, null}
!83 = metadata !{i32 786688, metadata !44, metadata !"max", metadata !6, i32 12, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!84 = metadata !{i32 786688, metadata !44, metadata !"min", metadata !6, i32 12, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!85 = metadata !{i32 54, i32 1, metadata !44, null}
!86 = metadata !{i32 56, i32 6, metadata !87, null}
!87 = metadata !{i32 786443, metadata !44, i32 56, i32 1, metadata !6, i32 10} ; [ DW_TAG_lexical_block ]
!88 = metadata !{i32 58, i32 11, metadata !89, null}
!89 = metadata !{i32 786443, metadata !90, i32 58, i32 6, metadata !6, i32 12} ; [ DW_TAG_lexical_block ]
!90 = metadata !{i32 786443, metadata !87, i32 57, i32 2, metadata !6, i32 11} ; [ DW_TAG_lexical_block ]
!91 = metadata !{i32 78, i32 4, metadata !92, null}
!92 = metadata !{i32 786443, metadata !93, i32 77, i32 3, metadata !6, i32 19} ; [ DW_TAG_lexical_block ]
!93 = metadata !{i32 786443, metadata !94, i32 76, i32 3, metadata !6, i32 18} ; [ DW_TAG_lexical_block ]
!94 = metadata !{i32 786443, metadata !95, i32 75, i32 2, metadata !6, i32 17} ; [ DW_TAG_lexical_block ]
!95 = metadata !{i32 786443, metadata !44, i32 74, i32 1, metadata !6, i32 16} ; [ DW_TAG_lexical_block ]
!96 = metadata !{i32 74, i32 5, metadata !95, null}
!97 = metadata !{i32 60, i32 7, metadata !98, null}
!98 = metadata !{i32 786443, metadata !89, i32 59, i32 6, metadata !6, i32 13} ; [ DW_TAG_lexical_block ]
!99 = metadata !{i32 62, i32 8, metadata !100, null}
!100 = metadata !{i32 786443, metadata !98, i32 61, i32 7, metadata !6, i32 14} ; [ DW_TAG_lexical_block ]
!101 = metadata !{i32 65, i32 7, metadata !98, null}
!102 = metadata !{i32 67, i32 8, metadata !103, null}
!103 = metadata !{i32 786443, metadata !98, i32 66, i32 7, metadata !6, i32 15} ; [ DW_TAG_lexical_block ]
!104 = metadata !{i32 58, i32 27, metadata !89, null}
!105 = metadata !{i32 786688, metadata !44, metadata !"d", metadata !6, i32 8, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!106 = metadata !{i32 56, i32 22, metadata !87, null}
!107 = metadata !{i32 786688, metadata !44, metadata !"c", metadata !6, i32 8, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!108 = metadata !{i32 76, i32 7, metadata !93, null}
!109 = metadata !{i32 76, i32 17, metadata !93, null}
!110 = metadata !{i32 786688, metadata !44, metadata !"l", metadata !6, i32 8, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!111 = metadata !{i32 74, i32 15, metadata !95, null}
!112 = metadata !{i32 786688, metadata !44, metadata !"k", metadata !6, i32 8, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!113 = metadata !{i32 84, i32 1, metadata !44, null}
