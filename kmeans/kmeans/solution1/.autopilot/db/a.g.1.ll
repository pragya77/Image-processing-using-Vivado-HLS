; ModuleID = 'W:/Desktop/kmeans/kmeans/solution1/.autopilot/db/a.g.1.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@kmeans.str = internal unnamed_addr constant [7 x i8] c"kmeans\00" ; [#uses=1 type=[7 x i8]*]

; [#uses=16]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=2]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=0]
define void @kmeans([256 x i16]* %image_in, [256 x i16]* %final) nounwind {
  call void (...)* @_ssdm_op_SpecTopModule([7 x i8]* @kmeans.str) nounwind
  %k = alloca [4 x i32], align 4                  ; [#uses=5 type=[4 x i32]*]
  %ab = alloca [4 x i16], align 2                 ; [#uses=3 type=[4 x i16]*]
  call void @llvm.dbg.value(metadata !{[256 x i16]* %image_in}, i64 0, metadata !28), !dbg !29 ; [debug line = 5:19] [debug variable = image_in]
  call void @llvm.dbg.value(metadata !{[256 x i16]* %final}, i64 0, metadata !30), !dbg !31 ; [debug line = 5:44] [debug variable = final]
  call void (...)* @_ssdm_SpecArrayDimSize([256 x i16]* %final, i32 256), !dbg !32 ; [debug line = 6:2]
  call void (...)* @_ssdm_SpecArrayDimSize([256 x i16]* %image_in, i32 256), !dbg !34 ; [debug line = 6:36]
  call void @llvm.dbg.declare(metadata !{[4 x i32]* %k}, metadata !35), !dbg !39 ; [debug line = 10:6] [debug variable = k]
  %k.addr = getelementptr [4 x i32]* %k, i32 0, i32 0, !dbg !40 ; [#uses=1 type=i32*] [debug line = 10:24]
  store i32 5, i32* %k.addr, align 4, !dbg !40    ; [debug line = 10:24]
  %k.addr.1 = getelementptr [4 x i32]* %k, i32 0, i32 1, !dbg !40 ; [#uses=1 type=i32*] [debug line = 10:24]
  store i32 40, i32* %k.addr.1, align 4, !dbg !40 ; [debug line = 10:24]
  %k.addr.2 = getelementptr [4 x i32]* %k, i32 0, i32 2, !dbg !40 ; [#uses=1 type=i32*] [debug line = 10:24]
  store i32 80, i32* %k.addr.2, align 4, !dbg !40 ; [debug line = 10:24]
  %k.addr.3 = getelementptr [4 x i32]* %k, i32 0, i32 3, !dbg !40 ; [#uses=1 type=i32*] [debug line = 10:24]
  store i32 180, i32* %k.addr.3, align 4, !dbg !40 ; [debug line = 10:24]
  call void @llvm.dbg.declare(metadata !{[4 x i16]* %ab}, metadata !41), !dbg !43 ; [debug line = 12:8] [debug variable = ab]
  %1 = alloca [65536 x i16], align 2, !dbg !44    ; [#uses=4 type=[65536 x i16]*] [debug line = 17:28]
  %2 = alloca [65536 x i16], align 2, !dbg !45    ; [#uses=4 type=[65536 x i16]*] [debug line = 18:28]
  %3 = alloca [65536 x i16], align 2, !dbg !46    ; [#uses=4 type=[65536 x i16]*] [debug line = 19:28]
  %4 = alloca [65536 x i16], align 2, !dbg !47    ; [#uses=4 type=[65536 x i16]*] [debug line = 20:28]
  br label %5, !dbg !48                           ; [debug line = 39:6]

; <label>:5                                       ; preds = %7, %0
  %s = phi i16 [ 0, %0 ], [ %s.1, %7 ]            ; [#uses=3 type=i16]
  %exitcond1 = icmp eq i16 %s, 256, !dbg !48      ; [#uses=1 type=i1] [debug line = 39:6]
  br i1 %exitcond1, label %.preheader39.preheader, label %.preheader40.preheader, !dbg !48 ; [debug line = 39:6]

.preheader40.preheader:                           ; preds = %5
  %tmp = sext i16 %s to i32, !dbg !50             ; [#uses=1 type=i32] [debug line = 43:4]
  %tmp.1 = shl nsw i32 %tmp, 8, !dbg !50          ; [#uses=1 type=i32] [debug line = 43:4]
  br label %.preheader40, !dbg !54                ; [debug line = 41:7]

.preheader39.preheader:                           ; preds = %5
  %ab.addr = getelementptr inbounds [4 x i16]* %ab, i32 0, i32 0, !dbg !55 ; [#uses=1 type=i16*] [debug line = 67:4]
  br label %.preheader39, !dbg !60                ; [debug line = 57:6]

.preheader40:                                     ; preds = %6, %.preheader40.preheader
  %t = phi i16 [ %t.1, %6 ], [ 0, %.preheader40.preheader ] ; [#uses=3 type=i16]
  %exitcond3 = icmp eq i16 %t, 256, !dbg !54      ; [#uses=1 type=i1] [debug line = 41:7]
  br i1 %exitcond3, label %7, label %6, !dbg !54  ; [debug line = 41:7]

; <label>:6                                       ; preds = %.preheader40
  %tmp.5 = sext i16 %t to i32, !dbg !50           ; [#uses=1 type=i32] [debug line = 43:4]
  %.sum1 = add i32 %tmp.5, %tmp.1, !dbg !50       ; [#uses=4 type=i32] [debug line = 43:4]
  %.addr = getelementptr inbounds [65536 x i16]* %1, i32 0, i32 %.sum1, !dbg !50 ; [#uses=1 type=i16*] [debug line = 43:4]
  store i16 0, i16* %.addr, align 2, !dbg !50     ; [debug line = 43:4]
  %.addr.1 = getelementptr inbounds [65536 x i16]* %2, i32 0, i32 %.sum1, !dbg !61 ; [#uses=1 type=i16*] [debug line = 44:4]
  store i16 0, i16* %.addr.1, align 2, !dbg !61   ; [debug line = 44:4]
  %.addr.2 = getelementptr inbounds [65536 x i16]* %3, i32 0, i32 %.sum1, !dbg !62 ; [#uses=1 type=i16*] [debug line = 45:4]
  store i16 0, i16* %.addr.2, align 2, !dbg !62   ; [debug line = 45:4]
  %.addr.3 = getelementptr inbounds [65536 x i16]* %4, i32 0, i32 %.sum1, !dbg !63 ; [#uses=1 type=i16*] [debug line = 46:4]
  store i16 0, i16* %.addr.3, align 2, !dbg !63   ; [debug line = 46:4]
  %t.1 = add i16 %t, 1, !dbg !64                  ; [#uses=1 type=i16] [debug line = 41:17]
  call void @llvm.dbg.value(metadata !{i16 %t.1}, i64 0, metadata !65), !dbg !64 ; [debug line = 41:17] [debug variable = t]
  br label %.preheader40, !dbg !64                ; [debug line = 41:17]

; <label>:7                                       ; preds = %.preheader40
  %s.1 = add i16 %s, 1, !dbg !66                  ; [#uses=1 type=i16] [debug line = 39:16]
  call void @llvm.dbg.value(metadata !{i16 %s.1}, i64 0, metadata !67), !dbg !66 ; [debug line = 39:16] [debug variable = s]
  br label %5, !dbg !66                           ; [debug line = 39:16]

.preheader39:                                     ; preds = %20, %.preheader39.preheader
  %cluster = phi i16 [ %cluster.1.lcssa, %20 ], [ 0, %.preheader39.preheader ] ; [#uses=1 type=i16]
  %i = phi i16 [ %i.1, %20 ], [ 0, %.preheader39.preheader ] ; [#uses=3 type=i16]
  %exitcond2 = icmp eq i16 %i, 256, !dbg !60      ; [#uses=1 type=i1] [debug line = 57:6]
  br i1 %exitcond2, label %.preheader58, label %.preheader38.preheader, !dbg !60 ; [debug line = 57:6]

.preheader58:                                     ; preds = %.preheader39
  br label %21, !dbg !68                          ; [debug line = 103:5]

.preheader38.preheader:                           ; preds = %.preheader39
  %tmp.2 = sext i16 %i to i32, !dbg !70           ; [#uses=2 type=i32] [debug line = 61:4]
  %tmp.3 = shl nsw i32 %tmp.2, 8, !dbg !71        ; [#uses=4 type=i32] [debug line = 80:5]
  br label %.preheader38, !dbg !73                ; [debug line = 59:7]

.preheader38:                                     ; preds = %._crit_edge44, %.preheader38.preheader
  %cluster.1 = phi i16 [ %cluster.2.lcssa, %._crit_edge44 ], [ %cluster, %.preheader38.preheader ] ; [#uses=2 type=i16]
  %j = phi i16 [ %j.1, %._crit_edge44 ], [ 0, %.preheader38.preheader ] ; [#uses=3 type=i16]
  %exitcond5 = icmp eq i16 %j, 256, !dbg !73      ; [#uses=1 type=i1] [debug line = 59:7]
  br i1 %exitcond5, label %20, label %8, !dbg !73 ; [debug line = 59:7]

; <label>:8                                       ; preds = %.preheader38
  %tmp.10 = sext i16 %j to i32, !dbg !70          ; [#uses=5 type=i32] [debug line = 61:4]
  %image_in.addr = getelementptr inbounds [256 x i16]* %image_in, i32 %tmp.2, i32 %tmp.10, !dbg !70 ; [#uses=1 type=i16*] [debug line = 61:4]
  %r = load i16* %image_in.addr, align 2, !dbg !70 ; [#uses=6 type=i16] [debug line = 61:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i16 %r) nounwind
  call void @llvm.dbg.value(metadata !{i16 %r}, i64 0, metadata !74), !dbg !70 ; [debug line = 61:4] [debug variable = r]
  %tmp.11 = sext i16 %r to i32, !dbg !75          ; [#uses=1 type=i32] [debug line = 65:10]
  br label %9, !dbg !78                           ; [debug line = 63:8]

; <label>:9                                       ; preds = %10, %8
  %p = phi i16 [ 0, %8 ], [ %p.2, %10 ]           ; [#uses=3 type=i16]
  %exitcond8 = icmp eq i16 %p, 4, !dbg !78        ; [#uses=1 type=i1] [debug line = 63:8]
  br i1 %exitcond8, label %11, label %10, !dbg !78 ; [debug line = 63:8]

; <label>:10                                      ; preds = %9
  %tmp.17 = sext i16 %p to i32, !dbg !75          ; [#uses=2 type=i32] [debug line = 65:10]
  %k.addr.4 = getelementptr inbounds [4 x i32]* %k, i32 0, i32 %tmp.17, !dbg !75 ; [#uses=1 type=i32*] [debug line = 65:10]
  %k.load = load i32* %k.addr.4, align 4, !dbg !75 ; [#uses=2 type=i32] [debug line = 65:10]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %k.load) nounwind
  %tmp.18 = sub nsw i32 %tmp.11, %k.load, !dbg !75 ; [#uses=3 type=i32] [debug line = 65:10]
  %neg = sub i32 0, %tmp.18                       ; [#uses=1 type=i32]
  %abscond = icmp sgt i32 %tmp.18, 0              ; [#uses=1 type=i1]
  %abs = select i1 %abscond, i32 %tmp.18, i32 %neg ; [#uses=1 type=i32]
  %tmp.19 = trunc i32 %abs to i16, !dbg !75       ; [#uses=1 type=i16] [debug line = 65:10]
  %ab.addr.1 = getelementptr inbounds [4 x i16]* %ab, i32 0, i32 %tmp.17, !dbg !75 ; [#uses=1 type=i16*] [debug line = 65:10]
  store i16 %tmp.19, i16* %ab.addr.1, align 2, !dbg !75 ; [debug line = 65:10]
  %p.2 = add i16 %p, 1, !dbg !79                  ; [#uses=1 type=i16] [debug line = 63:16]
  call void @llvm.dbg.value(metadata !{i16 %p.2}, i64 0, metadata !80), !dbg !79 ; [debug line = 63:16] [debug variable = p]
  br label %9, !dbg !79                           ; [debug line = 63:16]

; <label>:11                                      ; preds = %9
  %min = load i16* %ab.addr, align 2, !dbg !55    ; [#uses=2 type=i16] [debug line = 67:4]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i16 %min) nounwind
  call void @llvm.dbg.value(metadata !{i16 %min}, i64 0, metadata !81), !dbg !55 ; [debug line = 67:4] [debug variable = min]
  br label %12, !dbg !82                          ; [debug line = 69:9]

; <label>:12                                      ; preds = %._crit_edge, %11
  %cluster.2 = phi i16 [ %cluster.1, %11 ], [ %cluster.3, %._crit_edge ] ; [#uses=2 type=i16]
  %min1 = phi i16 [ %min, %11 ], [ %min.1, %._crit_edge ] ; [#uses=2 type=i16]
  %cluster.4 = phi i16 [ 1, %11 ], [ %p.3, %._crit_edge ] ; [#uses=4 type=i16]
  %exitcond9 = icmp eq i16 %cluster.4, 4, !dbg !82 ; [#uses=1 type=i1] [debug line = 69:9]
  br i1 %exitcond9, label %15, label %13, !dbg !82 ; [debug line = 69:9]

; <label>:13                                      ; preds = %12
  %tmp.25 = sext i16 %cluster.4 to i32, !dbg !84  ; [#uses=1 type=i32] [debug line = 71:7]
  %ab.addr.2 = getelementptr inbounds [4 x i16]* %ab, i32 0, i32 %tmp.25, !dbg !84 ; [#uses=1 type=i16*] [debug line = 71:7]
  %min.2 = load i16* %ab.addr.2, align 2, !dbg !84 ; [#uses=4 type=i16] [debug line = 71:7]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i16 %min.2) nounwind
  %tmp.26 = icmp slt i16 %min.2, %min1, !dbg !84  ; [#uses=1 type=i1] [debug line = 71:7]
  br i1 %tmp.26, label %14, label %._crit_edge, !dbg !84 ; [debug line = 71:7]

; <label>:14                                      ; preds = %13
  call void (...)* @_ssdm_SpecKeepArrayLoad(i16 %min.2) nounwind
  call void @llvm.dbg.value(metadata !{i16 %min.2}, i64 0, metadata !81), !dbg !86 ; [debug line = 73:15] [debug variable = min]
  call void @llvm.dbg.value(metadata !{i16 %cluster.4}, i64 0, metadata !88), !dbg !89 ; [debug line = 74:15] [debug variable = cluster]
  br label %._crit_edge, !dbg !90                 ; [debug line = 75:10]

._crit_edge:                                      ; preds = %14, %13
  %cluster.3 = phi i16 [ %cluster.4, %14 ], [ %cluster.2, %13 ] ; [#uses=1 type=i16]
  %min.1 = phi i16 [ %min.2, %14 ], [ %min1, %13 ] ; [#uses=1 type=i16]
  %p.3 = add i16 %cluster.4, 1, !dbg !91          ; [#uses=1 type=i16] [debug line = 69:23]
  call void @llvm.dbg.value(metadata !{i16 %p.3}, i64 0, metadata !80), !dbg !91 ; [debug line = 69:23] [debug variable = p]
  br label %12, !dbg !91                          ; [debug line = 69:23]

; <label>:15                                      ; preds = %12
  %cluster.2.lcssa = phi i16 [ %cluster.2, %12 ]  ; [#uses=5 type=i16]
  %tmp.24 = icmp eq i16 %cluster.2.lcssa, 0, !dbg !92 ; [#uses=1 type=i1] [debug line = 78:4]
  br i1 %tmp.24, label %16, label %._crit_edge41, !dbg !92 ; [debug line = 78:4]

; <label>:16                                      ; preds = %15
  %.sum3 = add i32 %tmp.10, %tmp.3, !dbg !71      ; [#uses=1 type=i32] [debug line = 80:5]
  %.addr.10 = getelementptr inbounds [65536 x i16]* %1, i32 0, i32 %.sum3, !dbg !71 ; [#uses=1 type=i16*] [debug line = 80:5]
  store i16 %r, i16* %.addr.10, align 2, !dbg !71 ; [debug line = 80:5]
  br label %._crit_edge41, !dbg !93               ; [debug line = 83:4]

._crit_edge41:                                    ; preds = %16, %15
  %tmp.28 = icmp eq i16 %cluster.2.lcssa, 1, !dbg !94 ; [#uses=1 type=i1] [debug line = 84:4]
  br i1 %tmp.28, label %17, label %._crit_edge42, !dbg !94 ; [debug line = 84:4]

; <label>:17                                      ; preds = %._crit_edge41
  %.sum4 = add i32 %tmp.10, %tmp.3, !dbg !95      ; [#uses=1 type=i32] [debug line = 86:5]
  %.addr.12 = getelementptr inbounds [65536 x i16]* %2, i32 0, i32 %.sum4, !dbg !95 ; [#uses=1 type=i16*] [debug line = 86:5]
  store i16 %r, i16* %.addr.12, align 2, !dbg !95 ; [debug line = 86:5]
  br label %._crit_edge42, !dbg !97               ; [debug line = 88:4]

._crit_edge42:                                    ; preds = %17, %._crit_edge41
  %tmp.31 = icmp eq i16 %cluster.2.lcssa, 2, !dbg !98 ; [#uses=1 type=i1] [debug line = 89:4]
  br i1 %tmp.31, label %18, label %._crit_edge43, !dbg !98 ; [debug line = 89:4]

; <label>:18                                      ; preds = %._crit_edge42
  %.sum5 = add i32 %tmp.10, %tmp.3, !dbg !99      ; [#uses=1 type=i32] [debug line = 91:5]
  %.addr.14 = getelementptr inbounds [65536 x i16]* %3, i32 0, i32 %.sum5, !dbg !99 ; [#uses=1 type=i16*] [debug line = 91:5]
  store i16 %r, i16* %.addr.14, align 2, !dbg !99 ; [debug line = 91:5]
  br label %._crit_edge43, !dbg !101              ; [debug line = 93:4]

._crit_edge43:                                    ; preds = %18, %._crit_edge42
  %tmp.33 = icmp eq i16 %cluster.2.lcssa, 3, !dbg !102 ; [#uses=1 type=i1] [debug line = 94:4]
  br i1 %tmp.33, label %19, label %._crit_edge44, !dbg !102 ; [debug line = 94:4]

; <label>:19                                      ; preds = %._crit_edge43
  %.sum6 = add i32 %tmp.10, %tmp.3, !dbg !103     ; [#uses=1 type=i32] [debug line = 96:5]
  %.addr.15 = getelementptr inbounds [65536 x i16]* %4, i32 0, i32 %.sum6, !dbg !103 ; [#uses=1 type=i16*] [debug line = 96:5]
  store i16 %r, i16* %.addr.15, align 2, !dbg !103 ; [debug line = 96:5]
  br label %._crit_edge44, !dbg !105              ; [debug line = 98:4]

._crit_edge44:                                    ; preds = %19, %._crit_edge43
  %j.1 = add i16 %j, 1, !dbg !106                 ; [#uses=1 type=i16] [debug line = 59:18]
  call void @llvm.dbg.value(metadata !{i16 %j.1}, i64 0, metadata !107), !dbg !106 ; [debug line = 59:18] [debug variable = j]
  br label %.preheader38, !dbg !106               ; [debug line = 59:18]

; <label>:20                                      ; preds = %.preheader38
  %cluster.1.lcssa = phi i16 [ %cluster.1, %.preheader38 ] ; [#uses=1 type=i16]
  %i.1 = add i16 %i, 1, !dbg !108                 ; [#uses=1 type=i16] [debug line = 57:17]
  call void @llvm.dbg.value(metadata !{i16 %i.1}, i64 0, metadata !109), !dbg !108 ; [debug line = 57:17] [debug variable = i]
  br label %.preheader39, !dbg !108               ; [debug line = 57:17]

; <label>:21                                      ; preds = %27, %.preheader58
  %m = phi i16 [ %m.1, %27 ], [ 0, %.preheader58 ] ; [#uses=3 type=i16]
  %exitcond4 = icmp eq i16 %m, 256, !dbg !68      ; [#uses=1 type=i1] [debug line = 103:5]
  br i1 %exitcond4, label %.preheader36.preheader, label %.preheader37.preheader, !dbg !68 ; [debug line = 103:5]

.preheader36.preheader:                           ; preds = %21
  br label %.preheader36, !dbg !110               ; [debug line = 125:6]

.preheader37.preheader:                           ; preds = %21
  %tmp.7 = sext i16 %m to i32, !dbg !112          ; [#uses=1 type=i32] [debug line = 107:3]
  %tmp.8 = shl nsw i32 %tmp.7, 8, !dbg !112       ; [#uses=1 type=i32] [debug line = 107:3]
  br label %.preheader37, !dbg !116               ; [debug line = 105:6]

.preheader37:                                     ; preds = %22, %.preheader37.preheader
  %n = phi i16 [ %n.1, %22 ], [ 0, %.preheader37.preheader ] ; [#uses=3 type=i16]
  %exitcond7 = icmp eq i16 %n, 256, !dbg !116     ; [#uses=1 type=i1] [debug line = 105:6]
  br i1 %exitcond7, label %27, label %22, !dbg !116 ; [debug line = 105:6]

; <label>:22                                      ; preds = %.preheader37
  %tmp.15 = sext i16 %n to i32, !dbg !112         ; [#uses=1 type=i32] [debug line = 107:3]
  %.sum2 = add i32 %tmp.15, %tmp.8, !dbg !112     ; [#uses=4 type=i32] [debug line = 107:3]
  %.addr.4 = getelementptr inbounds [65536 x i16]* %1, i32 0, i32 %.sum2, !dbg !112 ; [#uses=1 type=i16*] [debug line = 107:3]
  %23 = load i16* %.addr.4, align 2, !dbg !112    ; [#uses=1 type=i16] [debug line = 107:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i16 %23) nounwind
  %.addr.5 = getelementptr inbounds [65536 x i16]* %2, i32 0, i32 %.sum2, !dbg !117 ; [#uses=1 type=i16*] [debug line = 108:3]
  %24 = load i16* %.addr.5, align 2, !dbg !117    ; [#uses=1 type=i16] [debug line = 108:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i16 %24) nounwind
  %.addr.6 = getelementptr inbounds [65536 x i16]* %3, i32 0, i32 %.sum2, !dbg !118 ; [#uses=1 type=i16*] [debug line = 109:3]
  %25 = load i16* %.addr.6, align 2, !dbg !118    ; [#uses=1 type=i16] [debug line = 109:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i16 %25) nounwind
  %.addr.7 = getelementptr inbounds [65536 x i16]* %4, i32 0, i32 %.sum2, !dbg !119 ; [#uses=1 type=i16*] [debug line = 110:3]
  %26 = load i16* %.addr.7, align 2, !dbg !119    ; [#uses=1 type=i16] [debug line = 110:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i16 %26) nounwind
  %n.1 = add i16 %n, 1, !dbg !120                 ; [#uses=1 type=i16] [debug line = 105:17]
  call void @llvm.dbg.value(metadata !{i16 %n.1}, i64 0, metadata !121), !dbg !120 ; [debug line = 105:17] [debug variable = n]
  br label %.preheader37, !dbg !120               ; [debug line = 105:17]

; <label>:27                                      ; preds = %.preheader37
  %m.1 = add i16 %m, 1, !dbg !122                 ; [#uses=1 type=i16] [debug line = 103:16]
  call void @llvm.dbg.value(metadata !{i16 %m.1}, i64 0, metadata !123), !dbg !122 ; [debug line = 103:16] [debug variable = m]
  br label %21, !dbg !122                         ; [debug line = 103:16]

.preheader36:                                     ; preds = %41, %.preheader36.preheader
  %l = phi i16 [ %l.1, %41 ], [ 0, %.preheader36.preheader ] ; [#uses=3 type=i16]
  %exitcond6 = icmp eq i16 %l, 256, !dbg !110     ; [#uses=1 type=i1] [debug line = 125:6]
  br i1 %exitcond6, label %42, label %.preheader.preheader, !dbg !110 ; [debug line = 125:6]

.preheader.preheader:                             ; preds = %.preheader36
  %tmp.12 = sext i16 %l to i32, !dbg !124         ; [#uses=2 type=i32] [debug line = 131:5]
  %tmp.13 = shl nsw i32 %tmp.12, 8, !dbg !124     ; [#uses=1 type=i32] [debug line = 131:5]
  br label %.preheader, !dbg !129                 ; [debug line = 127:7]

.preheader:                                       ; preds = %._crit_edge48, %.preheader.preheader
  %q = phi i16 [ %q.1, %._crit_edge48 ], [ 0, %.preheader.preheader ] ; [#uses=3 type=i16]
  %exitcond = icmp eq i16 %q, 256, !dbg !129      ; [#uses=1 type=i1] [debug line = 127:7]
  br i1 %exitcond, label %41, label %28, !dbg !129 ; [debug line = 127:7]

; <label>:28                                      ; preds = %.preheader
  %tmp.22 = sext i16 %q to i32, !dbg !124         ; [#uses=2 type=i32] [debug line = 131:5]
  %.sum = add i32 %tmp.22, %tmp.13, !dbg !124     ; [#uses=4 type=i32] [debug line = 131:5]
  %.addr.8 = getelementptr inbounds [65536 x i16]* %1, i32 0, i32 %.sum, !dbg !124 ; [#uses=3 type=i16*] [debug line = 131:5]
  %29 = load i16* %.addr.8, align 2, !dbg !124    ; [#uses=2 type=i16] [debug line = 131:5]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i16 %29) nounwind
  %tmp.23 = icmp sgt i16 %29, 0, !dbg !124        ; [#uses=1 type=i1] [debug line = 131:5]
  br i1 %tmp.23, label %30, label %._crit_edge45, !dbg !124 ; [debug line = 131:5]

; <label>:30                                      ; preds = %28
  store i16 50, i16* %.addr.8, align 2, !dbg !130 ; [debug line = 133:5]
  br label %._crit_edge45, !dbg !132              ; [debug line = 134:5]

._crit_edge45:                                    ; preds = %30, %28
  %.addr.9 = getelementptr inbounds [65536 x i16]* %2, i32 0, i32 %.sum, !dbg !133 ; [#uses=3 type=i16*] [debug line = 135:5]
  %31 = load i16* %.addr.9, align 2, !dbg !133    ; [#uses=2 type=i16] [debug line = 135:5]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i16 %31) nounwind
  %tmp.27 = icmp sgt i16 %31, 0, !dbg !133        ; [#uses=1 type=i1] [debug line = 135:5]
  br i1 %tmp.27, label %32, label %._crit_edge46, !dbg !133 ; [debug line = 135:5]

; <label>:32                                      ; preds = %._crit_edge45
  store i16 70, i16* %.addr.9, align 2, !dbg !134 ; [debug line = 137:5]
  br label %._crit_edge46, !dbg !136              ; [debug line = 138:5]

._crit_edge46:                                    ; preds = %32, %._crit_edge45
  %.addr.11 = getelementptr inbounds [65536 x i16]* %3, i32 0, i32 %.sum, !dbg !137 ; [#uses=3 type=i16*] [debug line = 139:5]
  %33 = load i16* %.addr.11, align 2, !dbg !137   ; [#uses=2 type=i16] [debug line = 139:5]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i16 %33) nounwind
  %tmp.30 = icmp sgt i16 %33, 0, !dbg !137        ; [#uses=1 type=i1] [debug line = 139:5]
  br i1 %tmp.30, label %34, label %._crit_edge47, !dbg !137 ; [debug line = 139:5]

; <label>:34                                      ; preds = %._crit_edge46
  store i16 40, i16* %.addr.11, align 2, !dbg !138 ; [debug line = 141:5]
  br label %._crit_edge47, !dbg !140              ; [debug line = 142:5]

._crit_edge47:                                    ; preds = %34, %._crit_edge46
  %.addr.13 = getelementptr inbounds [65536 x i16]* %4, i32 0, i32 %.sum, !dbg !141 ; [#uses=3 type=i16*] [debug line = 143:5]
  %35 = load i16* %.addr.13, align 2, !dbg !141   ; [#uses=2 type=i16] [debug line = 143:5]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i16 %35) nounwind
  %tmp.32 = icmp sgt i16 %35, 0, !dbg !141        ; [#uses=1 type=i1] [debug line = 143:5]
  br i1 %tmp.32, label %36, label %._crit_edge48, !dbg !141 ; [debug line = 143:5]

; <label>:36                                      ; preds = %._crit_edge47
  store i16 220, i16* %.addr.13, align 2, !dbg !142 ; [debug line = 145:5]
  br label %._crit_edge48, !dbg !144              ; [debug line = 146:5]

._crit_edge48:                                    ; preds = %36, %._crit_edge47
  %37 = load i16* %.addr.8, align 2, !dbg !145    ; [#uses=2 type=i16] [debug line = 148:5]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i16 %37) nounwind
  %38 = load i16* %.addr.9, align 2, !dbg !145    ; [#uses=2 type=i16] [debug line = 148:5]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i16 %38) nounwind
  %39 = load i16* %.addr.11, align 2, !dbg !145   ; [#uses=2 type=i16] [debug line = 148:5]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i16 %39) nounwind
  %40 = load i16* %.addr.13, align 2, !dbg !145   ; [#uses=2 type=i16] [debug line = 148:5]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i16 %40) nounwind
  %tmp.34 = add i16 %38, %37, !dbg !145           ; [#uses=1 type=i16] [debug line = 148:5]
  %tmp.35 = add i16 %tmp.34, %39, !dbg !145       ; [#uses=1 type=i16] [debug line = 148:5]
  %tmp.36 = add i16 %tmp.35, %40, !dbg !145       ; [#uses=1 type=i16] [debug line = 148:5]
  %final.addr = getelementptr inbounds [256 x i16]* %final, i32 %tmp.12, i32 %tmp.22, !dbg !145 ; [#uses=1 type=i16*] [debug line = 148:5]
  store i16 %tmp.36, i16* %final.addr, align 2, !dbg !145 ; [debug line = 148:5]
  %q.1 = add i16 %q, 1, !dbg !146                 ; [#uses=1 type=i16] [debug line = 127:18]
  call void @llvm.dbg.value(metadata !{i16 %q.1}, i64 0, metadata !147), !dbg !146 ; [debug line = 127:18] [debug variable = q]
  br label %.preheader, !dbg !146                 ; [debug line = 127:18]

; <label>:41                                      ; preds = %.preheader
  %l.1 = add i16 %l, 1, !dbg !148                 ; [#uses=1 type=i16] [debug line = 125:17]
  call void @llvm.dbg.value(metadata !{i16 %l.1}, i64 0, metadata !149), !dbg !148 ; [debug line = 125:17] [debug variable = l]
  br label %.preheader36, !dbg !148               ; [debug line = 125:17]

; <label>:42                                      ; preds = %.preheader36
  ret void, !dbg !150                             ; [debug line = 169:1]
}

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=17]
declare void @_ssdm_SpecKeepArrayLoad(...)

; [#uses=2]
declare void @_ssdm_SpecArrayDimSize(...) nounwind

!llvm.dbg.cu = !{!0}
!opencl.kernels = !{!21}
!hls.encrypted.func = !{}

!0 = metadata !{i32 786449, i32 0, i32 1, metadata !"W:/Desktop/kmeans/kmeans/solution1/.autopilot/db/kmeans.pragma.2.c", metadata !"W:\5CDesktop\5Ckmeans", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !16} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"kmeans", metadata !"kmeans", metadata !"", metadata !6, i32 5, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([256 x i16]*, [256 x i16]*)* @kmeans, null, null, metadata !14, i32 6} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"kmeans.c", metadata !"W:\5CDesktop\5Ckmeans", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{null, metadata !9, metadata !9}
!9 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 4096, i64 16, i32 0, i32 0, metadata !11, metadata !12, i32 0, i32 0} ; [ DW_TAG_array_type ]
!11 = metadata !{i32 786468, null, metadata !"short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!12 = metadata !{metadata !13}
!13 = metadata !{i32 786465, i64 0, i64 255}      ; [ DW_TAG_subrange_type ]
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!16 = metadata !{metadata !17}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 786484, i32 0, null, metadata !"_sys_nerr", metadata !"_sys_nerr", metadata !"", metadata !19, i32 157, metadata !20, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!19 = metadata !{i32 786473, metadata !"C:/Xilinx/Vivado_HLS/2016.3/win64/tools/clang/bin/../lib/clang/3.1/../../../x86_64-w64-mingw32/include\5Cstdlib.h", metadata !"W:\5CDesktop\5Ckmeans", null} ; [ DW_TAG_file_type ]
!20 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!21 = metadata !{void ([256 x i16]*, [256 x i16]*)* @kmeans, metadata !22, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27}
!22 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1}
!23 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!24 = metadata !{metadata !"kernel_arg_type", metadata !"short [256]*", metadata !"short [256]*"}
!25 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!26 = metadata !{metadata !"kernel_arg_name", metadata !"image_in", metadata !"final"}
!27 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!28 = metadata !{i32 786689, metadata !5, metadata !"image_in", metadata !6, i32 16777221, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!29 = metadata !{i32 5, i32 19, metadata !5, null}
!30 = metadata !{i32 786689, metadata !5, metadata !"final", metadata !6, i32 33554437, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!31 = metadata !{i32 5, i32 44, metadata !5, null}
!32 = metadata !{i32 6, i32 2, metadata !33, null}
!33 = metadata !{i32 786443, metadata !5, i32 6, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!34 = metadata !{i32 6, i32 36, metadata !33, null}
!35 = metadata !{i32 786688, metadata !33, metadata !"k", metadata !6, i32 10, metadata !36, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!36 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 128, i64 32, i32 0, i32 0, metadata !20, metadata !37, i32 0, i32 0} ; [ DW_TAG_array_type ]
!37 = metadata !{metadata !38}
!38 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ]
!39 = metadata !{i32 10, i32 6, metadata !33, null}
!40 = metadata !{i32 10, i32 24, metadata !33, null}
!41 = metadata !{i32 786688, metadata !33, metadata !"ab", metadata !6, i32 12, metadata !42, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!42 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 64, i64 16, i32 0, i32 0, metadata !11, metadata !37, i32 0, i32 0} ; [ DW_TAG_array_type ]
!43 = metadata !{i32 12, i32 8, metadata !33, null}
!44 = metadata !{i32 17, i32 28, metadata !33, null}
!45 = metadata !{i32 18, i32 28, metadata !33, null}
!46 = metadata !{i32 19, i32 28, metadata !33, null}
!47 = metadata !{i32 20, i32 28, metadata !33, null}
!48 = metadata !{i32 39, i32 6, metadata !49, null}
!49 = metadata !{i32 786443, metadata !33, i32 39, i32 2, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!50 = metadata !{i32 43, i32 4, metadata !51, null}
!51 = metadata !{i32 786443, metadata !52, i32 42, i32 3, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!52 = metadata !{i32 786443, metadata !53, i32 41, i32 3, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!53 = metadata !{i32 786443, metadata !49, i32 40, i32 2, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!54 = metadata !{i32 41, i32 7, metadata !52, null}
!55 = metadata !{i32 67, i32 4, metadata !56, null}
!56 = metadata !{i32 786443, metadata !57, i32 60, i32 3, metadata !6, i32 8} ; [ DW_TAG_lexical_block ]
!57 = metadata !{i32 786443, metadata !58, i32 59, i32 3, metadata !6, i32 7} ; [ DW_TAG_lexical_block ]
!58 = metadata !{i32 786443, metadata !59, i32 58, i32 2, metadata !6, i32 6} ; [ DW_TAG_lexical_block ]
!59 = metadata !{i32 786443, metadata !33, i32 57, i32 2, metadata !6, i32 5} ; [ DW_TAG_lexical_block ]
!60 = metadata !{i32 57, i32 6, metadata !59, null}
!61 = metadata !{i32 44, i32 4, metadata !51, null}
!62 = metadata !{i32 45, i32 4, metadata !51, null}
!63 = metadata !{i32 46, i32 4, metadata !51, null}
!64 = metadata !{i32 41, i32 17, metadata !52, null}
!65 = metadata !{i32 786688, metadata !33, metadata !"t", metadata !6, i32 9, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!66 = metadata !{i32 39, i32 16, metadata !49, null}
!67 = metadata !{i32 786688, metadata !33, metadata !"s", metadata !6, i32 9, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!68 = metadata !{i32 103, i32 5, metadata !69, null}
!69 = metadata !{i32 786443, metadata !33, i32 103, i32 1, metadata !6, i32 18} ; [ DW_TAG_lexical_block ]
!70 = metadata !{i32 61, i32 4, metadata !56, null}
!71 = metadata !{i32 80, i32 5, metadata !72, null}
!72 = metadata !{i32 786443, metadata !56, i32 79, i32 4, metadata !6, i32 14} ; [ DW_TAG_lexical_block ]
!73 = metadata !{i32 59, i32 7, metadata !57, null}
!74 = metadata !{i32 786688, metadata !33, metadata !"r", metadata !6, i32 13, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!75 = metadata !{i32 65, i32 10, metadata !76, null}
!76 = metadata !{i32 786443, metadata !77, i32 64, i32 4, metadata !6, i32 10} ; [ DW_TAG_lexical_block ]
!77 = metadata !{i32 786443, metadata !56, i32 63, i32 4, metadata !6, i32 9} ; [ DW_TAG_lexical_block ]
!78 = metadata !{i32 63, i32 8, metadata !77, null}
!79 = metadata !{i32 63, i32 16, metadata !77, null}
!80 = metadata !{i32 786688, metadata !33, metadata !"p", metadata !6, i32 9, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!81 = metadata !{i32 786688, metadata !33, metadata !"min", metadata !6, i32 15, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!82 = metadata !{i32 69, i32 9, metadata !83, null}
!83 = metadata !{i32 786443, metadata !56, i32 69, i32 4, metadata !6, i32 11} ; [ DW_TAG_lexical_block ]
!84 = metadata !{i32 71, i32 7, metadata !85, null}
!85 = metadata !{i32 786443, metadata !83, i32 70, i32 4, metadata !6, i32 12} ; [ DW_TAG_lexical_block ]
!86 = metadata !{i32 73, i32 15, metadata !87, null}
!87 = metadata !{i32 786443, metadata !85, i32 72, i32 10, metadata !6, i32 13} ; [ DW_TAG_lexical_block ]
!88 = metadata !{i32 786688, metadata !33, metadata !"cluster", metadata !6, i32 16, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!89 = metadata !{i32 74, i32 15, metadata !87, null}
!90 = metadata !{i32 75, i32 10, metadata !87, null}
!91 = metadata !{i32 69, i32 23, metadata !83, null}
!92 = metadata !{i32 78, i32 4, metadata !56, null}
!93 = metadata !{i32 83, i32 4, metadata !72, null}
!94 = metadata !{i32 84, i32 4, metadata !56, null}
!95 = metadata !{i32 86, i32 5, metadata !96, null}
!96 = metadata !{i32 786443, metadata !56, i32 85, i32 4, metadata !6, i32 15} ; [ DW_TAG_lexical_block ]
!97 = metadata !{i32 88, i32 4, metadata !96, null}
!98 = metadata !{i32 89, i32 4, metadata !56, null}
!99 = metadata !{i32 91, i32 5, metadata !100, null}
!100 = metadata !{i32 786443, metadata !56, i32 90, i32 4, metadata !6, i32 16} ; [ DW_TAG_lexical_block ]
!101 = metadata !{i32 93, i32 4, metadata !100, null}
!102 = metadata !{i32 94, i32 4, metadata !56, null}
!103 = metadata !{i32 96, i32 5, metadata !104, null}
!104 = metadata !{i32 786443, metadata !56, i32 95, i32 4, metadata !6, i32 17} ; [ DW_TAG_lexical_block ]
!105 = metadata !{i32 98, i32 4, metadata !104, null}
!106 = metadata !{i32 59, i32 18, metadata !57, null}
!107 = metadata !{i32 786688, metadata !33, metadata !"j", metadata !6, i32 9, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!108 = metadata !{i32 57, i32 17, metadata !59, null}
!109 = metadata !{i32 786688, metadata !33, metadata !"i", metadata !6, i32 9, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!110 = metadata !{i32 125, i32 6, metadata !111, null}
!111 = metadata !{i32 786443, metadata !33, i32 125, i32 2, metadata !6, i32 22} ; [ DW_TAG_lexical_block ]
!112 = metadata !{i32 107, i32 3, metadata !113, null}
!113 = metadata !{i32 786443, metadata !114, i32 106, i32 2, metadata !6, i32 21} ; [ DW_TAG_lexical_block ]
!114 = metadata !{i32 786443, metadata !115, i32 105, i32 2, metadata !6, i32 20} ; [ DW_TAG_lexical_block ]
!115 = metadata !{i32 786443, metadata !69, i32 104, i32 1, metadata !6, i32 19} ; [ DW_TAG_lexical_block ]
!116 = metadata !{i32 105, i32 6, metadata !114, null}
!117 = metadata !{i32 108, i32 3, metadata !113, null}
!118 = metadata !{i32 109, i32 3, metadata !113, null}
!119 = metadata !{i32 110, i32 3, metadata !113, null}
!120 = metadata !{i32 105, i32 17, metadata !114, null}
!121 = metadata !{i32 786688, metadata !33, metadata !"n", metadata !6, i32 9, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!122 = metadata !{i32 103, i32 16, metadata !69, null}
!123 = metadata !{i32 786688, metadata !33, metadata !"m", metadata !6, i32 9, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!124 = metadata !{i32 131, i32 5, metadata !125, null}
!125 = metadata !{i32 786443, metadata !126, i32 130, i32 5, metadata !6, i32 26} ; [ DW_TAG_lexical_block ]
!126 = metadata !{i32 786443, metadata !127, i32 128, i32 3, metadata !6, i32 25} ; [ DW_TAG_lexical_block ]
!127 = metadata !{i32 786443, metadata !128, i32 127, i32 3, metadata !6, i32 24} ; [ DW_TAG_lexical_block ]
!128 = metadata !{i32 786443, metadata !111, i32 126, i32 2, metadata !6, i32 23} ; [ DW_TAG_lexical_block ]
!129 = metadata !{i32 127, i32 7, metadata !127, null}
!130 = metadata !{i32 133, i32 5, metadata !131, null}
!131 = metadata !{i32 786443, metadata !125, i32 132, i32 5, metadata !6, i32 27} ; [ DW_TAG_lexical_block ]
!132 = metadata !{i32 134, i32 5, metadata !131, null}
!133 = metadata !{i32 135, i32 5, metadata !125, null}
!134 = metadata !{i32 137, i32 5, metadata !135, null}
!135 = metadata !{i32 786443, metadata !125, i32 136, i32 5, metadata !6, i32 28} ; [ DW_TAG_lexical_block ]
!136 = metadata !{i32 138, i32 5, metadata !135, null}
!137 = metadata !{i32 139, i32 5, metadata !125, null}
!138 = metadata !{i32 141, i32 5, metadata !139, null}
!139 = metadata !{i32 786443, metadata !125, i32 140, i32 5, metadata !6, i32 29} ; [ DW_TAG_lexical_block ]
!140 = metadata !{i32 142, i32 5, metadata !139, null}
!141 = metadata !{i32 143, i32 5, metadata !125, null}
!142 = metadata !{i32 145, i32 5, metadata !143, null}
!143 = metadata !{i32 786443, metadata !125, i32 144, i32 5, metadata !6, i32 30} ; [ DW_TAG_lexical_block ]
!144 = metadata !{i32 146, i32 5, metadata !143, null}
!145 = metadata !{i32 148, i32 5, metadata !125, null}
!146 = metadata !{i32 127, i32 18, metadata !127, null}
!147 = metadata !{i32 786688, metadata !33, metadata !"q", metadata !6, i32 9, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!148 = metadata !{i32 125, i32 17, metadata !111, null}
!149 = metadata !{i32 786688, metadata !33, metadata !"l", metadata !6, i32 9, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!150 = metadata !{i32 169, i32 1, metadata !33, null}
