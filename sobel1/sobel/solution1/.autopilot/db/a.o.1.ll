; ModuleID = 'W:/Desktop/sobel1/sobel/solution1/.autopilot/db/a.g.1.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@sobel.str = internal unnamed_addr constant [6 x i8] c"sobel\00" ; [#uses=1 type=[6 x i8]*]

; [#uses=0]
define void @sobel([256 x i32]* %input_image, [256 x i32]* %output_image) nounwind {
  call void (...)* @_ssdm_op_SpecTopModule([6 x i8]* @sobel.str) nounwind
  %image = alloca [256 x [256 x i32]], align 4    ; [#uses=4 type=[256 x [256 x i32]]*]
  call void @llvm.dbg.value(metadata !{[256 x i32]* %input_image}, i64 0, metadata !27), !dbg !28 ; [debug line = 5:16] [debug variable = input_image]
  call void @llvm.dbg.value(metadata !{[256 x i32]* %output_image}, i64 0, metadata !29), !dbg !30 ; [debug line = 5:42] [debug variable = output_image]
  call void (...)* @_ssdm_SpecArrayDimSize([256 x i32]* %input_image, i32 256), !dbg !31 ; [debug line = 6:2]
  call void (...)* @_ssdm_SpecArrayDimSize([256 x i32]* %output_image, i32 256), !dbg !33 ; [debug line = 6:42]
  call void @llvm.dbg.declare(metadata !{[256 x [256 x i32]]* %image}, metadata !34), !dbg !37 ; [debug line = 9:6] [debug variable = image]
  br label %.loopexit, !dbg !38                   ; [debug line = 20:5]

.loopexit.loopexit:                               ; preds = %.preheader10
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %0
  %i = phi i32 [ 0, %0 ], [ %i.1, %.loopexit.loopexit ] ; [#uses=13 type=i32]
  %exitcond5 = icmp eq i32 %i, 256, !dbg !38      ; [#uses=1 type=i1] [debug line = 20:5]
  br i1 %exitcond5, label %7, label %.preheader10.preheader, !dbg !38 ; [debug line = 20:5]

.preheader10.preheader:                           ; preds = %.loopexit
  %tmp = icmp sgt i32 %i, 0, !dbg !40             ; [#uses=1 type=i1] [debug line = 24:3]
  %tmp.1 = icmp slt i32 %i, 255, !dbg !40         ; [#uses=1 type=i1] [debug line = 24:3]
  %or.cond = and i1 %tmp, %tmp.1, !dbg !40        ; [#uses=1 type=i1] [debug line = 24:3]
  %tmp.2 = add nsw i32 %i, -1, !dbg !44           ; [#uses=3 type=i32] [debug line = 26:4]
  %i.1 = add nsw i32 %i, 1, !dbg !44              ; [#uses=4 type=i32] [debug line = 26:4]
  call void @llvm.dbg.value(metadata !{i32 %i.1}, i64 0, metadata !46), !dbg !47 ; [debug line = 20:15] [debug variable = i]
  %tmp.4 = icmp eq i32 %i, 0, !dbg !48            ; [#uses=1 type=i1] [debug line = 32:3]
  %tmp.5 = icmp eq i32 %i, 255, !dbg !49          ; [#uses=1 type=i1] [debug line = 36:3]
  br label %.preheader10, !dbg !50                ; [debug line = 22:6]

.preheader10:                                     ; preds = %._crit_edge19, %.preheader10.preheader
  %j = phi i32 [ %j.1, %._crit_edge19 ], [ 0, %.preheader10.preheader ] ; [#uses=14 type=i32]
  %exitcond4 = icmp eq i32 %j, 256, !dbg !50      ; [#uses=1 type=i1] [debug line = 22:6]
  br i1 %exitcond4, label %.loopexit.loopexit, label %1, !dbg !50 ; [debug line = 22:6]

; <label>:1                                       ; preds = %.preheader10
  %tmp.7 = icmp sgt i32 %j, 0, !dbg !40           ; [#uses=1 type=i1] [debug line = 24:3]
  %or.cond6 = and i1 %or.cond, %tmp.7, !dbg !40   ; [#uses=1 type=i1] [debug line = 24:3]
  %tmp.8 = icmp slt i32 %j, 255, !dbg !40         ; [#uses=1 type=i1] [debug line = 24:3]
  %or.cond7 = and i1 %or.cond6, %tmp.8, !dbg !40  ; [#uses=1 type=i1] [debug line = 24:3]
  br i1 %or.cond7, label %2, label %._crit_edge, !dbg !40 ; [debug line = 24:3]

; <label>:2                                       ; preds = %1
  %tmp.9 = add nsw i32 %j, -1, !dbg !44           ; [#uses=3 type=i32] [debug line = 26:4]
  %input_image.addr = getelementptr inbounds [256 x i32]* %input_image, i32 %tmp.2, i32 %tmp.9, !dbg !44 ; [#uses=1 type=i32*] [debug line = 26:4]
  %input_image.load = load i32* %input_image.addr, align 4, !dbg !44 ; [#uses=4 type=i32] [debug line = 26:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %input_image.load) nounwind
  %input_image.addr.1 = getelementptr inbounds [256 x i32]* %input_image, i32 %tmp.2, i32 %j, !dbg !44 ; [#uses=1 type=i32*] [debug line = 26:4]
  %input_image.load.1 = load i32* %input_image.addr.1, align 4, !dbg !44 ; [#uses=3 type=i32] [debug line = 26:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %input_image.load.1) nounwind
  %tmp.10 = add nsw i32 %j, 1, !dbg !44           ; [#uses=3 type=i32] [debug line = 26:4]
  %input_image.addr.2 = getelementptr inbounds [256 x i32]* %input_image, i32 %tmp.2, i32 %tmp.10, !dbg !44 ; [#uses=1 type=i32*] [debug line = 26:4]
  %input_image.load.2 = load i32* %input_image.addr.2, align 4, !dbg !44 ; [#uses=4 type=i32] [debug line = 26:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %input_image.load.2) nounwind
  %input_image.addr.3 = getelementptr inbounds [256 x i32]* %input_image, i32 %i, i32 %tmp.9, !dbg !44 ; [#uses=1 type=i32*] [debug line = 26:4]
  %input_image.load.3 = load i32* %input_image.addr.3, align 4, !dbg !44 ; [#uses=3 type=i32] [debug line = 26:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %input_image.load.3) nounwind
  %tmp.11 = shl nsw i32 %input_image.load.3, 1, !dbg !44 ; [#uses=1 type=i32] [debug line = 26:4]
  %input_image.addr.4 = getelementptr inbounds [256 x i32]* %input_image, i32 %i, i32 %j, !dbg !44 ; [#uses=1 type=i32*] [debug line = 26:4]
  %input_image.load.4 = load i32* %input_image.addr.4, align 4, !dbg !44 ; [#uses=2 type=i32] [debug line = 26:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %input_image.load.4) nounwind
  %input_image.addr.5 = getelementptr inbounds [256 x i32]* %input_image, i32 %i, i32 %tmp.10, !dbg !44 ; [#uses=1 type=i32*] [debug line = 26:4]
  %input_image.load.5 = load i32* %input_image.addr.5, align 4, !dbg !44 ; [#uses=3 type=i32] [debug line = 26:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %input_image.load.5) nounwind
  %tmp.12 = mul i32 %input_image.load.5, 2, !dbg !44 ; [#uses=1 type=i32] [debug line = 26:4]
  %input_image.addr.6 = getelementptr inbounds [256 x i32]* %input_image, i32 %i.1, i32 %tmp.9, !dbg !44 ; [#uses=1 type=i32*] [debug line = 26:4]
  %input_image.load.6 = load i32* %input_image.addr.6, align 4, !dbg !44 ; [#uses=3 type=i32] [debug line = 26:4]
  %.neg1 = sub i32 0, %input_image.load.6         ; [#uses=2 type=i32]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %input_image.load.6) nounwind
  %input_image.addr.7 = getelementptr inbounds [256 x i32]* %input_image, i32 %i.1, i32 %j, !dbg !44 ; [#uses=1 type=i32*] [debug line = 26:4]
  %input_image.load.7 = load i32* %input_image.addr.7, align 4, !dbg !44 ; [#uses=3 type=i32] [debug line = 26:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %input_image.load.7) nounwind
  %input_image.addr.8 = getelementptr inbounds [256 x i32]* %input_image, i32 %i.1, i32 %tmp.10, !dbg !44 ; [#uses=1 type=i32*] [debug line = 26:4]
  %input_image.load.8 = load i32* %input_image.addr.8, align 4, !dbg !44 ; [#uses=4 type=i32] [debug line = 26:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %input_image.load.8) nounwind
  %.neg = sub i32 0, %input_image.load            ; [#uses=1 type=i32]
  %.neg2 = sub i32 0, %tmp.11                     ; [#uses=1 type=i32]
  %tmp.13 = add i32 %input_image.load.2, %.neg, !dbg !44 ; [#uses=1 type=i32] [debug line = 26:4]
  %tmp.14 = add i32 %tmp.13, %.neg2, !dbg !44     ; [#uses=1 type=i32] [debug line = 26:4]
  %tmp.15 = add i32 %tmp.14, %tmp.12, !dbg !44    ; [#uses=1 type=i32] [debug line = 26:4]
  %tmp.16 = add i32 %tmp.15, %.neg1, !dbg !44     ; [#uses=1 type=i32] [debug line = 26:4]
  %x_dir = add i32 %tmp.16, %input_image.load.8, !dbg !44 ; [#uses=3 type=i32] [debug line = 26:4]
  call void @llvm.dbg.value(metadata !{i32 %x_dir}, i64 0, metadata !51), !dbg !44 ; [debug line = 26:4] [debug variable = x_dir]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %input_image.load) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %input_image.load.1) nounwind
  %tmp.18 = mul i32 %input_image.load.1, 2, !dbg !52 ; [#uses=1 type=i32] [debug line = 27:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %input_image.load.2) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %input_image.load.3) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %input_image.load.4) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %input_image.load.5) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %input_image.load.6) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %input_image.load.7) nounwind
  %tmp.19 = shl nsw i32 %input_image.load.7, 1, !dbg !52 ; [#uses=1 type=i32] [debug line = 27:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %input_image.load.8) nounwind
  %.neg3 = sub i32 0, %tmp.19                     ; [#uses=1 type=i32]
  %.neg4 = sub i32 0, %input_image.load.8         ; [#uses=1 type=i32]
  %tmp.20 = add i32 %tmp.18, %input_image.load, !dbg !52 ; [#uses=1 type=i32] [debug line = 27:4]
  %tmp.21 = add i32 %tmp.20, %input_image.load.2, !dbg !52 ; [#uses=1 type=i32] [debug line = 27:4]
  %tmp.22 = add i32 %tmp.21, %.neg1, !dbg !52     ; [#uses=1 type=i32] [debug line = 27:4]
  %tmp.23 = add i32 %tmp.22, %.neg3, !dbg !52     ; [#uses=1 type=i32] [debug line = 27:4]
  %y_dir = add i32 %tmp.23, %.neg4, !dbg !52      ; [#uses=3 type=i32] [debug line = 27:4]
  call void @llvm.dbg.value(metadata !{i32 %y_dir}, i64 0, metadata !53), !dbg !52 ; [debug line = 27:4] [debug variable = y_dir]
  %neg = sub i32 0, %x_dir                        ; [#uses=1 type=i32]
  %abscond = icmp sgt i32 %x_dir, 0               ; [#uses=1 type=i1]
  %abs = select i1 %abscond, i32 %x_dir, i32 %neg ; [#uses=1 type=i32]
  %neg1 = sub i32 0, %y_dir                       ; [#uses=1 type=i32]
  %abscond1 = icmp sgt i32 %y_dir, 0              ; [#uses=1 type=i1]
  %abs1 = select i1 %abscond1, i32 %y_dir, i32 %neg1 ; [#uses=1 type=i32]
  %edge_weight = add nsw i32 %abs1, %abs, !dbg !54 ; [#uses=1 type=i32] [debug line = 28:31]
  call void @llvm.dbg.value(metadata !{i32 %edge_weight}, i64 0, metadata !55), !dbg !54 ; [debug line = 28:31] [debug variable = edge_weight]
  %image.addr.1 = getelementptr inbounds [256 x [256 x i32]]* %image, i32 0, i32 %i, i32 %j, !dbg !56 ; [#uses=1 type=i32*] [debug line = 29:4]
  store i32 %edge_weight, i32* %image.addr.1, align 4, !dbg !56 ; [debug line = 29:4]
  br label %._crit_edge, !dbg !57                 ; [debug line = 31:3]

._crit_edge:                                      ; preds = %2, %1
  br i1 %tmp.4, label %3, label %._crit_edge16, !dbg !48 ; [debug line = 32:3]

; <label>:3                                       ; preds = %._crit_edge
  %output_image.addr = getelementptr inbounds [256 x i32]* %output_image, i32 0, i32 %j, !dbg !58 ; [#uses=1 type=i32*] [debug line = 34:4]
  store i32 0, i32* %output_image.addr, align 4, !dbg !58 ; [debug line = 34:4]
  br label %._crit_edge16, !dbg !60               ; [debug line = 35:3]

._crit_edge16:                                    ; preds = %3, %._crit_edge
  br i1 %tmp.5, label %4, label %._crit_edge17, !dbg !49 ; [debug line = 36:3]

; <label>:4                                       ; preds = %._crit_edge16
  %output_image.addr.1 = getelementptr inbounds [256 x i32]* %output_image, i32 255, i32 %j, !dbg !61 ; [#uses=1 type=i32*] [debug line = 38:4]
  store i32 0, i32* %output_image.addr.1, align 4, !dbg !61 ; [debug line = 38:4]
  br label %._crit_edge17, !dbg !63               ; [debug line = 39:3]

._crit_edge17:                                    ; preds = %4, %._crit_edge16
  %tmp.28 = icmp eq i32 %j, 0, !dbg !64           ; [#uses=1 type=i1] [debug line = 41:3]
  br i1 %tmp.28, label %5, label %._crit_edge18, !dbg !64 ; [debug line = 41:3]

; <label>:5                                       ; preds = %._crit_edge17
  %output_image.addr.3 = getelementptr inbounds [256 x i32]* %output_image, i32 %i, i32 0, !dbg !65 ; [#uses=1 type=i32*] [debug line = 43:4]
  store i32 0, i32* %output_image.addr.3, align 4, !dbg !65 ; [debug line = 43:4]
  br label %._crit_edge18, !dbg !67               ; [debug line = 44:3]

._crit_edge18:                                    ; preds = %5, %._crit_edge17
  %tmp.34 = icmp eq i32 %j, 255, !dbg !68         ; [#uses=1 type=i1] [debug line = 45:3]
  br i1 %tmp.34, label %6, label %._crit_edge19, !dbg !68 ; [debug line = 45:3]

; <label>:6                                       ; preds = %._crit_edge18
  %output_image.addr.4 = getelementptr inbounds [256 x i32]* %output_image, i32 %i, i32 255, !dbg !69 ; [#uses=1 type=i32*] [debug line = 47:4]
  store i32 0, i32* %output_image.addr.4, align 4, !dbg !69 ; [debug line = 47:4]
  br label %._crit_edge19, !dbg !71               ; [debug line = 48:3]

._crit_edge19:                                    ; preds = %6, %._crit_edge18
  %j.1 = add nsw i32 %j, 1, !dbg !72              ; [#uses=1 type=i32] [debug line = 22:16]
  call void @llvm.dbg.value(metadata !{i32 %j.1}, i64 0, metadata !73), !dbg !72 ; [debug line = 22:16] [debug variable = j]
  br label %.preheader10, !dbg !72                ; [debug line = 22:16]

; <label>:7                                       ; preds = %.loopexit
  %image.addr = getelementptr inbounds [256 x [256 x i32]]* %image, i32 0, i32 1, i32 1, !dbg !74 ; [#uses=1 type=i32*] [debug line = 53:1]
  %max.4 = load i32* %image.addr, align 4, !dbg !74 ; [#uses=4 type=i32] [debug line = 53:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %max.4) nounwind
  call void @llvm.dbg.value(metadata !{i32 %max.4}, i64 0, metadata !75), !dbg !74 ; [debug line = 53:1] [debug variable = max]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %max.4) nounwind
  call void @llvm.dbg.value(metadata !{i32 %max.4}, i64 0, metadata !76), !dbg !77 ; [debug line = 54:1] [debug variable = min]
  br label %8, !dbg !78                           ; [debug line = 56:6]

; <label>:8                                       ; preds = %12, %7
  %min1 = phi i32 [ %max.4, %7 ], [ %min.1.lcssa, %12 ] ; [#uses=2 type=i32]
  %max = phi i32 [ %max.4, %7 ], [ %max.1.lcssa, %12 ] ; [#uses=2 type=i32]
  %c = phi i32 [ 1, %7 ], [ %c.1, %12 ]           ; [#uses=3 type=i32]
  %exitcond3 = icmp eq i32 %c, 255, !dbg !78      ; [#uses=1 type=i1] [debug line = 56:6]
  br i1 %exitcond3, label %.preheader8.preheader, label %.preheader9.preheader, !dbg !78 ; [debug line = 56:6]

.preheader9.preheader:                            ; preds = %8
  br label %.preheader9, !dbg !80                 ; [debug line = 58:11]

.preheader8.preheader:                            ; preds = %8
  %max.0.lcssa = phi i32 [ %max, %8 ]             ; [#uses=1 type=i32]
  %min.0.lcssa = phi i32 [ %min1, %8 ]            ; [#uses=1 type=i32]
  %tmp.6 = sub nsw i32 %max.0.lcssa, %min.0.lcssa, !dbg !83 ; [#uses=1 type=i32] [debug line = 78:4]
  br label %.preheader8, !dbg !88                 ; [debug line = 74:5]

.preheader9:                                      ; preds = %._crit_edge21, %.preheader9.preheader
  %min.1 = phi i32 [ %min.2, %._crit_edge21 ], [ %min1, %.preheader9.preheader ] ; [#uses=3 type=i32]
  %max.1 = phi i32 [ %max.2, %._crit_edge21 ], [ %max, %.preheader9.preheader ] ; [#uses=3 type=i32]
  %d = phi i32 [ %d.1, %._crit_edge21 ], [ 1, %.preheader9.preheader ] ; [#uses=3 type=i32]
  %exitcond2 = icmp eq i32 %d, 255, !dbg !80      ; [#uses=1 type=i1] [debug line = 58:11]
  br i1 %exitcond2, label %12, label %9, !dbg !80 ; [debug line = 58:11]

; <label>:9                                       ; preds = %.preheader9
  %image.addr.2 = getelementptr inbounds [256 x [256 x i32]]* %image, i32 0, i32 %c, i32 %d, !dbg !89 ; [#uses=1 type=i32*] [debug line = 60:7]
  %max.5 = load i32* %image.addr.2, align 4, !dbg !89 ; [#uses=8 type=i32] [debug line = 60:7]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %max.5) nounwind
  %tmp.26 = icmp sgt i32 %max.5, %max.1, !dbg !89 ; [#uses=1 type=i1] [debug line = 60:7]
  br i1 %tmp.26, label %10, label %._crit_edge20, !dbg !89 ; [debug line = 60:7]

; <label>:10                                      ; preds = %9
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %max.5) nounwind
  call void @llvm.dbg.value(metadata !{i32 %max.5}, i64 0, metadata !75), !dbg !91 ; [debug line = 62:8] [debug variable = max]
  br label %._crit_edge20, !dbg !93               ; [debug line = 64:7]

._crit_edge20:                                    ; preds = %10, %9
  %max.2 = phi i32 [ %max.5, %10 ], [ %max.1, %9 ] ; [#uses=1 type=i32]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %max.5) nounwind
  %tmp.27 = icmp slt i32 %max.5, %min.1, !dbg !94 ; [#uses=1 type=i1] [debug line = 65:7]
  br i1 %tmp.27, label %11, label %._crit_edge21, !dbg !94 ; [debug line = 65:7]

; <label>:11                                      ; preds = %._crit_edge20
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %max.5) nounwind
  call void @llvm.dbg.value(metadata !{i32 %max.5}, i64 0, metadata !76), !dbg !95 ; [debug line = 67:8] [debug variable = min]
  br label %._crit_edge21, !dbg !97               ; [debug line = 68:7]

._crit_edge21:                                    ; preds = %11, %._crit_edge20
  %min.2 = phi i32 [ %max.5, %11 ], [ %min.1, %._crit_edge20 ] ; [#uses=1 type=i32]
  %d.1 = add nsw i32 %d, 1, !dbg !98              ; [#uses=1 type=i32] [debug line = 58:27]
  call void @llvm.dbg.value(metadata !{i32 %d.1}, i64 0, metadata !99), !dbg !98 ; [debug line = 58:27] [debug variable = d]
  br label %.preheader9, !dbg !98                 ; [debug line = 58:27]

; <label>:12                                      ; preds = %.preheader9
  %max.1.lcssa = phi i32 [ %max.1, %.preheader9 ] ; [#uses=1 type=i32]
  %min.1.lcssa = phi i32 [ %min.1, %.preheader9 ] ; [#uses=1 type=i32]
  %c.1 = add nsw i32 %c, 1, !dbg !100             ; [#uses=1 type=i32] [debug line = 56:22]
  call void @llvm.dbg.value(metadata !{i32 %c.1}, i64 0, metadata !101), !dbg !100 ; [debug line = 56:22] [debug variable = c]
  br label %8, !dbg !100                          ; [debug line = 56:22]

.preheader8:                                      ; preds = %14, %.preheader8.preheader
  %k = phi i32 [ %k.1, %14 ], [ 1, %.preheader8.preheader ] ; [#uses=4 type=i32]
  %exitcond1 = icmp eq i32 %k, 255, !dbg !88      ; [#uses=1 type=i1] [debug line = 74:5]
  br i1 %exitcond1, label %15, label %.preheader.preheader, !dbg !88 ; [debug line = 74:5]

.preheader.preheader:                             ; preds = %.preheader8
  br label %.preheader, !dbg !102                 ; [debug line = 76:7]

.preheader:                                       ; preds = %13, %.preheader.preheader
  %l = phi i32 [ %l.1, %13 ], [ 1, %.preheader.preheader ] ; [#uses=4 type=i32]
  %exitcond = icmp eq i32 %l, 255, !dbg !102      ; [#uses=1 type=i1] [debug line = 76:7]
  br i1 %exitcond, label %14, label %13, !dbg !102 ; [debug line = 76:7]

; <label>:13                                      ; preds = %.preheader
  %image.addr.3 = getelementptr inbounds [256 x [256 x i32]]* %image, i32 0, i32 %k, i32 %l, !dbg !83 ; [#uses=1 type=i32*] [debug line = 78:4]
  %image.load = load i32* %image.addr.3, align 4, !dbg !83 ; [#uses=2 type=i32] [debug line = 78:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %image.load) nounwind
  %tmp.30 = mul nsw i32 %image.load, 255, !dbg !83 ; [#uses=1 type=i32] [debug line = 78:4]
  %tmp.31 = sdiv i32 %tmp.30, %tmp.6, !dbg !83    ; [#uses=1 type=i32] [debug line = 78:4]
  %output_image.addr.2 = getelementptr inbounds [256 x i32]* %output_image, i32 %k, i32 %l, !dbg !83 ; [#uses=1 type=i32*] [debug line = 78:4]
  store i32 %tmp.31, i32* %output_image.addr.2, align 4, !dbg !83 ; [debug line = 78:4]
  %l.1 = add nsw i32 %l, 1, !dbg !103             ; [#uses=1 type=i32] [debug line = 76:17]
  call void @llvm.dbg.value(metadata !{i32 %l.1}, i64 0, metadata !104), !dbg !103 ; [debug line = 76:17] [debug variable = l]
  br label %.preheader, !dbg !103                 ; [debug line = 76:17]

; <label>:14                                      ; preds = %.preheader
  %k.1 = add nsw i32 %k, 1, !dbg !105             ; [#uses=1 type=i32] [debug line = 74:15]
  call void @llvm.dbg.value(metadata !{i32 %k.1}, i64 0, metadata !106), !dbg !105 ; [debug line = 74:15] [debug variable = k]
  br label %.preheader8, !dbg !105                ; [debug line = 74:15]

; <label>:15                                      ; preds = %.preheader8
  ret void, !dbg !107                             ; [debug line = 84:1]
}

; [#uses=15]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=1]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=25]
declare void @_ssdm_SpecKeepArrayLoad(...)

; [#uses=2]
declare void @_ssdm_SpecArrayDimSize(...) nounwind

!llvm.dbg.cu = !{!0}
!opencl.kernels = !{!20}
!hls.encrypted.func = !{}

!0 = metadata !{i32 786449, i32 0, i32 1, metadata !"W:/Desktop/sobel1/sobel/solution1/.autopilot/db/sobel.pragma.2.c", metadata !"W:\5CDesktop\5Csobel1", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !16} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"sobel", metadata !"sobel", metadata !"", metadata !6, i32 5, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([256 x i32]*, [256 x i32]*)* @sobel, null, null, metadata !14, i32 6} ; [ DW_TAG_subprogram ]
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
!20 = metadata !{void ([256 x i32]*, [256 x i32]*)* @sobel, metadata !21, metadata !22, metadata !23, metadata !24, metadata !25, metadata !26}
!21 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1}
!22 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!23 = metadata !{metadata !"kernel_arg_type", metadata !"int [256]*", metadata !"int [256]*"}
!24 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!25 = metadata !{metadata !"kernel_arg_name", metadata !"input_image", metadata !"output_image"}
!26 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!27 = metadata !{i32 786689, metadata !5, metadata !"input_image", metadata !6, i32 16777221, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!28 = metadata !{i32 5, i32 16, metadata !5, null}
!29 = metadata !{i32 786689, metadata !5, metadata !"output_image", metadata !6, i32 33554437, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!30 = metadata !{i32 5, i32 42, metadata !5, null}
!31 = metadata !{i32 6, i32 2, metadata !32, null}
!32 = metadata !{i32 786443, metadata !5, i32 6, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!33 = metadata !{i32 6, i32 42, metadata !32, null}
!34 = metadata !{i32 786688, metadata !32, metadata !"image", metadata !6, i32 9, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!35 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2097152, i64 32, i32 0, i32 0, metadata !11, metadata !36, i32 0, i32 0} ; [ DW_TAG_array_type ]
!36 = metadata !{metadata !13, metadata !13}
!37 = metadata !{i32 9, i32 6, metadata !32, null}
!38 = metadata !{i32 20, i32 5, metadata !39, null}
!39 = metadata !{i32 786443, metadata !32, i32 20, i32 1, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!40 = metadata !{i32 24, i32 3, metadata !41, null}
!41 = metadata !{i32 786443, metadata !42, i32 23, i32 2, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!42 = metadata !{i32 786443, metadata !43, i32 22, i32 2, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!43 = metadata !{i32 786443, metadata !39, i32 21, i32 2, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!44 = metadata !{i32 26, i32 4, metadata !45, null}
!45 = metadata !{i32 786443, metadata !41, i32 25, i32 3, metadata !6, i32 5} ; [ DW_TAG_lexical_block ]
!46 = metadata !{i32 786688, metadata !32, metadata !"i", metadata !6, i32 10, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!47 = metadata !{i32 20, i32 15, metadata !39, null}
!48 = metadata !{i32 32, i32 3, metadata !41, null}
!49 = metadata !{i32 36, i32 3, metadata !41, null}
!50 = metadata !{i32 22, i32 6, metadata !42, null}
!51 = metadata !{i32 786688, metadata !32, metadata !"x_dir", metadata !6, i32 16, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!52 = metadata !{i32 27, i32 4, metadata !45, null}
!53 = metadata !{i32 786688, metadata !32, metadata !"y_dir", metadata !6, i32 16, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!54 = metadata !{i32 28, i32 31, metadata !45, null}
!55 = metadata !{i32 786688, metadata !32, metadata !"edge_weight", metadata !6, i32 16, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!56 = metadata !{i32 29, i32 4, metadata !45, null}
!57 = metadata !{i32 31, i32 3, metadata !45, null}
!58 = metadata !{i32 34, i32 4, metadata !59, null}
!59 = metadata !{i32 786443, metadata !41, i32 33, i32 3, metadata !6, i32 6} ; [ DW_TAG_lexical_block ]
!60 = metadata !{i32 35, i32 3, metadata !59, null}
!61 = metadata !{i32 38, i32 4, metadata !62, null}
!62 = metadata !{i32 786443, metadata !41, i32 37, i32 3, metadata !6, i32 7} ; [ DW_TAG_lexical_block ]
!63 = metadata !{i32 39, i32 3, metadata !62, null}
!64 = metadata !{i32 41, i32 3, metadata !41, null}
!65 = metadata !{i32 43, i32 4, metadata !66, null}
!66 = metadata !{i32 786443, metadata !41, i32 42, i32 3, metadata !6, i32 8} ; [ DW_TAG_lexical_block ]
!67 = metadata !{i32 44, i32 3, metadata !66, null}
!68 = metadata !{i32 45, i32 3, metadata !41, null}
!69 = metadata !{i32 47, i32 4, metadata !70, null}
!70 = metadata !{i32 786443, metadata !41, i32 46, i32 3, metadata !6, i32 9} ; [ DW_TAG_lexical_block ]
!71 = metadata !{i32 48, i32 3, metadata !70, null}
!72 = metadata !{i32 22, i32 16, metadata !42, null}
!73 = metadata !{i32 786688, metadata !32, metadata !"j", metadata !6, i32 11, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!74 = metadata !{i32 53, i32 1, metadata !32, null}
!75 = metadata !{i32 786688, metadata !32, metadata !"max", metadata !6, i32 12, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!76 = metadata !{i32 786688, metadata !32, metadata !"min", metadata !6, i32 12, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!77 = metadata !{i32 54, i32 1, metadata !32, null}
!78 = metadata !{i32 56, i32 6, metadata !79, null}
!79 = metadata !{i32 786443, metadata !32, i32 56, i32 1, metadata !6, i32 10} ; [ DW_TAG_lexical_block ]
!80 = metadata !{i32 58, i32 11, metadata !81, null}
!81 = metadata !{i32 786443, metadata !82, i32 58, i32 6, metadata !6, i32 12} ; [ DW_TAG_lexical_block ]
!82 = metadata !{i32 786443, metadata !79, i32 57, i32 2, metadata !6, i32 11} ; [ DW_TAG_lexical_block ]
!83 = metadata !{i32 78, i32 4, metadata !84, null}
!84 = metadata !{i32 786443, metadata !85, i32 77, i32 3, metadata !6, i32 19} ; [ DW_TAG_lexical_block ]
!85 = metadata !{i32 786443, metadata !86, i32 76, i32 3, metadata !6, i32 18} ; [ DW_TAG_lexical_block ]
!86 = metadata !{i32 786443, metadata !87, i32 75, i32 2, metadata !6, i32 17} ; [ DW_TAG_lexical_block ]
!87 = metadata !{i32 786443, metadata !32, i32 74, i32 1, metadata !6, i32 16} ; [ DW_TAG_lexical_block ]
!88 = metadata !{i32 74, i32 5, metadata !87, null}
!89 = metadata !{i32 60, i32 7, metadata !90, null}
!90 = metadata !{i32 786443, metadata !81, i32 59, i32 6, metadata !6, i32 13} ; [ DW_TAG_lexical_block ]
!91 = metadata !{i32 62, i32 8, metadata !92, null}
!92 = metadata !{i32 786443, metadata !90, i32 61, i32 7, metadata !6, i32 14} ; [ DW_TAG_lexical_block ]
!93 = metadata !{i32 64, i32 7, metadata !92, null}
!94 = metadata !{i32 65, i32 7, metadata !90, null}
!95 = metadata !{i32 67, i32 8, metadata !96, null}
!96 = metadata !{i32 786443, metadata !90, i32 66, i32 7, metadata !6, i32 15} ; [ DW_TAG_lexical_block ]
!97 = metadata !{i32 68, i32 7, metadata !96, null}
!98 = metadata !{i32 58, i32 27, metadata !81, null}
!99 = metadata !{i32 786688, metadata !32, metadata !"d", metadata !6, i32 8, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!100 = metadata !{i32 56, i32 22, metadata !79, null}
!101 = metadata !{i32 786688, metadata !32, metadata !"c", metadata !6, i32 8, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!102 = metadata !{i32 76, i32 7, metadata !85, null}
!103 = metadata !{i32 76, i32 17, metadata !85, null}
!104 = metadata !{i32 786688, metadata !32, metadata !"l", metadata !6, i32 8, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!105 = metadata !{i32 74, i32 15, metadata !87, null}
!106 = metadata !{i32 786688, metadata !32, metadata !"k", metadata !6, i32 8, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!107 = metadata !{i32 84, i32 1, metadata !32, null}
