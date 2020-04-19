; ModuleID = 'W:/Desktop/sobel1/sobel/solution1/.autopilot/db/a.g.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@_sys_nerr = dllimport global i32                 ; [#uses=0 type=i32*]

; [#uses=0]
define void @sobel([256 x i32]* %input_image, [256 x i32]* %output_image) nounwind {
  %1 = alloca [256 x i32]*, align 4               ; [#uses=20 type=[256 x i32]**]
  %2 = alloca [256 x i32]*, align 4               ; [#uses=7 type=[256 x i32]**]
  %k = alloca i32, align 4                        ; [#uses=6 type=i32*]
  %l = alloca i32, align 4                        ; [#uses=6 type=i32*]
  %c = alloca i32, align 4                        ; [#uses=8 type=i32*]
  %d = alloca i32, align 4                        ; [#uses=8 type=i32*]
  %image = alloca [256 x [256 x i32]], align 4    ; [#uses=8 type=[256 x [256 x i32]]*]
  %i = alloca i32, align 4                        ; [#uses=31 type=i32*]
  %j = alloca i32, align 4                        ; [#uses=31 type=i32*]
  %max = alloca i32, align 4                      ; [#uses=4 type=i32*]
  %min = alloca i32, align 4                      ; [#uses=4 type=i32*]
  %x_dir = alloca i32, align 4                    ; [#uses=3 type=i32*]
  %y_dir = alloca i32, align 4                    ; [#uses=3 type=i32*]
  %edge_weight = alloca i32, align 4              ; [#uses=2 type=i32*]
  store [256 x i32]* %input_image, [256 x i32]** %1, align 4
  call void @llvm.dbg.declare(metadata !{[256 x i32]** %1}, metadata !27), !dbg !28 ; [debug line = 5:16] [debug variable = input_image]
  store [256 x i32]* %output_image, [256 x i32]** %2, align 4
  call void @llvm.dbg.declare(metadata !{[256 x i32]** %2}, metadata !29), !dbg !30 ; [debug line = 5:42] [debug variable = output_image]
  %3 = load [256 x i32]** %1, align 4, !dbg !31   ; [#uses=1 type=[256 x i32]*] [debug line = 6:2]
  call void bitcast (void (...)* @_ssdm_SpecArrayDimSize to void ([256 x i32]*, i32)*)([256 x i32]* %3, i32 256) nounwind, !dbg !31 ; [debug line = 6:2]
  %4 = load [256 x i32]** %2, align 4, !dbg !33   ; [#uses=1 type=[256 x i32]*] [debug line = 6:42]
  call void bitcast (void (...)* @_ssdm_SpecArrayDimSize to void ([256 x i32]*, i32)*)([256 x i32]* %4, i32 256) nounwind, !dbg !33 ; [debug line = 6:42]
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !34), !dbg !35 ; [debug line = 8:6] [debug variable = k]
  call void @llvm.dbg.declare(metadata !{i32* %l}, metadata !36), !dbg !37 ; [debug line = 8:8] [debug variable = l]
  call void @llvm.dbg.declare(metadata !{i32* %c}, metadata !38), !dbg !39 ; [debug line = 8:10] [debug variable = c]
  call void @llvm.dbg.declare(metadata !{i32* %d}, metadata !40), !dbg !41 ; [debug line = 8:12] [debug variable = d]
  call void @llvm.dbg.declare(metadata !{[256 x [256 x i32]]* %image}, metadata !42), !dbg !45 ; [debug line = 9:6] [debug variable = image]
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !46), !dbg !47 ; [debug line = 10:6] [debug variable = i]
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !48), !dbg !49 ; [debug line = 11:6] [debug variable = j]
  call void @llvm.dbg.declare(metadata !{i32* %max}, metadata !50), !dbg !51 ; [debug line = 12:6] [debug variable = max]
  call void @llvm.dbg.declare(metadata !{i32* %min}, metadata !52), !dbg !53 ; [debug line = 12:10] [debug variable = min]
  call void @llvm.dbg.declare(metadata !{i32* %x_dir}, metadata !54), !dbg !55 ; [debug line = 16:6] [debug variable = x_dir]
  call void @llvm.dbg.declare(metadata !{i32* %y_dir}, metadata !56), !dbg !57 ; [debug line = 16:12] [debug variable = y_dir]
  call void @llvm.dbg.declare(metadata !{i32* %edge_weight}, metadata !58), !dbg !59 ; [debug line = 16:18] [debug variable = edge_weight]
  store i32 0, i32* %x_dir, align 4, !dbg !60     ; [debug line = 17:2]
  store i32 0, i32* %y_dir, align 4, !dbg !61     ; [debug line = 18:2]
  store i32 0, i32* %i, align 4, !dbg !62         ; [debug line = 20:5]
  br label %5, !dbg !62                           ; [debug line = 20:5]

; <label>:5                                       ; preds = %239, %0
  %6 = load i32* %i, align 4, !dbg !62            ; [#uses=1 type=i32] [debug line = 20:5]
  %7 = icmp slt i32 %6, 256, !dbg !62             ; [#uses=1 type=i1] [debug line = 20:5]
  br i1 %7, label %8, label %242, !dbg !62        ; [debug line = 20:5]

; <label>:8                                       ; preds = %5
  store i32 0, i32* %j, align 4, !dbg !64         ; [debug line = 22:6]
  br label %9, !dbg !64                           ; [debug line = 22:6]

; <label>:9                                       ; preds = %235, %8
  %10 = load i32* %j, align 4, !dbg !64           ; [#uses=1 type=i32] [debug line = 22:6]
  %11 = icmp slt i32 %10, 256, !dbg !64           ; [#uses=1 type=i1] [debug line = 22:6]
  br i1 %11, label %12, label %238, !dbg !64      ; [debug line = 22:6]

; <label>:12                                      ; preds = %9
  %13 = load i32* %i, align 4, !dbg !67           ; [#uses=1 type=i32] [debug line = 24:3]
  %14 = icmp sgt i32 %13, 0, !dbg !67             ; [#uses=1 type=i1] [debug line = 24:3]
  br i1 %14, label %15, label %198, !dbg !67      ; [debug line = 24:3]

; <label>:15                                      ; preds = %12
  %16 = load i32* %i, align 4, !dbg !67           ; [#uses=1 type=i32] [debug line = 24:3]
  %17 = icmp slt i32 %16, 255, !dbg !67           ; [#uses=1 type=i1] [debug line = 24:3]
  br i1 %17, label %18, label %198, !dbg !67      ; [debug line = 24:3]

; <label>:18                                      ; preds = %15
  %19 = load i32* %j, align 4, !dbg !67           ; [#uses=1 type=i32] [debug line = 24:3]
  %20 = icmp sgt i32 %19, 0, !dbg !67             ; [#uses=1 type=i1] [debug line = 24:3]
  br i1 %20, label %21, label %198, !dbg !67      ; [debug line = 24:3]

; <label>:21                                      ; preds = %18
  %22 = load i32* %j, align 4, !dbg !67           ; [#uses=1 type=i32] [debug line = 24:3]
  %23 = icmp slt i32 %22, 255, !dbg !67           ; [#uses=1 type=i1] [debug line = 24:3]
  br i1 %23, label %24, label %198, !dbg !67      ; [debug line = 24:3]

; <label>:24                                      ; preds = %21
  %25 = load i32* %j, align 4, !dbg !69           ; [#uses=1 type=i32] [debug line = 26:4]
  %26 = sub nsw i32 %25, 1, !dbg !69              ; [#uses=1 type=i32] [debug line = 26:4]
  %27 = load i32* %i, align 4, !dbg !69           ; [#uses=1 type=i32] [debug line = 26:4]
  %28 = sub nsw i32 %27, 1, !dbg !69              ; [#uses=1 type=i32] [debug line = 26:4]
  %29 = load [256 x i32]** %1, align 4, !dbg !69  ; [#uses=1 type=[256 x i32]*] [debug line = 26:4]
  %30 = getelementptr inbounds [256 x i32]* %29, i32 %28, !dbg !69 ; [#uses=1 type=[256 x i32]*] [debug line = 26:4]
  %31 = getelementptr inbounds [256 x i32]* %30, i32 0, i32 %26, !dbg !69 ; [#uses=1 type=i32*] [debug line = 26:4]
  %32 = load i32* %31, align 4, !dbg !69          ; [#uses=1 type=i32] [debug line = 26:4]
  %33 = mul nsw i32 -1, %32, !dbg !69             ; [#uses=1 type=i32] [debug line = 26:4]
  %34 = load i32* %j, align 4, !dbg !69           ; [#uses=1 type=i32] [debug line = 26:4]
  %35 = load i32* %i, align 4, !dbg !69           ; [#uses=1 type=i32] [debug line = 26:4]
  %36 = sub nsw i32 %35, 1, !dbg !69              ; [#uses=1 type=i32] [debug line = 26:4]
  %37 = load [256 x i32]** %1, align 4, !dbg !69  ; [#uses=1 type=[256 x i32]*] [debug line = 26:4]
  %38 = getelementptr inbounds [256 x i32]* %37, i32 %36, !dbg !69 ; [#uses=1 type=[256 x i32]*] [debug line = 26:4]
  %39 = getelementptr inbounds [256 x i32]* %38, i32 0, i32 %34, !dbg !69 ; [#uses=1 type=i32*] [debug line = 26:4]
  %40 = load i32* %39, align 4, !dbg !69          ; [#uses=1 type=i32] [debug line = 26:4]
  %41 = mul nsw i32 0, %40, !dbg !69              ; [#uses=1 type=i32] [debug line = 26:4]
  %42 = add nsw i32 %33, %41, !dbg !69            ; [#uses=1 type=i32] [debug line = 26:4]
  %43 = load i32* %j, align 4, !dbg !69           ; [#uses=1 type=i32] [debug line = 26:4]
  %44 = add nsw i32 %43, 1, !dbg !69              ; [#uses=1 type=i32] [debug line = 26:4]
  %45 = load i32* %i, align 4, !dbg !69           ; [#uses=1 type=i32] [debug line = 26:4]
  %46 = sub nsw i32 %45, 1, !dbg !69              ; [#uses=1 type=i32] [debug line = 26:4]
  %47 = load [256 x i32]** %1, align 4, !dbg !69  ; [#uses=1 type=[256 x i32]*] [debug line = 26:4]
  %48 = getelementptr inbounds [256 x i32]* %47, i32 %46, !dbg !69 ; [#uses=1 type=[256 x i32]*] [debug line = 26:4]
  %49 = getelementptr inbounds [256 x i32]* %48, i32 0, i32 %44, !dbg !69 ; [#uses=1 type=i32*] [debug line = 26:4]
  %50 = load i32* %49, align 4, !dbg !69          ; [#uses=1 type=i32] [debug line = 26:4]
  %51 = add nsw i32 %42, %50, !dbg !69            ; [#uses=1 type=i32] [debug line = 26:4]
  %52 = load i32* %j, align 4, !dbg !69           ; [#uses=1 type=i32] [debug line = 26:4]
  %53 = sub nsw i32 %52, 1, !dbg !69              ; [#uses=1 type=i32] [debug line = 26:4]
  %54 = load i32* %i, align 4, !dbg !69           ; [#uses=1 type=i32] [debug line = 26:4]
  %55 = load [256 x i32]** %1, align 4, !dbg !69  ; [#uses=1 type=[256 x i32]*] [debug line = 26:4]
  %56 = getelementptr inbounds [256 x i32]* %55, i32 %54, !dbg !69 ; [#uses=1 type=[256 x i32]*] [debug line = 26:4]
  %57 = getelementptr inbounds [256 x i32]* %56, i32 0, i32 %53, !dbg !69 ; [#uses=1 type=i32*] [debug line = 26:4]
  %58 = load i32* %57, align 4, !dbg !69          ; [#uses=1 type=i32] [debug line = 26:4]
  %59 = mul nsw i32 2, %58, !dbg !69              ; [#uses=1 type=i32] [debug line = 26:4]
  %60 = sub nsw i32 %51, %59, !dbg !69            ; [#uses=1 type=i32] [debug line = 26:4]
  %61 = load i32* %j, align 4, !dbg !69           ; [#uses=1 type=i32] [debug line = 26:4]
  %62 = load i32* %i, align 4, !dbg !69           ; [#uses=1 type=i32] [debug line = 26:4]
  %63 = load [256 x i32]** %1, align 4, !dbg !69  ; [#uses=1 type=[256 x i32]*] [debug line = 26:4]
  %64 = getelementptr inbounds [256 x i32]* %63, i32 %62, !dbg !69 ; [#uses=1 type=[256 x i32]*] [debug line = 26:4]
  %65 = getelementptr inbounds [256 x i32]* %64, i32 0, i32 %61, !dbg !69 ; [#uses=1 type=i32*] [debug line = 26:4]
  %66 = load i32* %65, align 4, !dbg !69          ; [#uses=1 type=i32] [debug line = 26:4]
  %67 = mul nsw i32 0, %66, !dbg !69              ; [#uses=1 type=i32] [debug line = 26:4]
  %68 = add nsw i32 %60, %67, !dbg !69            ; [#uses=1 type=i32] [debug line = 26:4]
  %69 = load i32* %j, align 4, !dbg !69           ; [#uses=1 type=i32] [debug line = 26:4]
  %70 = add nsw i32 %69, 1, !dbg !69              ; [#uses=1 type=i32] [debug line = 26:4]
  %71 = load i32* %i, align 4, !dbg !69           ; [#uses=1 type=i32] [debug line = 26:4]
  %72 = load [256 x i32]** %1, align 4, !dbg !69  ; [#uses=1 type=[256 x i32]*] [debug line = 26:4]
  %73 = getelementptr inbounds [256 x i32]* %72, i32 %71, !dbg !69 ; [#uses=1 type=[256 x i32]*] [debug line = 26:4]
  %74 = getelementptr inbounds [256 x i32]* %73, i32 0, i32 %70, !dbg !69 ; [#uses=1 type=i32*] [debug line = 26:4]
  %75 = load i32* %74, align 4, !dbg !69          ; [#uses=1 type=i32] [debug line = 26:4]
  %76 = mul nsw i32 2, %75, !dbg !69              ; [#uses=1 type=i32] [debug line = 26:4]
  %77 = add nsw i32 %68, %76, !dbg !69            ; [#uses=1 type=i32] [debug line = 26:4]
  %78 = load i32* %j, align 4, !dbg !69           ; [#uses=1 type=i32] [debug line = 26:4]
  %79 = sub nsw i32 %78, 1, !dbg !69              ; [#uses=1 type=i32] [debug line = 26:4]
  %80 = load i32* %i, align 4, !dbg !69           ; [#uses=1 type=i32] [debug line = 26:4]
  %81 = add nsw i32 %80, 1, !dbg !69              ; [#uses=1 type=i32] [debug line = 26:4]
  %82 = load [256 x i32]** %1, align 4, !dbg !69  ; [#uses=1 type=[256 x i32]*] [debug line = 26:4]
  %83 = getelementptr inbounds [256 x i32]* %82, i32 %81, !dbg !69 ; [#uses=1 type=[256 x i32]*] [debug line = 26:4]
  %84 = getelementptr inbounds [256 x i32]* %83, i32 0, i32 %79, !dbg !69 ; [#uses=1 type=i32*] [debug line = 26:4]
  %85 = load i32* %84, align 4, !dbg !69          ; [#uses=1 type=i32] [debug line = 26:4]
  %86 = mul nsw i32 1, %85, !dbg !69              ; [#uses=1 type=i32] [debug line = 26:4]
  %87 = sub nsw i32 %77, %86, !dbg !69            ; [#uses=1 type=i32] [debug line = 26:4]
  %88 = load i32* %j, align 4, !dbg !69           ; [#uses=1 type=i32] [debug line = 26:4]
  %89 = load i32* %i, align 4, !dbg !69           ; [#uses=1 type=i32] [debug line = 26:4]
  %90 = add nsw i32 %89, 1, !dbg !69              ; [#uses=1 type=i32] [debug line = 26:4]
  %91 = load [256 x i32]** %1, align 4, !dbg !69  ; [#uses=1 type=[256 x i32]*] [debug line = 26:4]
  %92 = getelementptr inbounds [256 x i32]* %91, i32 %90, !dbg !69 ; [#uses=1 type=[256 x i32]*] [debug line = 26:4]
  %93 = getelementptr inbounds [256 x i32]* %92, i32 0, i32 %88, !dbg !69 ; [#uses=1 type=i32*] [debug line = 26:4]
  %94 = load i32* %93, align 4, !dbg !69          ; [#uses=1 type=i32] [debug line = 26:4]
  %95 = mul nsw i32 0, %94, !dbg !69              ; [#uses=1 type=i32] [debug line = 26:4]
  %96 = add nsw i32 %87, %95, !dbg !69            ; [#uses=1 type=i32] [debug line = 26:4]
  %97 = load i32* %j, align 4, !dbg !69           ; [#uses=1 type=i32] [debug line = 26:4]
  %98 = add nsw i32 %97, 1, !dbg !69              ; [#uses=1 type=i32] [debug line = 26:4]
  %99 = load i32* %i, align 4, !dbg !69           ; [#uses=1 type=i32] [debug line = 26:4]
  %100 = add nsw i32 %99, 1, !dbg !69             ; [#uses=1 type=i32] [debug line = 26:4]
  %101 = load [256 x i32]** %1, align 4, !dbg !69 ; [#uses=1 type=[256 x i32]*] [debug line = 26:4]
  %102 = getelementptr inbounds [256 x i32]* %101, i32 %100, !dbg !69 ; [#uses=1 type=[256 x i32]*] [debug line = 26:4]
  %103 = getelementptr inbounds [256 x i32]* %102, i32 0, i32 %98, !dbg !69 ; [#uses=1 type=i32*] [debug line = 26:4]
  %104 = load i32* %103, align 4, !dbg !69        ; [#uses=1 type=i32] [debug line = 26:4]
  %105 = add nsw i32 %96, %104, !dbg !69          ; [#uses=1 type=i32] [debug line = 26:4]
  store i32 %105, i32* %x_dir, align 4, !dbg !69  ; [debug line = 26:4]
  %106 = load i32* %j, align 4, !dbg !71          ; [#uses=1 type=i32] [debug line = 27:4]
  %107 = sub nsw i32 %106, 1, !dbg !71            ; [#uses=1 type=i32] [debug line = 27:4]
  %108 = load i32* %i, align 4, !dbg !71          ; [#uses=1 type=i32] [debug line = 27:4]
  %109 = sub nsw i32 %108, 1, !dbg !71            ; [#uses=1 type=i32] [debug line = 27:4]
  %110 = load [256 x i32]** %1, align 4, !dbg !71 ; [#uses=1 type=[256 x i32]*] [debug line = 27:4]
  %111 = getelementptr inbounds [256 x i32]* %110, i32 %109, !dbg !71 ; [#uses=1 type=[256 x i32]*] [debug line = 27:4]
  %112 = getelementptr inbounds [256 x i32]* %111, i32 0, i32 %107, !dbg !71 ; [#uses=1 type=i32*] [debug line = 27:4]
  %113 = load i32* %112, align 4, !dbg !71        ; [#uses=1 type=i32] [debug line = 27:4]
  %114 = mul nsw i32 1, %113, !dbg !71            ; [#uses=1 type=i32] [debug line = 27:4]
  %115 = load i32* %j, align 4, !dbg !71          ; [#uses=1 type=i32] [debug line = 27:4]
  %116 = load i32* %i, align 4, !dbg !71          ; [#uses=1 type=i32] [debug line = 27:4]
  %117 = sub nsw i32 %116, 1, !dbg !71            ; [#uses=1 type=i32] [debug line = 27:4]
  %118 = load [256 x i32]** %1, align 4, !dbg !71 ; [#uses=1 type=[256 x i32]*] [debug line = 27:4]
  %119 = getelementptr inbounds [256 x i32]* %118, i32 %117, !dbg !71 ; [#uses=1 type=[256 x i32]*] [debug line = 27:4]
  %120 = getelementptr inbounds [256 x i32]* %119, i32 0, i32 %115, !dbg !71 ; [#uses=1 type=i32*] [debug line = 27:4]
  %121 = load i32* %120, align 4, !dbg !71        ; [#uses=1 type=i32] [debug line = 27:4]
  %122 = mul nsw i32 2, %121, !dbg !71            ; [#uses=1 type=i32] [debug line = 27:4]
  %123 = add nsw i32 %114, %122, !dbg !71         ; [#uses=1 type=i32] [debug line = 27:4]
  %124 = load i32* %j, align 4, !dbg !71          ; [#uses=1 type=i32] [debug line = 27:4]
  %125 = add nsw i32 %124, 1, !dbg !71            ; [#uses=1 type=i32] [debug line = 27:4]
  %126 = load i32* %i, align 4, !dbg !71          ; [#uses=1 type=i32] [debug line = 27:4]
  %127 = sub nsw i32 %126, 1, !dbg !71            ; [#uses=1 type=i32] [debug line = 27:4]
  %128 = load [256 x i32]** %1, align 4, !dbg !71 ; [#uses=1 type=[256 x i32]*] [debug line = 27:4]
  %129 = getelementptr inbounds [256 x i32]* %128, i32 %127, !dbg !71 ; [#uses=1 type=[256 x i32]*] [debug line = 27:4]
  %130 = getelementptr inbounds [256 x i32]* %129, i32 0, i32 %125, !dbg !71 ; [#uses=1 type=i32*] [debug line = 27:4]
  %131 = load i32* %130, align 4, !dbg !71        ; [#uses=1 type=i32] [debug line = 27:4]
  %132 = add nsw i32 %123, %131, !dbg !71         ; [#uses=1 type=i32] [debug line = 27:4]
  %133 = load i32* %j, align 4, !dbg !71          ; [#uses=1 type=i32] [debug line = 27:4]
  %134 = sub nsw i32 %133, 1, !dbg !71            ; [#uses=1 type=i32] [debug line = 27:4]
  %135 = load i32* %i, align 4, !dbg !71          ; [#uses=1 type=i32] [debug line = 27:4]
  %136 = load [256 x i32]** %1, align 4, !dbg !71 ; [#uses=1 type=[256 x i32]*] [debug line = 27:4]
  %137 = getelementptr inbounds [256 x i32]* %136, i32 %135, !dbg !71 ; [#uses=1 type=[256 x i32]*] [debug line = 27:4]
  %138 = getelementptr inbounds [256 x i32]* %137, i32 0, i32 %134, !dbg !71 ; [#uses=1 type=i32*] [debug line = 27:4]
  %139 = load i32* %138, align 4, !dbg !71        ; [#uses=1 type=i32] [debug line = 27:4]
  %140 = mul nsw i32 0, %139, !dbg !71            ; [#uses=1 type=i32] [debug line = 27:4]
  %141 = add nsw i32 %132, %140, !dbg !71         ; [#uses=1 type=i32] [debug line = 27:4]
  %142 = load i32* %j, align 4, !dbg !71          ; [#uses=1 type=i32] [debug line = 27:4]
  %143 = load i32* %i, align 4, !dbg !71          ; [#uses=1 type=i32] [debug line = 27:4]
  %144 = load [256 x i32]** %1, align 4, !dbg !71 ; [#uses=1 type=[256 x i32]*] [debug line = 27:4]
  %145 = getelementptr inbounds [256 x i32]* %144, i32 %143, !dbg !71 ; [#uses=1 type=[256 x i32]*] [debug line = 27:4]
  %146 = getelementptr inbounds [256 x i32]* %145, i32 0, i32 %142, !dbg !71 ; [#uses=1 type=i32*] [debug line = 27:4]
  %147 = load i32* %146, align 4, !dbg !71        ; [#uses=1 type=i32] [debug line = 27:4]
  %148 = mul nsw i32 0, %147, !dbg !71            ; [#uses=1 type=i32] [debug line = 27:4]
  %149 = add nsw i32 %141, %148, !dbg !71         ; [#uses=1 type=i32] [debug line = 27:4]
  %150 = load i32* %j, align 4, !dbg !71          ; [#uses=1 type=i32] [debug line = 27:4]
  %151 = add nsw i32 %150, 1, !dbg !71            ; [#uses=1 type=i32] [debug line = 27:4]
  %152 = load i32* %i, align 4, !dbg !71          ; [#uses=1 type=i32] [debug line = 27:4]
  %153 = load [256 x i32]** %1, align 4, !dbg !71 ; [#uses=1 type=[256 x i32]*] [debug line = 27:4]
  %154 = getelementptr inbounds [256 x i32]* %153, i32 %152, !dbg !71 ; [#uses=1 type=[256 x i32]*] [debug line = 27:4]
  %155 = getelementptr inbounds [256 x i32]* %154, i32 0, i32 %151, !dbg !71 ; [#uses=1 type=i32*] [debug line = 27:4]
  %156 = load i32* %155, align 4, !dbg !71        ; [#uses=1 type=i32] [debug line = 27:4]
  %157 = mul nsw i32 0, %156, !dbg !71            ; [#uses=1 type=i32] [debug line = 27:4]
  %158 = add nsw i32 %149, %157, !dbg !71         ; [#uses=1 type=i32] [debug line = 27:4]
  %159 = load i32* %j, align 4, !dbg !71          ; [#uses=1 type=i32] [debug line = 27:4]
  %160 = sub nsw i32 %159, 1, !dbg !71            ; [#uses=1 type=i32] [debug line = 27:4]
  %161 = load i32* %i, align 4, !dbg !71          ; [#uses=1 type=i32] [debug line = 27:4]
  %162 = add nsw i32 %161, 1, !dbg !71            ; [#uses=1 type=i32] [debug line = 27:4]
  %163 = load [256 x i32]** %1, align 4, !dbg !71 ; [#uses=1 type=[256 x i32]*] [debug line = 27:4]
  %164 = getelementptr inbounds [256 x i32]* %163, i32 %162, !dbg !71 ; [#uses=1 type=[256 x i32]*] [debug line = 27:4]
  %165 = getelementptr inbounds [256 x i32]* %164, i32 0, i32 %160, !dbg !71 ; [#uses=1 type=i32*] [debug line = 27:4]
  %166 = load i32* %165, align 4, !dbg !71        ; [#uses=1 type=i32] [debug line = 27:4]
  %167 = mul nsw i32 1, %166, !dbg !71            ; [#uses=1 type=i32] [debug line = 27:4]
  %168 = sub nsw i32 %158, %167, !dbg !71         ; [#uses=1 type=i32] [debug line = 27:4]
  %169 = load i32* %j, align 4, !dbg !71          ; [#uses=1 type=i32] [debug line = 27:4]
  %170 = load i32* %i, align 4, !dbg !71          ; [#uses=1 type=i32] [debug line = 27:4]
  %171 = add nsw i32 %170, 1, !dbg !71            ; [#uses=1 type=i32] [debug line = 27:4]
  %172 = load [256 x i32]** %1, align 4, !dbg !71 ; [#uses=1 type=[256 x i32]*] [debug line = 27:4]
  %173 = getelementptr inbounds [256 x i32]* %172, i32 %171, !dbg !71 ; [#uses=1 type=[256 x i32]*] [debug line = 27:4]
  %174 = getelementptr inbounds [256 x i32]* %173, i32 0, i32 %169, !dbg !71 ; [#uses=1 type=i32*] [debug line = 27:4]
  %175 = load i32* %174, align 4, !dbg !71        ; [#uses=1 type=i32] [debug line = 27:4]
  %176 = mul nsw i32 2, %175, !dbg !71            ; [#uses=1 type=i32] [debug line = 27:4]
  %177 = sub nsw i32 %168, %176, !dbg !71         ; [#uses=1 type=i32] [debug line = 27:4]
  %178 = load i32* %j, align 4, !dbg !71          ; [#uses=1 type=i32] [debug line = 27:4]
  %179 = add nsw i32 %178, 1, !dbg !71            ; [#uses=1 type=i32] [debug line = 27:4]
  %180 = load i32* %i, align 4, !dbg !71          ; [#uses=1 type=i32] [debug line = 27:4]
  %181 = add nsw i32 %180, 1, !dbg !71            ; [#uses=1 type=i32] [debug line = 27:4]
  %182 = load [256 x i32]** %1, align 4, !dbg !71 ; [#uses=1 type=[256 x i32]*] [debug line = 27:4]
  %183 = getelementptr inbounds [256 x i32]* %182, i32 %181, !dbg !71 ; [#uses=1 type=[256 x i32]*] [debug line = 27:4]
  %184 = getelementptr inbounds [256 x i32]* %183, i32 0, i32 %179, !dbg !71 ; [#uses=1 type=i32*] [debug line = 27:4]
  %185 = load i32* %184, align 4, !dbg !71        ; [#uses=1 type=i32] [debug line = 27:4]
  %186 = mul nsw i32 1, %185, !dbg !71            ; [#uses=1 type=i32] [debug line = 27:4]
  %187 = sub nsw i32 %177, %186, !dbg !71         ; [#uses=1 type=i32] [debug line = 27:4]
  store i32 %187, i32* %y_dir, align 4, !dbg !71  ; [debug line = 27:4]
  %188 = load i32* %x_dir, align 4, !dbg !72      ; [#uses=1 type=i32] [debug line = 28:18]
  %189 = call i32 @abs(i32 %188), !dbg !72        ; [#uses=1 type=i32] [debug line = 28:18]
  %190 = load i32* %y_dir, align 4, !dbg !73      ; [#uses=1 type=i32] [debug line = 28:31]
  %191 = call i32 @abs(i32 %190), !dbg !73        ; [#uses=1 type=i32] [debug line = 28:31]
  %192 = add nsw i32 %189, %191, !dbg !73         ; [#uses=1 type=i32] [debug line = 28:31]
  store i32 %192, i32* %edge_weight, align 4, !dbg !73 ; [debug line = 28:31]
  %193 = load i32* %edge_weight, align 4, !dbg !74 ; [#uses=1 type=i32] [debug line = 29:4]
  %194 = load i32* %j, align 4, !dbg !74          ; [#uses=1 type=i32] [debug line = 29:4]
  %195 = load i32* %i, align 4, !dbg !74          ; [#uses=1 type=i32] [debug line = 29:4]
  %196 = getelementptr inbounds [256 x [256 x i32]]* %image, i32 0, i32 %195, !dbg !74 ; [#uses=1 type=[256 x i32]*] [debug line = 29:4]
  %197 = getelementptr inbounds [256 x i32]* %196, i32 0, i32 %194, !dbg !74 ; [#uses=1 type=i32*] [debug line = 29:4]
  store i32 %193, i32* %197, align 4, !dbg !74    ; [debug line = 29:4]
  br label %198, !dbg !75                         ; [debug line = 31:3]

; <label>:198                                     ; preds = %24, %21, %18, %15, %12
  %199 = load i32* %i, align 4, !dbg !76          ; [#uses=1 type=i32] [debug line = 32:3]
  %200 = icmp eq i32 %199, 0, !dbg !76            ; [#uses=1 type=i1] [debug line = 32:3]
  br i1 %200, label %201, label %207, !dbg !76    ; [debug line = 32:3]

; <label>:201                                     ; preds = %198
  %202 = load i32* %j, align 4, !dbg !77          ; [#uses=1 type=i32] [debug line = 34:4]
  %203 = load i32* %i, align 4, !dbg !77          ; [#uses=1 type=i32] [debug line = 34:4]
  %204 = load [256 x i32]** %2, align 4, !dbg !77 ; [#uses=1 type=[256 x i32]*] [debug line = 34:4]
  %205 = getelementptr inbounds [256 x i32]* %204, i32 %203, !dbg !77 ; [#uses=1 type=[256 x i32]*] [debug line = 34:4]
  %206 = getelementptr inbounds [256 x i32]* %205, i32 0, i32 %202, !dbg !77 ; [#uses=1 type=i32*] [debug line = 34:4]
  store i32 0, i32* %206, align 4, !dbg !77       ; [debug line = 34:4]
  br label %207, !dbg !79                         ; [debug line = 35:3]

; <label>:207                                     ; preds = %201, %198
  %208 = load i32* %i, align 4, !dbg !80          ; [#uses=1 type=i32] [debug line = 36:3]
  %209 = icmp eq i32 %208, 255, !dbg !80          ; [#uses=1 type=i1] [debug line = 36:3]
  br i1 %209, label %210, label %216, !dbg !80    ; [debug line = 36:3]

; <label>:210                                     ; preds = %207
  %211 = load i32* %j, align 4, !dbg !81          ; [#uses=1 type=i32] [debug line = 38:4]
  %212 = load i32* %i, align 4, !dbg !81          ; [#uses=1 type=i32] [debug line = 38:4]
  %213 = load [256 x i32]** %2, align 4, !dbg !81 ; [#uses=1 type=[256 x i32]*] [debug line = 38:4]
  %214 = getelementptr inbounds [256 x i32]* %213, i32 %212, !dbg !81 ; [#uses=1 type=[256 x i32]*] [debug line = 38:4]
  %215 = getelementptr inbounds [256 x i32]* %214, i32 0, i32 %211, !dbg !81 ; [#uses=1 type=i32*] [debug line = 38:4]
  store i32 0, i32* %215, align 4, !dbg !81       ; [debug line = 38:4]
  br label %216, !dbg !83                         ; [debug line = 39:3]

; <label>:216                                     ; preds = %210, %207
  %217 = load i32* %j, align 4, !dbg !84          ; [#uses=1 type=i32] [debug line = 41:3]
  %218 = icmp eq i32 %217, 0, !dbg !84            ; [#uses=1 type=i1] [debug line = 41:3]
  br i1 %218, label %219, label %225, !dbg !84    ; [debug line = 41:3]

; <label>:219                                     ; preds = %216
  %220 = load i32* %j, align 4, !dbg !85          ; [#uses=1 type=i32] [debug line = 43:4]
  %221 = load i32* %i, align 4, !dbg !85          ; [#uses=1 type=i32] [debug line = 43:4]
  %222 = load [256 x i32]** %2, align 4, !dbg !85 ; [#uses=1 type=[256 x i32]*] [debug line = 43:4]
  %223 = getelementptr inbounds [256 x i32]* %222, i32 %221, !dbg !85 ; [#uses=1 type=[256 x i32]*] [debug line = 43:4]
  %224 = getelementptr inbounds [256 x i32]* %223, i32 0, i32 %220, !dbg !85 ; [#uses=1 type=i32*] [debug line = 43:4]
  store i32 0, i32* %224, align 4, !dbg !85       ; [debug line = 43:4]
  br label %225, !dbg !87                         ; [debug line = 44:3]

; <label>:225                                     ; preds = %219, %216
  %226 = load i32* %j, align 4, !dbg !88          ; [#uses=1 type=i32] [debug line = 45:3]
  %227 = icmp eq i32 %226, 255, !dbg !88          ; [#uses=1 type=i1] [debug line = 45:3]
  br i1 %227, label %228, label %234, !dbg !88    ; [debug line = 45:3]

; <label>:228                                     ; preds = %225
  %229 = load i32* %j, align 4, !dbg !89          ; [#uses=1 type=i32] [debug line = 47:4]
  %230 = load i32* %i, align 4, !dbg !89          ; [#uses=1 type=i32] [debug line = 47:4]
  %231 = load [256 x i32]** %2, align 4, !dbg !89 ; [#uses=1 type=[256 x i32]*] [debug line = 47:4]
  %232 = getelementptr inbounds [256 x i32]* %231, i32 %230, !dbg !89 ; [#uses=1 type=[256 x i32]*] [debug line = 47:4]
  %233 = getelementptr inbounds [256 x i32]* %232, i32 0, i32 %229, !dbg !89 ; [#uses=1 type=i32*] [debug line = 47:4]
  store i32 0, i32* %233, align 4, !dbg !89       ; [debug line = 47:4]
  br label %234, !dbg !91                         ; [debug line = 48:3]

; <label>:234                                     ; preds = %228, %225
  br label %235, !dbg !92                         ; [debug line = 49:2]

; <label>:235                                     ; preds = %234
  %236 = load i32* %j, align 4, !dbg !93          ; [#uses=1 type=i32] [debug line = 22:16]
  %237 = add nsw i32 %236, 1, !dbg !93            ; [#uses=1 type=i32] [debug line = 22:16]
  store i32 %237, i32* %j, align 4, !dbg !93      ; [debug line = 22:16]
  br label %9, !dbg !93                           ; [debug line = 22:16]

; <label>:238                                     ; preds = %9
  br label %239, !dbg !94                         ; [debug line = 50:2]

; <label>:239                                     ; preds = %238
  %240 = load i32* %i, align 4, !dbg !95          ; [#uses=1 type=i32] [debug line = 20:15]
  %241 = add nsw i32 %240, 1, !dbg !95            ; [#uses=1 type=i32] [debug line = 20:15]
  store i32 %241, i32* %i, align 4, !dbg !95      ; [debug line = 20:15]
  br label %5, !dbg !95                           ; [debug line = 20:15]

; <label>:242                                     ; preds = %5
  %243 = getelementptr inbounds [256 x [256 x i32]]* %image, i32 0, i32 1, !dbg !96 ; [#uses=1 type=[256 x i32]*] [debug line = 53:1]
  %244 = getelementptr inbounds [256 x i32]* %243, i32 0, i32 1, !dbg !96 ; [#uses=1 type=i32*] [debug line = 53:1]
  %245 = load i32* %244, align 4, !dbg !96        ; [#uses=1 type=i32] [debug line = 53:1]
  store i32 %245, i32* %max, align 4, !dbg !96    ; [debug line = 53:1]
  %246 = getelementptr inbounds [256 x [256 x i32]]* %image, i32 0, i32 1, !dbg !97 ; [#uses=1 type=[256 x i32]*] [debug line = 54:1]
  %247 = getelementptr inbounds [256 x i32]* %246, i32 0, i32 1, !dbg !97 ; [#uses=1 type=i32*] [debug line = 54:1]
  %248 = load i32* %247, align 4, !dbg !97        ; [#uses=1 type=i32] [debug line = 54:1]
  store i32 %248, i32* %min, align 4, !dbg !97    ; [debug line = 54:1]
  store i32 1, i32* %c, align 4, !dbg !98         ; [debug line = 56:6]
  br label %249, !dbg !98                         ; [debug line = 56:6]

; <label>:249                                     ; preds = %289, %242
  %250 = load i32* %c, align 4, !dbg !98          ; [#uses=1 type=i32] [debug line = 56:6]
  %251 = icmp slt i32 %250, 255, !dbg !98         ; [#uses=1 type=i1] [debug line = 56:6]
  br i1 %251, label %252, label %292, !dbg !98    ; [debug line = 56:6]

; <label>:252                                     ; preds = %249
  store i32 1, i32* %d, align 4, !dbg !100        ; [debug line = 58:11]
  br label %253, !dbg !100                        ; [debug line = 58:11]

; <label>:253                                     ; preds = %285, %252
  %254 = load i32* %d, align 4, !dbg !100         ; [#uses=1 type=i32] [debug line = 58:11]
  %255 = icmp slt i32 %254, 255, !dbg !100        ; [#uses=1 type=i1] [debug line = 58:11]
  br i1 %255, label %256, label %288, !dbg !100   ; [debug line = 58:11]

; <label>:256                                     ; preds = %253
  %257 = load i32* %d, align 4, !dbg !103         ; [#uses=1 type=i32] [debug line = 60:7]
  %258 = load i32* %c, align 4, !dbg !103         ; [#uses=1 type=i32] [debug line = 60:7]
  %259 = getelementptr inbounds [256 x [256 x i32]]* %image, i32 0, i32 %258, !dbg !103 ; [#uses=1 type=[256 x i32]*] [debug line = 60:7]
  %260 = getelementptr inbounds [256 x i32]* %259, i32 0, i32 %257, !dbg !103 ; [#uses=1 type=i32*] [debug line = 60:7]
  %261 = load i32* %260, align 4, !dbg !103       ; [#uses=1 type=i32] [debug line = 60:7]
  %262 = load i32* %max, align 4, !dbg !103       ; [#uses=1 type=i32] [debug line = 60:7]
  %263 = icmp sgt i32 %261, %262, !dbg !103       ; [#uses=1 type=i1] [debug line = 60:7]
  br i1 %263, label %264, label %270, !dbg !103   ; [debug line = 60:7]

; <label>:264                                     ; preds = %256
  %265 = load i32* %d, align 4, !dbg !105         ; [#uses=1 type=i32] [debug line = 62:8]
  %266 = load i32* %c, align 4, !dbg !105         ; [#uses=1 type=i32] [debug line = 62:8]
  %267 = getelementptr inbounds [256 x [256 x i32]]* %image, i32 0, i32 %266, !dbg !105 ; [#uses=1 type=[256 x i32]*] [debug line = 62:8]
  %268 = getelementptr inbounds [256 x i32]* %267, i32 0, i32 %265, !dbg !105 ; [#uses=1 type=i32*] [debug line = 62:8]
  %269 = load i32* %268, align 4, !dbg !105       ; [#uses=1 type=i32] [debug line = 62:8]
  store i32 %269, i32* %max, align 4, !dbg !105   ; [debug line = 62:8]
  br label %270, !dbg !107                        ; [debug line = 64:7]

; <label>:270                                     ; preds = %264, %256
  %271 = load i32* %d, align 4, !dbg !108         ; [#uses=1 type=i32] [debug line = 65:7]
  %272 = load i32* %c, align 4, !dbg !108         ; [#uses=1 type=i32] [debug line = 65:7]
  %273 = getelementptr inbounds [256 x [256 x i32]]* %image, i32 0, i32 %272, !dbg !108 ; [#uses=1 type=[256 x i32]*] [debug line = 65:7]
  %274 = getelementptr inbounds [256 x i32]* %273, i32 0, i32 %271, !dbg !108 ; [#uses=1 type=i32*] [debug line = 65:7]
  %275 = load i32* %274, align 4, !dbg !108       ; [#uses=1 type=i32] [debug line = 65:7]
  %276 = load i32* %min, align 4, !dbg !108       ; [#uses=1 type=i32] [debug line = 65:7]
  %277 = icmp slt i32 %275, %276, !dbg !108       ; [#uses=1 type=i1] [debug line = 65:7]
  br i1 %277, label %278, label %284, !dbg !108   ; [debug line = 65:7]

; <label>:278                                     ; preds = %270
  %279 = load i32* %d, align 4, !dbg !109         ; [#uses=1 type=i32] [debug line = 67:8]
  %280 = load i32* %c, align 4, !dbg !109         ; [#uses=1 type=i32] [debug line = 67:8]
  %281 = getelementptr inbounds [256 x [256 x i32]]* %image, i32 0, i32 %280, !dbg !109 ; [#uses=1 type=[256 x i32]*] [debug line = 67:8]
  %282 = getelementptr inbounds [256 x i32]* %281, i32 0, i32 %279, !dbg !109 ; [#uses=1 type=i32*] [debug line = 67:8]
  %283 = load i32* %282, align 4, !dbg !109       ; [#uses=1 type=i32] [debug line = 67:8]
  store i32 %283, i32* %min, align 4, !dbg !109   ; [debug line = 67:8]
  br label %284, !dbg !111                        ; [debug line = 68:7]

; <label>:284                                     ; preds = %278, %270
  br label %285, !dbg !112                        ; [debug line = 69:6]

; <label>:285                                     ; preds = %284
  %286 = load i32* %d, align 4, !dbg !113         ; [#uses=1 type=i32] [debug line = 58:27]
  %287 = add nsw i32 %286, 1, !dbg !113           ; [#uses=1 type=i32] [debug line = 58:27]
  store i32 %287, i32* %d, align 4, !dbg !113     ; [debug line = 58:27]
  br label %253, !dbg !113                        ; [debug line = 58:27]

; <label>:288                                     ; preds = %253
  br label %289, !dbg !114                        ; [debug line = 70:2]

; <label>:289                                     ; preds = %288
  %290 = load i32* %c, align 4, !dbg !115         ; [#uses=1 type=i32] [debug line = 56:22]
  %291 = add nsw i32 %290, 1, !dbg !115           ; [#uses=1 type=i32] [debug line = 56:22]
  store i32 %291, i32* %c, align 4, !dbg !115     ; [debug line = 56:22]
  br label %249, !dbg !115                        ; [debug line = 56:22]

; <label>:292                                     ; preds = %249
  store i32 1, i32* %k, align 4, !dbg !116        ; [debug line = 74:5]
  br label %293, !dbg !116                        ; [debug line = 74:5]

; <label>:293                                     ; preds = %320, %292
  %294 = load i32* %k, align 4, !dbg !116         ; [#uses=1 type=i32] [debug line = 74:5]
  %295 = icmp slt i32 %294, 255, !dbg !116        ; [#uses=1 type=i1] [debug line = 74:5]
  br i1 %295, label %296, label %323, !dbg !116   ; [debug line = 74:5]

; <label>:296                                     ; preds = %293
  store i32 1, i32* %l, align 4, !dbg !118        ; [debug line = 76:7]
  br label %297, !dbg !118                        ; [debug line = 76:7]

; <label>:297                                     ; preds = %316, %296
  %298 = load i32* %l, align 4, !dbg !118         ; [#uses=1 type=i32] [debug line = 76:7]
  %299 = icmp slt i32 %298, 255, !dbg !118        ; [#uses=1 type=i1] [debug line = 76:7]
  br i1 %299, label %300, label %319, !dbg !118   ; [debug line = 76:7]

; <label>:300                                     ; preds = %297
  %301 = load i32* %l, align 4, !dbg !121         ; [#uses=1 type=i32] [debug line = 78:4]
  %302 = load i32* %k, align 4, !dbg !121         ; [#uses=1 type=i32] [debug line = 78:4]
  %303 = getelementptr inbounds [256 x [256 x i32]]* %image, i32 0, i32 %302, !dbg !121 ; [#uses=1 type=[256 x i32]*] [debug line = 78:4]
  %304 = getelementptr inbounds [256 x i32]* %303, i32 0, i32 %301, !dbg !121 ; [#uses=1 type=i32*] [debug line = 78:4]
  %305 = load i32* %304, align 4, !dbg !121       ; [#uses=1 type=i32] [debug line = 78:4]
  %306 = mul nsw i32 255, %305, !dbg !121         ; [#uses=1 type=i32] [debug line = 78:4]
  %307 = load i32* %max, align 4, !dbg !121       ; [#uses=1 type=i32] [debug line = 78:4]
  %308 = load i32* %min, align 4, !dbg !121       ; [#uses=1 type=i32] [debug line = 78:4]
  %309 = sub nsw i32 %307, %308, !dbg !121        ; [#uses=1 type=i32] [debug line = 78:4]
  %310 = sdiv i32 %306, %309, !dbg !121           ; [#uses=1 type=i32] [debug line = 78:4]
  %311 = load i32* %l, align 4, !dbg !121         ; [#uses=1 type=i32] [debug line = 78:4]
  %312 = load i32* %k, align 4, !dbg !121         ; [#uses=1 type=i32] [debug line = 78:4]
  %313 = load [256 x i32]** %2, align 4, !dbg !121 ; [#uses=1 type=[256 x i32]*] [debug line = 78:4]
  %314 = getelementptr inbounds [256 x i32]* %313, i32 %312, !dbg !121 ; [#uses=1 type=[256 x i32]*] [debug line = 78:4]
  %315 = getelementptr inbounds [256 x i32]* %314, i32 0, i32 %311, !dbg !121 ; [#uses=1 type=i32*] [debug line = 78:4]
  store i32 %310, i32* %315, align 4, !dbg !121   ; [debug line = 78:4]
  br label %316, !dbg !123                        ; [debug line = 80:3]

; <label>:316                                     ; preds = %300
  %317 = load i32* %l, align 4, !dbg !124         ; [#uses=1 type=i32] [debug line = 76:17]
  %318 = add nsw i32 %317, 1, !dbg !124           ; [#uses=1 type=i32] [debug line = 76:17]
  store i32 %318, i32* %l, align 4, !dbg !124     ; [debug line = 76:17]
  br label %297, !dbg !124                        ; [debug line = 76:17]

; <label>:319                                     ; preds = %297
  br label %320, !dbg !125                        ; [debug line = 81:2]

; <label>:320                                     ; preds = %319
  %321 = load i32* %k, align 4, !dbg !126         ; [#uses=1 type=i32] [debug line = 74:15]
  %322 = add nsw i32 %321, 1, !dbg !126           ; [#uses=1 type=i32] [debug line = 74:15]
  store i32 %322, i32* %k, align 4, !dbg !126     ; [debug line = 74:15]
  br label %293, !dbg !126                        ; [debug line = 74:15]

; <label>:323                                     ; preds = %293
  ret void, !dbg !127                             ; [debug line = 84:1]
}

; [#uses=14]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=1]
declare void @_ssdm_SpecArrayDimSize(...) nounwind

; [#uses=2]
declare i32 @abs(i32)

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
!18 = metadata !{i32 786484, i32 0, null, metadata !"_sys_nerr", metadata !"_sys_nerr", metadata !"", metadata !19, i32 157, metadata !11, i32 0, i32 1, i32* @_sys_nerr} ; [ DW_TAG_variable ]
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
!34 = metadata !{i32 786688, metadata !32, metadata !"k", metadata !6, i32 8, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!35 = metadata !{i32 8, i32 6, metadata !32, null}
!36 = metadata !{i32 786688, metadata !32, metadata !"l", metadata !6, i32 8, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!37 = metadata !{i32 8, i32 8, metadata !32, null}
!38 = metadata !{i32 786688, metadata !32, metadata !"c", metadata !6, i32 8, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!39 = metadata !{i32 8, i32 10, metadata !32, null}
!40 = metadata !{i32 786688, metadata !32, metadata !"d", metadata !6, i32 8, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!41 = metadata !{i32 8, i32 12, metadata !32, null}
!42 = metadata !{i32 786688, metadata !32, metadata !"image", metadata !6, i32 9, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!43 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2097152, i64 32, i32 0, i32 0, metadata !11, metadata !44, i32 0, i32 0} ; [ DW_TAG_array_type ]
!44 = metadata !{metadata !13, metadata !13}
!45 = metadata !{i32 9, i32 6, metadata !32, null}
!46 = metadata !{i32 786688, metadata !32, metadata !"i", metadata !6, i32 10, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!47 = metadata !{i32 10, i32 6, metadata !32, null}
!48 = metadata !{i32 786688, metadata !32, metadata !"j", metadata !6, i32 11, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!49 = metadata !{i32 11, i32 6, metadata !32, null}
!50 = metadata !{i32 786688, metadata !32, metadata !"max", metadata !6, i32 12, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!51 = metadata !{i32 12, i32 6, metadata !32, null}
!52 = metadata !{i32 786688, metadata !32, metadata !"min", metadata !6, i32 12, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!53 = metadata !{i32 12, i32 10, metadata !32, null}
!54 = metadata !{i32 786688, metadata !32, metadata !"x_dir", metadata !6, i32 16, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!55 = metadata !{i32 16, i32 6, metadata !32, null}
!56 = metadata !{i32 786688, metadata !32, metadata !"y_dir", metadata !6, i32 16, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!57 = metadata !{i32 16, i32 12, metadata !32, null}
!58 = metadata !{i32 786688, metadata !32, metadata !"edge_weight", metadata !6, i32 16, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!59 = metadata !{i32 16, i32 18, metadata !32, null}
!60 = metadata !{i32 17, i32 2, metadata !32, null}
!61 = metadata !{i32 18, i32 2, metadata !32, null}
!62 = metadata !{i32 20, i32 5, metadata !63, null}
!63 = metadata !{i32 786443, metadata !32, i32 20, i32 1, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!64 = metadata !{i32 22, i32 6, metadata !65, null}
!65 = metadata !{i32 786443, metadata !66, i32 22, i32 2, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!66 = metadata !{i32 786443, metadata !63, i32 21, i32 2, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!67 = metadata !{i32 24, i32 3, metadata !68, null}
!68 = metadata !{i32 786443, metadata !65, i32 23, i32 2, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!69 = metadata !{i32 26, i32 4, metadata !70, null}
!70 = metadata !{i32 786443, metadata !68, i32 25, i32 3, metadata !6, i32 5} ; [ DW_TAG_lexical_block ]
!71 = metadata !{i32 27, i32 4, metadata !70, null}
!72 = metadata !{i32 28, i32 18, metadata !70, null}
!73 = metadata !{i32 28, i32 31, metadata !70, null}
!74 = metadata !{i32 29, i32 4, metadata !70, null}
!75 = metadata !{i32 31, i32 3, metadata !70, null}
!76 = metadata !{i32 32, i32 3, metadata !68, null}
!77 = metadata !{i32 34, i32 4, metadata !78, null}
!78 = metadata !{i32 786443, metadata !68, i32 33, i32 3, metadata !6, i32 6} ; [ DW_TAG_lexical_block ]
!79 = metadata !{i32 35, i32 3, metadata !78, null}
!80 = metadata !{i32 36, i32 3, metadata !68, null}
!81 = metadata !{i32 38, i32 4, metadata !82, null}
!82 = metadata !{i32 786443, metadata !68, i32 37, i32 3, metadata !6, i32 7} ; [ DW_TAG_lexical_block ]
!83 = metadata !{i32 39, i32 3, metadata !82, null}
!84 = metadata !{i32 41, i32 3, metadata !68, null}
!85 = metadata !{i32 43, i32 4, metadata !86, null}
!86 = metadata !{i32 786443, metadata !68, i32 42, i32 3, metadata !6, i32 8} ; [ DW_TAG_lexical_block ]
!87 = metadata !{i32 44, i32 3, metadata !86, null}
!88 = metadata !{i32 45, i32 3, metadata !68, null}
!89 = metadata !{i32 47, i32 4, metadata !90, null}
!90 = metadata !{i32 786443, metadata !68, i32 46, i32 3, metadata !6, i32 9} ; [ DW_TAG_lexical_block ]
!91 = metadata !{i32 48, i32 3, metadata !90, null}
!92 = metadata !{i32 49, i32 2, metadata !68, null}
!93 = metadata !{i32 22, i32 16, metadata !65, null}
!94 = metadata !{i32 50, i32 2, metadata !66, null}
!95 = metadata !{i32 20, i32 15, metadata !63, null}
!96 = metadata !{i32 53, i32 1, metadata !32, null}
!97 = metadata !{i32 54, i32 1, metadata !32, null}
!98 = metadata !{i32 56, i32 6, metadata !99, null}
!99 = metadata !{i32 786443, metadata !32, i32 56, i32 1, metadata !6, i32 10} ; [ DW_TAG_lexical_block ]
!100 = metadata !{i32 58, i32 11, metadata !101, null}
!101 = metadata !{i32 786443, metadata !102, i32 58, i32 6, metadata !6, i32 12} ; [ DW_TAG_lexical_block ]
!102 = metadata !{i32 786443, metadata !99, i32 57, i32 2, metadata !6, i32 11} ; [ DW_TAG_lexical_block ]
!103 = metadata !{i32 60, i32 7, metadata !104, null}
!104 = metadata !{i32 786443, metadata !101, i32 59, i32 6, metadata !6, i32 13} ; [ DW_TAG_lexical_block ]
!105 = metadata !{i32 62, i32 8, metadata !106, null}
!106 = metadata !{i32 786443, metadata !104, i32 61, i32 7, metadata !6, i32 14} ; [ DW_TAG_lexical_block ]
!107 = metadata !{i32 64, i32 7, metadata !106, null}
!108 = metadata !{i32 65, i32 7, metadata !104, null}
!109 = metadata !{i32 67, i32 8, metadata !110, null}
!110 = metadata !{i32 786443, metadata !104, i32 66, i32 7, metadata !6, i32 15} ; [ DW_TAG_lexical_block ]
!111 = metadata !{i32 68, i32 7, metadata !110, null}
!112 = metadata !{i32 69, i32 6, metadata !104, null}
!113 = metadata !{i32 58, i32 27, metadata !101, null}
!114 = metadata !{i32 70, i32 2, metadata !102, null}
!115 = metadata !{i32 56, i32 22, metadata !99, null}
!116 = metadata !{i32 74, i32 5, metadata !117, null}
!117 = metadata !{i32 786443, metadata !32, i32 74, i32 1, metadata !6, i32 16} ; [ DW_TAG_lexical_block ]
!118 = metadata !{i32 76, i32 7, metadata !119, null}
!119 = metadata !{i32 786443, metadata !120, i32 76, i32 3, metadata !6, i32 18} ; [ DW_TAG_lexical_block ]
!120 = metadata !{i32 786443, metadata !117, i32 75, i32 2, metadata !6, i32 17} ; [ DW_TAG_lexical_block ]
!121 = metadata !{i32 78, i32 4, metadata !122, null}
!122 = metadata !{i32 786443, metadata !119, i32 77, i32 3, metadata !6, i32 19} ; [ DW_TAG_lexical_block ]
!123 = metadata !{i32 80, i32 3, metadata !122, null}
!124 = metadata !{i32 76, i32 17, metadata !119, null}
!125 = metadata !{i32 81, i32 2, metadata !120, null}
!126 = metadata !{i32 74, i32 15, metadata !117, null}
!127 = metadata !{i32 84, i32 1, metadata !32, null}
