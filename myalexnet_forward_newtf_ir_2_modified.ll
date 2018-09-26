; ModuleID = '__compute_module'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux_gnu"

@0 = private constant float 0.000000e+00, align 4
@parallel_fusion.13_parallel_dimension_partitions = private constant [4 x i64] [i64 0, i64 1, i64 1, i64 2]
@parallel_reduce-window_parallel_dimension_partitions = private constant [4 x i64] [i64 0, i64 1, i64 1, i64 2]
@1 = private constant float 1.000000e+00, align 4
@2 = private constant float 0x3EF4F8B580000000, align 4
@3 = private constant float -7.500000e-01, align 4
@parallel_fusion.12_parallel_dimension_partitions = private constant [4 x i64] [i64 0, i64 1, i64 1, i64 2]
@4 = private constant float 0xFFF0000000000000, align 4
@parallel_reduce-window.1_parallel_dimension_partitions = private constant [4 x i64] [i64 0, i64 1, i64 1, i64 2]
@parallel_slice.2_parallel_dimension_partitions = private constant [4 x i64] [i64 0, i64 2, i64 2, i64 5]
@parallel_slice.4_parallel_dimension_partitions = private constant [4 x i64] [i64 0, i64 2, i64 2, i64 5]
@parallel_fusion.11_parallel_dimension_partitions = private constant [4 x i64] [i64 0, i64 1, i64 1, i64 2]
@parallel_reduce-window.2_parallel_dimension_partitions = private constant [4 x i64] [i64 0, i64 1, i64 1, i64 2]
@parallel_fusion.10_parallel_dimension_partitions = private constant [4 x i64] [i64 0, i64 1, i64 1, i64 2]
@parallel_slice.1_parallel_dimension_partitions = private constant [4 x i64] [i64 0, i64 1, i64 1, i64 3]
@parallel_slice.7_parallel_dimension_partitions = private constant [4 x i64] [i64 0, i64 1, i64 1, i64 3]
@parallel_slice_parallel_dimension_partitions = private constant [4 x i64] [i64 0, i64 1, i64 1, i64 3]
@parallel_slice.10_parallel_dimension_partitions = private constant [4 x i64] [i64 0, i64 1, i64 1, i64 3]

define internal void @max_float_.v3(i8* align 4 dereferenceable(4) %retval, i8* noalias %run_options, i8** noalias %params, i8** noalias %temps, i64* noalias %prof_counters) #0 {
entry:
  %0 = getelementptr inbounds i8** %params, i64 1
  %y.1.untyped = load i8** %0, !dereferenceable !0, !align !0
  %1 = bitcast i8* %y.1.untyped to float*
  %2 = getelementptr inbounds i8** %params, i64 0
  %x.1.untyped = load i8** %2, !dereferenceable !0, !align !0
  %3 = bitcast i8* %x.1.untyped to float*
  %maximum = bitcast i8* %retval to float*
  %4 = load float* %3
  %5 = load float* %1
  %6 = fcmp oge float %4, %5
  %7 = fcmp une float %4, %4
  %8 = or i1 %6, %7
  %9 = select i1 %8, float %4, float %5
  store float %9, float* %maximum
  ret void
}

define internal void @add_float_.v3(i8* align 4 dereferenceable(4) %retval, i8* noalias %run_options, i8** noalias %params, i8** noalias %temps, i64* noalias %prof_counters) #0 {
entry:
  %0 = getelementptr inbounds i8** %params, i64 1
  %y.untyped = load i8** %0, !dereferenceable !0, !align !0
  %1 = bitcast i8* %y.untyped to float*
  %2 = getelementptr inbounds i8** %params, i64 0
  %x.untyped = load i8** %2, !dereferenceable !0, !align !0
  %3 = bitcast i8* %x.untyped to float*
  %add = bitcast i8* %retval to float*
  %4 = load float* %3
  %5 = load float* %1
  %6 = fadd float %4, %5
  store float %6, float* %add
  ret void
}

define internal void @parallel_slice(i8* align 16 dereferenceable(884736) %retval, i8* noalias %run_options, i8** noalias %params, i8** noalias %temps, i64* noalias %dynamic_loop_bounds, i64* noalias %prof_counters) #0 {
entry:
  %slice.clone.invar_address.dim.3 = alloca i64
  %slice.clone.invar_address.dim.2 = alloca i64
  %slice.clone.invar_address.dim.1 = alloca i64
  %slice.clone.invar_address.dim.0 = alloca i64
  %0 = getelementptr inbounds i8** %params, i64 0
  %name.untyped = load i8** %0, !dereferenceable !1, !align !2
  %1 = bitcast i8* %name.untyped to [3 x [3 x [192 x [256 x float]]]]*
  %slice.clone = bitcast i8* %retval to [3 x [3 x [192 x [128 x float]]]]*
  %dynamic_loop_bound_0 = getelementptr i64* %dynamic_loop_bounds, i64 0
  %2 = load i64* %dynamic_loop_bound_0
  %dynamic_loop_bound_1 = getelementptr i64* %dynamic_loop_bounds, i64 1
  %3 = load i64* %dynamic_loop_bound_1
  store i64 %2, i64* %slice.clone.invar_address.dim.0
  br label %slice.clone.loop_header.dim.0

slice.clone.loop_header.dim.0:                    ; preds = %slice.clone.loop_exit.dim.1, %entry
  %slice.clone.indvar.dim.0 = load i64* %slice.clone.invar_address.dim.0
  %4 = icmp uge i64 %slice.clone.indvar.dim.0, %3
  br i1 %4, label %slice.clone.loop_exit.dim.0, label %slice.clone.loop_body.dim.0

slice.clone.loop_body.dim.0:                      ; preds = %slice.clone.loop_header.dim.0
  store i64 0, i64* %slice.clone.invar_address.dim.1
  br label %slice.clone.loop_header.dim.1

slice.clone.loop_header.dim.1:                    ; preds = %slice.clone.loop_exit.dim.2, %slice.clone.loop_body.dim.0
  %slice.clone.indvar.dim.1 = load i64* %slice.clone.invar_address.dim.1
  %5 = icmp uge i64 %slice.clone.indvar.dim.1, 3
  br i1 %5, label %slice.clone.loop_exit.dim.1, label %slice.clone.loop_body.dim.1

slice.clone.loop_body.dim.1:                      ; preds = %slice.clone.loop_header.dim.1
  store i64 0, i64* %slice.clone.invar_address.dim.2
  br label %slice.clone.loop_header.dim.2

slice.clone.loop_header.dim.2:                    ; preds = %slice.clone.loop_exit.dim.3, %slice.clone.loop_body.dim.1
  %slice.clone.indvar.dim.2 = load i64* %slice.clone.invar_address.dim.2
  %6 = icmp uge i64 %slice.clone.indvar.dim.2, 192
  br i1 %6, label %slice.clone.loop_exit.dim.2, label %slice.clone.loop_body.dim.2

slice.clone.loop_body.dim.2:                      ; preds = %slice.clone.loop_header.dim.2
  store i64 0, i64* %slice.clone.invar_address.dim.3
  br label %slice.clone.loop_header.dim.3

slice.clone.loop_header.dim.3:                    ; preds = %slice.clone.loop_body.dim.3, %slice.clone.loop_body.dim.2
  %slice.clone.indvar.dim.3 = load i64* %slice.clone.invar_address.dim.3
  %7 = icmp uge i64 %slice.clone.indvar.dim.3, 128
  br i1 %7, label %slice.clone.loop_exit.dim.3, label %slice.clone.loop_body.dim.3

slice.clone.loop_body.dim.3:                      ; preds = %slice.clone.loop_header.dim.3
  %8 = add i64 %slice.clone.indvar.dim.0, 0
  %9 = add i64 %slice.clone.indvar.dim.1, 0
  %10 = add i64 %slice.clone.indvar.dim.2, 0
  %11 = add i64 %slice.clone.indvar.dim.3, 128
  %12 = getelementptr inbounds [3 x [3 x [192 x [256 x float]]]]* %1, i64 0, i64 %8, i64 %9, i64 %10, i64 %11
  %13 = load float* %12
  %14 = getelementptr inbounds [3 x [3 x [192 x [128 x float]]]]* %slice.clone, i64 0, i64 %slice.clone.indvar.dim.0, i64 %slice.clone.indvar.dim.1, i64 %slice.clone.indvar.dim.2, i64 %slice.clone.indvar.dim.3
  store float %13, float* %14
  %invar.inc3 = add nuw nsw i64 %slice.clone.indvar.dim.3, 1
  store i64 %invar.inc3, i64* %slice.clone.invar_address.dim.3
  br label %slice.clone.loop_header.dim.3

slice.clone.loop_exit.dim.3:                      ; preds = %slice.clone.loop_header.dim.3
  %invar.inc2 = add nuw nsw i64 %slice.clone.indvar.dim.2, 1
  store i64 %invar.inc2, i64* %slice.clone.invar_address.dim.2
  br label %slice.clone.loop_header.dim.2

slice.clone.loop_exit.dim.2:                      ; preds = %slice.clone.loop_header.dim.2
  %invar.inc1 = add nuw nsw i64 %slice.clone.indvar.dim.1, 1
  store i64 %invar.inc1, i64* %slice.clone.invar_address.dim.1
  br label %slice.clone.loop_header.dim.1

slice.clone.loop_exit.dim.1:                      ; preds = %slice.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %slice.clone.indvar.dim.0, 1
  store i64 %invar.inc, i64* %slice.clone.invar_address.dim.0
  br label %slice.clone.loop_header.dim.0

slice.clone.loop_exit.dim.0:                      ; preds = %slice.clone.loop_header.dim.0
  ret void
}

define internal void @parallel_slice.1(i8* align 16 dereferenceable(1327104) %retval, i8* noalias %run_options, i8** noalias %params, i8** noalias %temps, i64* noalias %dynamic_loop_bounds, i64* noalias %prof_counters) #0 {
entry:
  %slice.1.clone.invar_address.dim.3 = alloca i64
  %slice.1.clone.invar_address.dim.2 = alloca i64
  %slice.1.clone.invar_address.dim.1 = alloca i64
  %slice.1.clone.invar_address.dim.0 = alloca i64
  %0 = getelementptr inbounds i8** %params, i64 0
  %name.1.untyped = load i8** %0, !dereferenceable !3, !align !2
  %1 = bitcast i8* %name.1.untyped to [3 x [3 x [192 x [384 x float]]]]*
  %slice.1.clone = bitcast i8* %retval to [3 x [3 x [192 x [192 x float]]]]*
  %dynamic_loop_bound_0 = getelementptr i64* %dynamic_loop_bounds, i64 0
  %2 = load i64* %dynamic_loop_bound_0
  %dynamic_loop_bound_1 = getelementptr i64* %dynamic_loop_bounds, i64 1
  %3 = load i64* %dynamic_loop_bound_1
  store i64 %2, i64* %slice.1.clone.invar_address.dim.0
  br label %slice.1.clone.loop_header.dim.0

slice.1.clone.loop_header.dim.0:                  ; preds = %slice.1.clone.loop_exit.dim.1, %entry
  %slice.1.clone.indvar.dim.0 = load i64* %slice.1.clone.invar_address.dim.0
  %4 = icmp uge i64 %slice.1.clone.indvar.dim.0, %3
  br i1 %4, label %slice.1.clone.loop_exit.dim.0, label %slice.1.clone.loop_body.dim.0

slice.1.clone.loop_body.dim.0:                    ; preds = %slice.1.clone.loop_header.dim.0
  store i64 0, i64* %slice.1.clone.invar_address.dim.1
  br label %slice.1.clone.loop_header.dim.1

slice.1.clone.loop_header.dim.1:                  ; preds = %slice.1.clone.loop_exit.dim.2, %slice.1.clone.loop_body.dim.0
  %slice.1.clone.indvar.dim.1 = load i64* %slice.1.clone.invar_address.dim.1
  %5 = icmp uge i64 %slice.1.clone.indvar.dim.1, 3
  br i1 %5, label %slice.1.clone.loop_exit.dim.1, label %slice.1.clone.loop_body.dim.1

slice.1.clone.loop_body.dim.1:                    ; preds = %slice.1.clone.loop_header.dim.1
  store i64 0, i64* %slice.1.clone.invar_address.dim.2
  br label %slice.1.clone.loop_header.dim.2

slice.1.clone.loop_header.dim.2:                  ; preds = %slice.1.clone.loop_exit.dim.3, %slice.1.clone.loop_body.dim.1
  %slice.1.clone.indvar.dim.2 = load i64* %slice.1.clone.invar_address.dim.2
  %6 = icmp uge i64 %slice.1.clone.indvar.dim.2, 192
  br i1 %6, label %slice.1.clone.loop_exit.dim.2, label %slice.1.clone.loop_body.dim.2

slice.1.clone.loop_body.dim.2:                    ; preds = %slice.1.clone.loop_header.dim.2
  store i64 0, i64* %slice.1.clone.invar_address.dim.3
  br label %slice.1.clone.loop_header.dim.3

slice.1.clone.loop_header.dim.3:                  ; preds = %slice.1.clone.loop_body.dim.3, %slice.1.clone.loop_body.dim.2
  %slice.1.clone.indvar.dim.3 = load i64* %slice.1.clone.invar_address.dim.3
  %7 = icmp uge i64 %slice.1.clone.indvar.dim.3, 192
  br i1 %7, label %slice.1.clone.loop_exit.dim.3, label %slice.1.clone.loop_body.dim.3

slice.1.clone.loop_body.dim.3:                    ; preds = %slice.1.clone.loop_header.dim.3
  %8 = add i64 %slice.1.clone.indvar.dim.0, 0
  %9 = add i64 %slice.1.clone.indvar.dim.1, 0
  %10 = add i64 %slice.1.clone.indvar.dim.2, 0
  %11 = add i64 %slice.1.clone.indvar.dim.3, 192
  %12 = getelementptr inbounds [3 x [3 x [192 x [384 x float]]]]* %1, i64 0, i64 %8, i64 %9, i64 %10, i64 %11
  %13 = load float* %12
  %14 = getelementptr inbounds [3 x [3 x [192 x [192 x float]]]]* %slice.1.clone, i64 0, i64 %slice.1.clone.indvar.dim.0, i64 %slice.1.clone.indvar.dim.1, i64 %slice.1.clone.indvar.dim.2, i64 %slice.1.clone.indvar.dim.3
  store float %13, float* %14
  %invar.inc3 = add nuw nsw i64 %slice.1.clone.indvar.dim.3, 1
  store i64 %invar.inc3, i64* %slice.1.clone.invar_address.dim.3
  br label %slice.1.clone.loop_header.dim.3

slice.1.clone.loop_exit.dim.3:                    ; preds = %slice.1.clone.loop_header.dim.3
  %invar.inc2 = add nuw nsw i64 %slice.1.clone.indvar.dim.2, 1
  store i64 %invar.inc2, i64* %slice.1.clone.invar_address.dim.2
  br label %slice.1.clone.loop_header.dim.2

slice.1.clone.loop_exit.dim.2:                    ; preds = %slice.1.clone.loop_header.dim.2
  %invar.inc1 = add nuw nsw i64 %slice.1.clone.indvar.dim.1, 1
  store i64 %invar.inc1, i64* %slice.1.clone.invar_address.dim.1
  br label %slice.1.clone.loop_header.dim.1

slice.1.clone.loop_exit.dim.1:                    ; preds = %slice.1.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %slice.1.clone.indvar.dim.0, 1
  store i64 %invar.inc, i64* %slice.1.clone.invar_address.dim.0
  br label %slice.1.clone.loop_header.dim.0

slice.1.clone.loop_exit.dim.0:                    ; preds = %slice.1.clone.loop_header.dim.0
  ret void
}

define internal void @parallel_slice.2(i8* align 16 dereferenceable(614400) %retval, i8* noalias %run_options, i8** noalias %params, i8** noalias %temps, i64* noalias %dynamic_loop_bounds, i64* noalias %prof_counters) #0 {
entry:
  %slice.2.clone.invar_address.dim.3 = alloca i64
  %slice.2.clone.invar_address.dim.2 = alloca i64
  %slice.2.clone.invar_address.dim.1 = alloca i64
  %slice.2.clone.invar_address.dim.0 = alloca i64
  %0 = getelementptr inbounds i8** %params, i64 0
  %name.2.untyped = load i8** %0, !dereferenceable !4, !align !2
  %1 = bitcast i8* %name.2.untyped to [5 x [5 x [48 x [256 x float]]]]*
  %slice.2.clone = bitcast i8* %retval to [5 x [5 x [48 x [128 x float]]]]*
  %dynamic_loop_bound_0 = getelementptr i64* %dynamic_loop_bounds, i64 0
  %2 = load i64* %dynamic_loop_bound_0
  %dynamic_loop_bound_1 = getelementptr i64* %dynamic_loop_bounds, i64 1
  %3 = load i64* %dynamic_loop_bound_1
  store i64 %2, i64* %slice.2.clone.invar_address.dim.0
  br label %slice.2.clone.loop_header.dim.0

slice.2.clone.loop_header.dim.0:                  ; preds = %slice.2.clone.loop_exit.dim.1, %entry
  %slice.2.clone.indvar.dim.0 = load i64* %slice.2.clone.invar_address.dim.0
  %4 = icmp uge i64 %slice.2.clone.indvar.dim.0, %3
  br i1 %4, label %slice.2.clone.loop_exit.dim.0, label %slice.2.clone.loop_body.dim.0

slice.2.clone.loop_body.dim.0:                    ; preds = %slice.2.clone.loop_header.dim.0
  store i64 0, i64* %slice.2.clone.invar_address.dim.1
  br label %slice.2.clone.loop_header.dim.1

slice.2.clone.loop_header.dim.1:                  ; preds = %slice.2.clone.loop_exit.dim.2, %slice.2.clone.loop_body.dim.0
  %slice.2.clone.indvar.dim.1 = load i64* %slice.2.clone.invar_address.dim.1
  %5 = icmp uge i64 %slice.2.clone.indvar.dim.1, 5
  br i1 %5, label %slice.2.clone.loop_exit.dim.1, label %slice.2.clone.loop_body.dim.1

slice.2.clone.loop_body.dim.1:                    ; preds = %slice.2.clone.loop_header.dim.1
  store i64 0, i64* %slice.2.clone.invar_address.dim.2
  br label %slice.2.clone.loop_header.dim.2

slice.2.clone.loop_header.dim.2:                  ; preds = %slice.2.clone.loop_exit.dim.3, %slice.2.clone.loop_body.dim.1
  %slice.2.clone.indvar.dim.2 = load i64* %slice.2.clone.invar_address.dim.2
  %6 = icmp uge i64 %slice.2.clone.indvar.dim.2, 48
  br i1 %6, label %slice.2.clone.loop_exit.dim.2, label %slice.2.clone.loop_body.dim.2

slice.2.clone.loop_body.dim.2:                    ; preds = %slice.2.clone.loop_header.dim.2
  store i64 0, i64* %slice.2.clone.invar_address.dim.3
  br label %slice.2.clone.loop_header.dim.3

slice.2.clone.loop_header.dim.3:                  ; preds = %slice.2.clone.loop_body.dim.3, %slice.2.clone.loop_body.dim.2
  %slice.2.clone.indvar.dim.3 = load i64* %slice.2.clone.invar_address.dim.3
  %7 = icmp uge i64 %slice.2.clone.indvar.dim.3, 128
  br i1 %7, label %slice.2.clone.loop_exit.dim.3, label %slice.2.clone.loop_body.dim.3

slice.2.clone.loop_body.dim.3:                    ; preds = %slice.2.clone.loop_header.dim.3
  %8 = add i64 %slice.2.clone.indvar.dim.0, 0
  %9 = add i64 %slice.2.clone.indvar.dim.1, 0
  %10 = add i64 %slice.2.clone.indvar.dim.2, 0
  %11 = add i64 %slice.2.clone.indvar.dim.3, 128
  %12 = getelementptr inbounds [5 x [5 x [48 x [256 x float]]]]* %1, i64 0, i64 %8, i64 %9, i64 %10, i64 %11
  %13 = load float* %12
  %14 = getelementptr inbounds [5 x [5 x [48 x [128 x float]]]]* %slice.2.clone, i64 0, i64 %slice.2.clone.indvar.dim.0, i64 %slice.2.clone.indvar.dim.1, i64 %slice.2.clone.indvar.dim.2, i64 %slice.2.clone.indvar.dim.3
  store float %13, float* %14
  %invar.inc3 = add nuw nsw i64 %slice.2.clone.indvar.dim.3, 1
  store i64 %invar.inc3, i64* %slice.2.clone.invar_address.dim.3
  br label %slice.2.clone.loop_header.dim.3

slice.2.clone.loop_exit.dim.3:                    ; preds = %slice.2.clone.loop_header.dim.3
  %invar.inc2 = add nuw nsw i64 %slice.2.clone.indvar.dim.2, 1
  store i64 %invar.inc2, i64* %slice.2.clone.invar_address.dim.2
  br label %slice.2.clone.loop_header.dim.2

slice.2.clone.loop_exit.dim.2:                    ; preds = %slice.2.clone.loop_header.dim.2
  %invar.inc1 = add nuw nsw i64 %slice.2.clone.indvar.dim.1, 1
  store i64 %invar.inc1, i64* %slice.2.clone.invar_address.dim.1
  br label %slice.2.clone.loop_header.dim.1

slice.2.clone.loop_exit.dim.1:                    ; preds = %slice.2.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %slice.2.clone.indvar.dim.0, 1
  store i64 %invar.inc, i64* %slice.2.clone.invar_address.dim.0
  br label %slice.2.clone.loop_header.dim.0

slice.2.clone.loop_exit.dim.0:                    ; preds = %slice.2.clone.loop_header.dim.0
  ret void
}

define internal void @parallel_reduce-window(i8* align 16 dereferenceable(2495232) %retval, i8* noalias %run_options, i8** noalias %params, i8** noalias %temps, i64* noalias %dynamic_loop_bounds, i64* noalias %prof_counters) #0 {
entry:
  %reducer_function_parameter_addresses = alloca i8*, i32 2
  %reducer_function_return_value_address = alloca float, i64 1, align 4
  %reduce-window.clone.inner.invar_address.window.3 = alloca i64
  %reduce-window.clone.inner.invar_address.window.2 = alloca i64
  %reduce-window.clone.inner.invar_address.window.1 = alloca i64
  %reduce-window.clone.inner.invar_address.window.0 = alloca i64
  %reduce_window_accumulator_address = alloca float, align 4
  %reduce-window.clone.invar_address.dim.3 = alloca i64
  %reduce-window.clone.invar_address.dim.2 = alloca i64
  %reduce-window.clone.invar_address.dim.1 = alloca i64
  %reduce-window.clone.invar_address.dim.0 = alloca i64
  %0 = getelementptr inbounds i8** %params, i64 1
  %name.4.untyped = load i8** %0, !dereferenceable !0, !align !0
  %1 = bitcast i8* %name.4.untyped to float*
  %2 = getelementptr inbounds i8** %params, i64 0
  %name.3.untyped = load i8** %2, !dereferenceable !5, !align !2
  %3 = bitcast i8* %name.3.untyped to [2 x [57 x [57 x [96 x float]]]]*
  %reduce-window.clone = bitcast i8* %retval to [2 x [57 x [57 x [96 x float]]]]*
  %dynamic_loop_bound_0 = getelementptr i64* %dynamic_loop_bounds, i64 0
  %4 = load i64* %dynamic_loop_bound_0
  %dynamic_loop_bound_1 = getelementptr i64* %dynamic_loop_bounds, i64 1
  %5 = load i64* %dynamic_loop_bound_1
  store i64 %4, i64* %reduce-window.clone.invar_address.dim.0
  br label %reduce-window.clone.loop_header.dim.0

reduce-window.clone.loop_header.dim.0:            ; preds = %reduce-window.clone.loop_exit.dim.1, %entry
  %reduce-window.clone.indvar.dim.0 = load i64* %reduce-window.clone.invar_address.dim.0
  %6 = icmp uge i64 %reduce-window.clone.indvar.dim.0, %5
  br i1 %6, label %reduce-window.clone.loop_exit.dim.0, label %reduce-window.clone.loop_body.dim.0

reduce-window.clone.loop_body.dim.0:              ; preds = %reduce-window.clone.loop_header.dim.0
  store i64 0, i64* %reduce-window.clone.invar_address.dim.1
  br label %reduce-window.clone.loop_header.dim.1

reduce-window.clone.loop_header.dim.1:            ; preds = %reduce-window.clone.loop_exit.dim.2, %reduce-window.clone.loop_body.dim.0
  %reduce-window.clone.indvar.dim.1 = load i64* %reduce-window.clone.invar_address.dim.1
  %7 = icmp uge i64 %reduce-window.clone.indvar.dim.1, 57
  br i1 %7, label %reduce-window.clone.loop_exit.dim.1, label %reduce-window.clone.loop_body.dim.1

reduce-window.clone.loop_body.dim.1:              ; preds = %reduce-window.clone.loop_header.dim.1
  store i64 0, i64* %reduce-window.clone.invar_address.dim.2
  br label %reduce-window.clone.loop_header.dim.2

reduce-window.clone.loop_header.dim.2:            ; preds = %reduce-window.clone.loop_exit.dim.3, %reduce-window.clone.loop_body.dim.1
  %reduce-window.clone.indvar.dim.2 = load i64* %reduce-window.clone.invar_address.dim.2
  %8 = icmp uge i64 %reduce-window.clone.indvar.dim.2, 57
  br i1 %8, label %reduce-window.clone.loop_exit.dim.2, label %reduce-window.clone.loop_body.dim.2

reduce-window.clone.loop_body.dim.2:              ; preds = %reduce-window.clone.loop_header.dim.2
  store i64 0, i64* %reduce-window.clone.invar_address.dim.3
  br label %reduce-window.clone.loop_header.dim.3

reduce-window.clone.loop_header.dim.3:            ; preds = %reduce-window.clone.inner.loop_exit.window.0, %reduce-window.clone.loop_body.dim.2
  %reduce-window.clone.indvar.dim.3 = load i64* %reduce-window.clone.invar_address.dim.3
  %9 = icmp uge i64 %reduce-window.clone.indvar.dim.3, 96
  br i1 %9, label %reduce-window.clone.loop_exit.dim.3, label %reduce-window.clone.loop_body.dim.3

reduce-window.clone.loop_body.dim.3:              ; preds = %reduce-window.clone.loop_header.dim.3
  %10 = load float* %1
  store float %10, float* %reduce_window_accumulator_address
  store i64 0, i64* %reduce-window.clone.inner.invar_address.window.0
  br label %reduce-window.clone.inner.loop_header.window.0

reduce-window.clone.inner.loop_header.window.0:   ; preds = %reduce-window.clone.inner.loop_exit.window.1, %reduce-window.clone.loop_body.dim.3
  %reduce-window.clone.inner.indvar.window.0 = load i64* %reduce-window.clone.inner.invar_address.window.0
  %11 = icmp uge i64 %reduce-window.clone.inner.indvar.window.0, 1
  br i1 %11, label %reduce-window.clone.inner.loop_exit.window.0, label %reduce-window.clone.inner.loop_body.window.0

reduce-window.clone.inner.loop_body.window.0:     ; preds = %reduce-window.clone.inner.loop_header.window.0
  store i64 0, i64* %reduce-window.clone.inner.invar_address.window.1
  br label %reduce-window.clone.inner.loop_header.window.1

reduce-window.clone.inner.loop_header.window.1:   ; preds = %reduce-window.clone.inner.loop_exit.window.2, %reduce-window.clone.inner.loop_body.window.0
  %reduce-window.clone.inner.indvar.window.1 = load i64* %reduce-window.clone.inner.invar_address.window.1
  %12 = icmp uge i64 %reduce-window.clone.inner.indvar.window.1, 1
  br i1 %12, label %reduce-window.clone.inner.loop_exit.window.1, label %reduce-window.clone.inner.loop_body.window.1

reduce-window.clone.inner.loop_body.window.1:     ; preds = %reduce-window.clone.inner.loop_header.window.1
  store i64 0, i64* %reduce-window.clone.inner.invar_address.window.2
  br label %reduce-window.clone.inner.loop_header.window.2

reduce-window.clone.inner.loop_header.window.2:   ; preds = %reduce-window.clone.inner.loop_exit.window.3, %reduce-window.clone.inner.loop_body.window.1
  %reduce-window.clone.inner.indvar.window.2 = load i64* %reduce-window.clone.inner.invar_address.window.2
  %13 = icmp uge i64 %reduce-window.clone.inner.indvar.window.2, 1
  br i1 %13, label %reduce-window.clone.inner.loop_exit.window.2, label %reduce-window.clone.inner.loop_body.window.2

reduce-window.clone.inner.loop_body.window.2:     ; preds = %reduce-window.clone.inner.loop_header.window.2
  store i64 0, i64* %reduce-window.clone.inner.invar_address.window.3
  br label %reduce-window.clone.inner.loop_header.window.3

reduce-window.clone.inner.loop_header.window.3:   ; preds = %in-bounds-after, %reduce-window.clone.inner.loop_body.window.2
  %reduce-window.clone.inner.indvar.window.3 = load i64* %reduce-window.clone.inner.invar_address.window.3
  %14 = icmp uge i64 %reduce-window.clone.inner.indvar.window.3, 5
  br i1 %14, label %reduce-window.clone.inner.loop_exit.window.3, label %reduce-window.clone.inner.loop_body.window.3

reduce-window.clone.inner.loop_body.window.3:     ; preds = %reduce-window.clone.inner.loop_header.window.3
  %15 = mul nsw i64 %reduce-window.clone.indvar.dim.0, 1
  %16 = add nsw i64 %15, %reduce-window.clone.inner.indvar.window.0
  %17 = sub nsw i64 %16, 0
  %18 = icmp ult i64 %17, 2
  %19 = mul nsw i64 %reduce-window.clone.indvar.dim.1, 1
  %20 = add nsw i64 %19, %reduce-window.clone.inner.indvar.window.1
  %21 = sub nsw i64 %20, 0
  %22 = icmp ult i64 %21, 57
  %23 = and i1 %18, %22
  %24 = mul nsw i64 %reduce-window.clone.indvar.dim.2, 1
  %25 = add nsw i64 %24, %reduce-window.clone.inner.indvar.window.2
  %26 = sub nsw i64 %25, 0
  %27 = icmp ult i64 %26, 57
  %28 = and i1 %23, %27
  %29 = mul nsw i64 %reduce-window.clone.indvar.dim.3, 1
  %30 = add nsw i64 %29, %reduce-window.clone.inner.indvar.window.3
  %31 = sub nsw i64 %30, 2
  %32 = icmp ult i64 %31, 96
  %33 = and i1 %28, %32
  br i1 %33, label %in-bounds-true, label %in-bounds-false

in-bounds-after:                                  ; preds = %in-bounds-false, %in-bounds-true
  %invar.inc7 = add nuw nsw i64 %reduce-window.clone.inner.indvar.window.3, 1
  store i64 %invar.inc7, i64* %reduce-window.clone.inner.invar_address.window.3
  br label %reduce-window.clone.inner.loop_header.window.3

reduce-window.clone.inner.loop_exit.window.3:     ; preds = %reduce-window.clone.inner.loop_header.window.3
  %invar.inc6 = add nuw nsw i64 %reduce-window.clone.inner.indvar.window.2, 1
  store i64 %invar.inc6, i64* %reduce-window.clone.inner.invar_address.window.2
  br label %reduce-window.clone.inner.loop_header.window.2

reduce-window.clone.inner.loop_exit.window.2:     ; preds = %reduce-window.clone.inner.loop_header.window.2
  %invar.inc5 = add nuw nsw i64 %reduce-window.clone.inner.indvar.window.1, 1
  store i64 %invar.inc5, i64* %reduce-window.clone.inner.invar_address.window.1
  br label %reduce-window.clone.inner.loop_header.window.1

reduce-window.clone.inner.loop_exit.window.1:     ; preds = %reduce-window.clone.inner.loop_header.window.1
  %invar.inc4 = add nuw nsw i64 %reduce-window.clone.inner.indvar.window.0, 1
  store i64 %invar.inc4, i64* %reduce-window.clone.inner.invar_address.window.0
  br label %reduce-window.clone.inner.loop_header.window.0

reduce-window.clone.inner.loop_exit.window.0:     ; preds = %reduce-window.clone.inner.loop_header.window.0
  %34 = load float* %reduce_window_accumulator_address
  %35 = getelementptr inbounds [2 x [57 x [57 x [96 x float]]]]* %reduce-window.clone, i64 0, i64 %reduce-window.clone.indvar.dim.0, i64 %reduce-window.clone.indvar.dim.1, i64 %reduce-window.clone.indvar.dim.2, i64 %reduce-window.clone.indvar.dim.3
  store float %34, float* %35
  %invar.inc3 = add nuw nsw i64 %reduce-window.clone.indvar.dim.3, 1
  store i64 %invar.inc3, i64* %reduce-window.clone.invar_address.dim.3
  br label %reduce-window.clone.loop_header.dim.3

reduce-window.clone.loop_exit.dim.3:              ; preds = %reduce-window.clone.loop_header.dim.3
  %invar.inc2 = add nuw nsw i64 %reduce-window.clone.indvar.dim.2, 1
  store i64 %invar.inc2, i64* %reduce-window.clone.invar_address.dim.2
  br label %reduce-window.clone.loop_header.dim.2

reduce-window.clone.loop_exit.dim.2:              ; preds = %reduce-window.clone.loop_header.dim.2
  %invar.inc1 = add nuw nsw i64 %reduce-window.clone.indvar.dim.1, 1
  store i64 %invar.inc1, i64* %reduce-window.clone.invar_address.dim.1
  br label %reduce-window.clone.loop_header.dim.1

reduce-window.clone.loop_exit.dim.1:              ; preds = %reduce-window.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %reduce-window.clone.indvar.dim.0, 1
  store i64 %invar.inc, i64* %reduce-window.clone.invar_address.dim.0
  br label %reduce-window.clone.loop_header.dim.0

reduce-window.clone.loop_exit.dim.0:              ; preds = %reduce-window.clone.loop_header.dim.0
  ret void

in-bounds-true:                                   ; preds = %reduce-window.clone.inner.loop_body.window.3
  %36 = getelementptr inbounds [2 x [57 x [57 x [96 x float]]]]* %3, i64 0, i64 %17, i64 %21, i64 %26, i64 %31
  %reducer_function_parameter_0_address_as_i8ptr = bitcast float* %reduce_window_accumulator_address to i8*
  %37 = getelementptr inbounds i8** %reducer_function_parameter_addresses, i64 0
  store i8* %reducer_function_parameter_0_address_as_i8ptr, i8** %37
  %reducer_function_parameter_1_address_as_i8ptr = bitcast float* %36 to i8*
  %38 = getelementptr inbounds i8** %reducer_function_parameter_addresses, i64 1
  store i8* %reducer_function_parameter_1_address_as_i8ptr, i8** %38
  %39 = bitcast float* %reducer_function_return_value_address to i8*
  call void @add_float_.v3(i8* %39, i8* %run_options, i8** %reducer_function_parameter_addresses, i8** %temps, i64* %prof_counters)
  %reducer_function_return_value = load float* %reducer_function_return_value_address
  store float %reducer_function_return_value, float* %reduce_window_accumulator_address
  br label %in-bounds-after

in-bounds-false:                                  ; preds = %reduce-window.clone.inner.loop_body.window.3
  br label %in-bounds-after
}

define internal void @parallel_reduce-window.1(i8* align 16 dereferenceable(602112) %retval, i8* noalias %run_options, i8** noalias %params, i8** noalias %temps, i64* noalias %dynamic_loop_bounds, i64* noalias %prof_counters) #0 {
entry:
  %reducer_function_parameter_addresses = alloca i8*, i32 2
  %reducer_function_return_value_address = alloca float, i64 1, align 4
  %reduce-window.1.clone.inner.invar_address.window.3 = alloca i64
  %reduce-window.1.clone.inner.invar_address.window.2 = alloca i64
  %reduce-window.1.clone.inner.invar_address.window.1 = alloca i64
  %reduce-window.1.clone.inner.invar_address.window.0 = alloca i64
  %reduce_window_accumulator_address = alloca float, align 4
  %reduce-window.1.clone.invar_address.dim.3 = alloca i64
  %reduce-window.1.clone.invar_address.dim.2 = alloca i64
  %reduce-window.1.clone.invar_address.dim.1 = alloca i64
  %reduce-window.1.clone.invar_address.dim.0 = alloca i64
  %0 = getelementptr inbounds i8** %params, i64 1
  %name.6.untyped = load i8** %0, !dereferenceable !0, !align !0
  %1 = bitcast i8* %name.6.untyped to float*
  %2 = getelementptr inbounds i8** %params, i64 0
  %name.5.untyped = load i8** %2, !dereferenceable !5, !align !2
  %3 = bitcast i8* %name.5.untyped to [2 x [57 x [57 x [96 x float]]]]*
  %reduce-window.1.clone = bitcast i8* %retval to [2 x [28 x [28 x [96 x float]]]]*
  %dynamic_loop_bound_0 = getelementptr i64* %dynamic_loop_bounds, i64 0
  %4 = load i64* %dynamic_loop_bound_0
  %dynamic_loop_bound_1 = getelementptr i64* %dynamic_loop_bounds, i64 1
  %5 = load i64* %dynamic_loop_bound_1
  store i64 %4, i64* %reduce-window.1.clone.invar_address.dim.0
  br label %reduce-window.1.clone.loop_header.dim.0

reduce-window.1.clone.loop_header.dim.0:          ; preds = %reduce-window.1.clone.loop_exit.dim.1, %entry
  %reduce-window.1.clone.indvar.dim.0 = load i64* %reduce-window.1.clone.invar_address.dim.0
  %6 = icmp uge i64 %reduce-window.1.clone.indvar.dim.0, %5
  br i1 %6, label %reduce-window.1.clone.loop_exit.dim.0, label %reduce-window.1.clone.loop_body.dim.0

reduce-window.1.clone.loop_body.dim.0:            ; preds = %reduce-window.1.clone.loop_header.dim.0
  store i64 0, i64* %reduce-window.1.clone.invar_address.dim.1
  br label %reduce-window.1.clone.loop_header.dim.1

reduce-window.1.clone.loop_header.dim.1:          ; preds = %reduce-window.1.clone.loop_exit.dim.2, %reduce-window.1.clone.loop_body.dim.0
  %reduce-window.1.clone.indvar.dim.1 = load i64* %reduce-window.1.clone.invar_address.dim.1
  %7 = icmp uge i64 %reduce-window.1.clone.indvar.dim.1, 28
  br i1 %7, label %reduce-window.1.clone.loop_exit.dim.1, label %reduce-window.1.clone.loop_body.dim.1

reduce-window.1.clone.loop_body.dim.1:            ; preds = %reduce-window.1.clone.loop_header.dim.1
  store i64 0, i64* %reduce-window.1.clone.invar_address.dim.2
  br label %reduce-window.1.clone.loop_header.dim.2

reduce-window.1.clone.loop_header.dim.2:          ; preds = %reduce-window.1.clone.loop_exit.dim.3, %reduce-window.1.clone.loop_body.dim.1
  %reduce-window.1.clone.indvar.dim.2 = load i64* %reduce-window.1.clone.invar_address.dim.2
  %8 = icmp uge i64 %reduce-window.1.clone.indvar.dim.2, 28
  br i1 %8, label %reduce-window.1.clone.loop_exit.dim.2, label %reduce-window.1.clone.loop_body.dim.2

reduce-window.1.clone.loop_body.dim.2:            ; preds = %reduce-window.1.clone.loop_header.dim.2
  store i64 0, i64* %reduce-window.1.clone.invar_address.dim.3
  br label %reduce-window.1.clone.loop_header.dim.3

reduce-window.1.clone.loop_header.dim.3:          ; preds = %reduce-window.1.clone.inner.loop_exit.window.0, %reduce-window.1.clone.loop_body.dim.2
  %reduce-window.1.clone.indvar.dim.3 = load i64* %reduce-window.1.clone.invar_address.dim.3
  %9 = icmp uge i64 %reduce-window.1.clone.indvar.dim.3, 96
  br i1 %9, label %reduce-window.1.clone.loop_exit.dim.3, label %reduce-window.1.clone.loop_body.dim.3

reduce-window.1.clone.loop_body.dim.3:            ; preds = %reduce-window.1.clone.loop_header.dim.3
  %10 = load float* %1
  store float %10, float* %reduce_window_accumulator_address
  store i64 0, i64* %reduce-window.1.clone.inner.invar_address.window.0
  br label %reduce-window.1.clone.inner.loop_header.window.0

reduce-window.1.clone.inner.loop_header.window.0: ; preds = %reduce-window.1.clone.inner.loop_exit.window.1, %reduce-window.1.clone.loop_body.dim.3
  %reduce-window.1.clone.inner.indvar.window.0 = load i64* %reduce-window.1.clone.inner.invar_address.window.0
  %11 = icmp uge i64 %reduce-window.1.clone.inner.indvar.window.0, 1
  br i1 %11, label %reduce-window.1.clone.inner.loop_exit.window.0, label %reduce-window.1.clone.inner.loop_body.window.0

reduce-window.1.clone.inner.loop_body.window.0:   ; preds = %reduce-window.1.clone.inner.loop_header.window.0
  store i64 0, i64* %reduce-window.1.clone.inner.invar_address.window.1
  br label %reduce-window.1.clone.inner.loop_header.window.1

reduce-window.1.clone.inner.loop_header.window.1: ; preds = %reduce-window.1.clone.inner.loop_exit.window.2, %reduce-window.1.clone.inner.loop_body.window.0
  %reduce-window.1.clone.inner.indvar.window.1 = load i64* %reduce-window.1.clone.inner.invar_address.window.1
  %12 = icmp uge i64 %reduce-window.1.clone.inner.indvar.window.1, 3
  br i1 %12, label %reduce-window.1.clone.inner.loop_exit.window.1, label %reduce-window.1.clone.inner.loop_body.window.1

reduce-window.1.clone.inner.loop_body.window.1:   ; preds = %reduce-window.1.clone.inner.loop_header.window.1
  store i64 0, i64* %reduce-window.1.clone.inner.invar_address.window.2
  br label %reduce-window.1.clone.inner.loop_header.window.2

reduce-window.1.clone.inner.loop_header.window.2: ; preds = %reduce-window.1.clone.inner.loop_exit.window.3, %reduce-window.1.clone.inner.loop_body.window.1
  %reduce-window.1.clone.inner.indvar.window.2 = load i64* %reduce-window.1.clone.inner.invar_address.window.2
  %13 = icmp uge i64 %reduce-window.1.clone.inner.indvar.window.2, 3
  br i1 %13, label %reduce-window.1.clone.inner.loop_exit.window.2, label %reduce-window.1.clone.inner.loop_body.window.2

reduce-window.1.clone.inner.loop_body.window.2:   ; preds = %reduce-window.1.clone.inner.loop_header.window.2
  store i64 0, i64* %reduce-window.1.clone.inner.invar_address.window.3
  br label %reduce-window.1.clone.inner.loop_header.window.3

reduce-window.1.clone.inner.loop_header.window.3: ; preds = %in-bounds-after, %reduce-window.1.clone.inner.loop_body.window.2
  %reduce-window.1.clone.inner.indvar.window.3 = load i64* %reduce-window.1.clone.inner.invar_address.window.3
  %14 = icmp uge i64 %reduce-window.1.clone.inner.indvar.window.3, 1
  br i1 %14, label %reduce-window.1.clone.inner.loop_exit.window.3, label %reduce-window.1.clone.inner.loop_body.window.3

reduce-window.1.clone.inner.loop_body.window.3:   ; preds = %reduce-window.1.clone.inner.loop_header.window.3
  %15 = mul nsw i64 %reduce-window.1.clone.indvar.dim.0, 1
  %16 = add nsw i64 %15, %reduce-window.1.clone.inner.indvar.window.0
  %17 = sub nsw i64 %16, 0
  %18 = icmp ult i64 %17, 2
  %19 = mul nsw i64 %reduce-window.1.clone.indvar.dim.1, 2
  %20 = add nsw i64 %19, %reduce-window.1.clone.inner.indvar.window.1
  %21 = sub nsw i64 %20, 0
  %22 = icmp ult i64 %21, 57
  %23 = and i1 %18, %22
  %24 = mul nsw i64 %reduce-window.1.clone.indvar.dim.2, 2
  %25 = add nsw i64 %24, %reduce-window.1.clone.inner.indvar.window.2
  %26 = sub nsw i64 %25, 0
  %27 = icmp ult i64 %26, 57
  %28 = and i1 %23, %27
  %29 = mul nsw i64 %reduce-window.1.clone.indvar.dim.3, 1
  %30 = add nsw i64 %29, %reduce-window.1.clone.inner.indvar.window.3
  %31 = sub nsw i64 %30, 0
  %32 = icmp ult i64 %31, 96
  %33 = and i1 %28, %32
  br i1 %33, label %in-bounds-true, label %in-bounds-false

in-bounds-after:                                  ; preds = %in-bounds-false, %in-bounds-true
  %invar.inc7 = add nuw nsw i64 %reduce-window.1.clone.inner.indvar.window.3, 1
  store i64 %invar.inc7, i64* %reduce-window.1.clone.inner.invar_address.window.3
  br label %reduce-window.1.clone.inner.loop_header.window.3

reduce-window.1.clone.inner.loop_exit.window.3:   ; preds = %reduce-window.1.clone.inner.loop_header.window.3
  %invar.inc6 = add nuw nsw i64 %reduce-window.1.clone.inner.indvar.window.2, 1
  store i64 %invar.inc6, i64* %reduce-window.1.clone.inner.invar_address.window.2
  br label %reduce-window.1.clone.inner.loop_header.window.2

reduce-window.1.clone.inner.loop_exit.window.2:   ; preds = %reduce-window.1.clone.inner.loop_header.window.2
  %invar.inc5 = add nuw nsw i64 %reduce-window.1.clone.inner.indvar.window.1, 1
  store i64 %invar.inc5, i64* %reduce-window.1.clone.inner.invar_address.window.1
  br label %reduce-window.1.clone.inner.loop_header.window.1

reduce-window.1.clone.inner.loop_exit.window.1:   ; preds = %reduce-window.1.clone.inner.loop_header.window.1
  %invar.inc4 = add nuw nsw i64 %reduce-window.1.clone.inner.indvar.window.0, 1
  store i64 %invar.inc4, i64* %reduce-window.1.clone.inner.invar_address.window.0
  br label %reduce-window.1.clone.inner.loop_header.window.0

reduce-window.1.clone.inner.loop_exit.window.0:   ; preds = %reduce-window.1.clone.inner.loop_header.window.0
  %34 = load float* %reduce_window_accumulator_address
  %35 = getelementptr inbounds [2 x [28 x [28 x [96 x float]]]]* %reduce-window.1.clone, i64 0, i64 %reduce-window.1.clone.indvar.dim.0, i64 %reduce-window.1.clone.indvar.dim.1, i64 %reduce-window.1.clone.indvar.dim.2, i64 %reduce-window.1.clone.indvar.dim.3
  store float %34, float* %35
  %invar.inc3 = add nuw nsw i64 %reduce-window.1.clone.indvar.dim.3, 1
  store i64 %invar.inc3, i64* %reduce-window.1.clone.invar_address.dim.3
  br label %reduce-window.1.clone.loop_header.dim.3

reduce-window.1.clone.loop_exit.dim.3:            ; preds = %reduce-window.1.clone.loop_header.dim.3
  %invar.inc2 = add nuw nsw i64 %reduce-window.1.clone.indvar.dim.2, 1
  store i64 %invar.inc2, i64* %reduce-window.1.clone.invar_address.dim.2
  br label %reduce-window.1.clone.loop_header.dim.2

reduce-window.1.clone.loop_exit.dim.2:            ; preds = %reduce-window.1.clone.loop_header.dim.2
  %invar.inc1 = add nuw nsw i64 %reduce-window.1.clone.indvar.dim.1, 1
  store i64 %invar.inc1, i64* %reduce-window.1.clone.invar_address.dim.1
  br label %reduce-window.1.clone.loop_header.dim.1

reduce-window.1.clone.loop_exit.dim.1:            ; preds = %reduce-window.1.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %reduce-window.1.clone.indvar.dim.0, 1
  store i64 %invar.inc, i64* %reduce-window.1.clone.invar_address.dim.0
  br label %reduce-window.1.clone.loop_header.dim.0

reduce-window.1.clone.loop_exit.dim.0:            ; preds = %reduce-window.1.clone.loop_header.dim.0
  ret void

in-bounds-true:                                   ; preds = %reduce-window.1.clone.inner.loop_body.window.3
  %36 = getelementptr inbounds [2 x [57 x [57 x [96 x float]]]]* %3, i64 0, i64 %17, i64 %21, i64 %26, i64 %31
  %reducer_function_parameter_0_address_as_i8ptr = bitcast float* %reduce_window_accumulator_address to i8*
  %37 = getelementptr inbounds i8** %reducer_function_parameter_addresses, i64 0
  store i8* %reducer_function_parameter_0_address_as_i8ptr, i8** %37
  %reducer_function_parameter_1_address_as_i8ptr = bitcast float* %36 to i8*
  %38 = getelementptr inbounds i8** %reducer_function_parameter_addresses, i64 1
  store i8* %reducer_function_parameter_1_address_as_i8ptr, i8** %38
  %39 = bitcast float* %reducer_function_return_value_address to i8*
  call void @max_float_.v3(i8* %39, i8* %run_options, i8** %reducer_function_parameter_addresses, i8** %temps, i64* %prof_counters)
  %reducer_function_return_value = load float* %reducer_function_return_value_address
  store float %reducer_function_return_value, float* %reduce_window_accumulator_address
  br label %in-bounds-after

in-bounds-false:                                  ; preds = %reduce-window.1.clone.inner.loop_body.window.3
  br label %in-bounds-after
}

define internal void @parallel_slice.4(i8* align 16 dereferenceable(614400) %retval, i8* noalias %run_options, i8** noalias %params, i8** noalias %temps, i64* noalias %dynamic_loop_bounds, i64* noalias %prof_counters) #0 {
entry:
  %slice.4.clone.invar_address.dim.3 = alloca i64
  %slice.4.clone.invar_address.dim.2 = alloca i64
  %slice.4.clone.invar_address.dim.1 = alloca i64
  %slice.4.clone.invar_address.dim.0 = alloca i64
  %0 = getelementptr inbounds i8** %params, i64 0
  %name.7.untyped = load i8** %0, !dereferenceable !4, !align !2
  %1 = bitcast i8* %name.7.untyped to [5 x [5 x [48 x [256 x float]]]]*
  %slice.4.clone = bitcast i8* %retval to [5 x [5 x [48 x [128 x float]]]]*
  %dynamic_loop_bound_0 = getelementptr i64* %dynamic_loop_bounds, i64 0
  %2 = load i64* %dynamic_loop_bound_0
  %dynamic_loop_bound_1 = getelementptr i64* %dynamic_loop_bounds, i64 1
  %3 = load i64* %dynamic_loop_bound_1
  store i64 %2, i64* %slice.4.clone.invar_address.dim.0
  br label %slice.4.clone.loop_header.dim.0

slice.4.clone.loop_header.dim.0:                  ; preds = %slice.4.clone.loop_exit.dim.1, %entry
  %slice.4.clone.indvar.dim.0 = load i64* %slice.4.clone.invar_address.dim.0
  %4 = icmp uge i64 %slice.4.clone.indvar.dim.0, %3
  br i1 %4, label %slice.4.clone.loop_exit.dim.0, label %slice.4.clone.loop_body.dim.0

slice.4.clone.loop_body.dim.0:                    ; preds = %slice.4.clone.loop_header.dim.0
  store i64 0, i64* %slice.4.clone.invar_address.dim.1
  br label %slice.4.clone.loop_header.dim.1

slice.4.clone.loop_header.dim.1:                  ; preds = %slice.4.clone.loop_exit.dim.2, %slice.4.clone.loop_body.dim.0
  %slice.4.clone.indvar.dim.1 = load i64* %slice.4.clone.invar_address.dim.1
  %5 = icmp uge i64 %slice.4.clone.indvar.dim.1, 5
  br i1 %5, label %slice.4.clone.loop_exit.dim.1, label %slice.4.clone.loop_body.dim.1

slice.4.clone.loop_body.dim.1:                    ; preds = %slice.4.clone.loop_header.dim.1
  store i64 0, i64* %slice.4.clone.invar_address.dim.2
  br label %slice.4.clone.loop_header.dim.2

slice.4.clone.loop_header.dim.2:                  ; preds = %slice.4.clone.loop_exit.dim.3, %slice.4.clone.loop_body.dim.1
  %slice.4.clone.indvar.dim.2 = load i64* %slice.4.clone.invar_address.dim.2
  %6 = icmp uge i64 %slice.4.clone.indvar.dim.2, 48
  br i1 %6, label %slice.4.clone.loop_exit.dim.2, label %slice.4.clone.loop_body.dim.2

slice.4.clone.loop_body.dim.2:                    ; preds = %slice.4.clone.loop_header.dim.2
  store i64 0, i64* %slice.4.clone.invar_address.dim.3
  br label %slice.4.clone.loop_header.dim.3

slice.4.clone.loop_header.dim.3:                  ; preds = %slice.4.clone.loop_body.dim.3, %slice.4.clone.loop_body.dim.2
  %slice.4.clone.indvar.dim.3 = load i64* %slice.4.clone.invar_address.dim.3
  %7 = icmp uge i64 %slice.4.clone.indvar.dim.3, 128
  br i1 %7, label %slice.4.clone.loop_exit.dim.3, label %slice.4.clone.loop_body.dim.3

slice.4.clone.loop_body.dim.3:                    ; preds = %slice.4.clone.loop_header.dim.3
  %8 = add i64 %slice.4.clone.indvar.dim.0, 0
  %9 = add i64 %slice.4.clone.indvar.dim.1, 0
  %10 = add i64 %slice.4.clone.indvar.dim.2, 0
  %11 = add i64 %slice.4.clone.indvar.dim.3, 0
  %12 = getelementptr inbounds [5 x [5 x [48 x [256 x float]]]]* %1, i64 0, i64 %8, i64 %9, i64 %10, i64 %11
  %13 = load float* %12
  %14 = getelementptr inbounds [5 x [5 x [48 x [128 x float]]]]* %slice.4.clone, i64 0, i64 %slice.4.clone.indvar.dim.0, i64 %slice.4.clone.indvar.dim.1, i64 %slice.4.clone.indvar.dim.2, i64 %slice.4.clone.indvar.dim.3
  store float %13, float* %14
  %invar.inc3 = add nuw nsw i64 %slice.4.clone.indvar.dim.3, 1
  store i64 %invar.inc3, i64* %slice.4.clone.invar_address.dim.3
  br label %slice.4.clone.loop_header.dim.3

slice.4.clone.loop_exit.dim.3:                    ; preds = %slice.4.clone.loop_header.dim.3
  %invar.inc2 = add nuw nsw i64 %slice.4.clone.indvar.dim.2, 1
  store i64 %invar.inc2, i64* %slice.4.clone.invar_address.dim.2
  br label %slice.4.clone.loop_header.dim.2

slice.4.clone.loop_exit.dim.2:                    ; preds = %slice.4.clone.loop_header.dim.2
  %invar.inc1 = add nuw nsw i64 %slice.4.clone.indvar.dim.1, 1
  store i64 %invar.inc1, i64* %slice.4.clone.invar_address.dim.1
  br label %slice.4.clone.loop_header.dim.1

slice.4.clone.loop_exit.dim.1:                    ; preds = %slice.4.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %slice.4.clone.indvar.dim.0, 1
  store i64 %invar.inc, i64* %slice.4.clone.invar_address.dim.0
  br label %slice.4.clone.loop_header.dim.0

slice.4.clone.loop_exit.dim.0:                    ; preds = %slice.4.clone.loop_header.dim.0
  ret void
}

define internal void @parallel_reduce-window.2(i8* align 16 dereferenceable(1605632) %retval, i8* noalias %run_options, i8** noalias %params, i8** noalias %temps, i64* noalias %dynamic_loop_bounds, i64* noalias %prof_counters) #0 {
entry:
  %reducer_function_parameter_addresses = alloca i8*, i32 2
  %reducer_function_return_value_address = alloca float, i64 1, align 4
  %reduce-window.2.clone.inner.invar_address.window.3 = alloca i64
  %reduce-window.2.clone.inner.invar_address.window.2 = alloca i64
  %reduce-window.2.clone.inner.invar_address.window.1 = alloca i64
  %reduce-window.2.clone.inner.invar_address.window.0 = alloca i64
  %reduce_window_accumulator_address = alloca float, align 4
  %reduce-window.2.clone.invar_address.dim.3 = alloca i64
  %reduce-window.2.clone.invar_address.dim.2 = alloca i64
  %reduce-window.2.clone.invar_address.dim.1 = alloca i64
  %reduce-window.2.clone.invar_address.dim.0 = alloca i64
  %0 = getelementptr inbounds i8** %params, i64 1
  %name.9.untyped = load i8** %0, !dereferenceable !0, !align !0
  %1 = bitcast i8* %name.9.untyped to float*
  %2 = getelementptr inbounds i8** %params, i64 0
  %name.8.untyped = load i8** %2, !dereferenceable !6, !align !2
  %3 = bitcast i8* %name.8.untyped to [2 x [28 x [28 x [256 x float]]]]*
  %reduce-window.2.clone = bitcast i8* %retval to [2 x [28 x [28 x [256 x float]]]]*
  %dynamic_loop_bound_0 = getelementptr i64* %dynamic_loop_bounds, i64 0
  %4 = load i64* %dynamic_loop_bound_0
  %dynamic_loop_bound_1 = getelementptr i64* %dynamic_loop_bounds, i64 1
  %5 = load i64* %dynamic_loop_bound_1
  store i64 %4, i64* %reduce-window.2.clone.invar_address.dim.0
  br label %reduce-window.2.clone.loop_header.dim.0

reduce-window.2.clone.loop_header.dim.0:          ; preds = %reduce-window.2.clone.loop_exit.dim.1, %entry
  %reduce-window.2.clone.indvar.dim.0 = load i64* %reduce-window.2.clone.invar_address.dim.0
  %6 = icmp uge i64 %reduce-window.2.clone.indvar.dim.0, %5
  br i1 %6, label %reduce-window.2.clone.loop_exit.dim.0, label %reduce-window.2.clone.loop_body.dim.0

reduce-window.2.clone.loop_body.dim.0:            ; preds = %reduce-window.2.clone.loop_header.dim.0
  store i64 0, i64* %reduce-window.2.clone.invar_address.dim.1
  br label %reduce-window.2.clone.loop_header.dim.1

reduce-window.2.clone.loop_header.dim.1:          ; preds = %reduce-window.2.clone.loop_exit.dim.2, %reduce-window.2.clone.loop_body.dim.0
  %reduce-window.2.clone.indvar.dim.1 = load i64* %reduce-window.2.clone.invar_address.dim.1
  %7 = icmp uge i64 %reduce-window.2.clone.indvar.dim.1, 28
  br i1 %7, label %reduce-window.2.clone.loop_exit.dim.1, label %reduce-window.2.clone.loop_body.dim.1

reduce-window.2.clone.loop_body.dim.1:            ; preds = %reduce-window.2.clone.loop_header.dim.1
  store i64 0, i64* %reduce-window.2.clone.invar_address.dim.2
  br label %reduce-window.2.clone.loop_header.dim.2

reduce-window.2.clone.loop_header.dim.2:          ; preds = %reduce-window.2.clone.loop_exit.dim.3, %reduce-window.2.clone.loop_body.dim.1
  %reduce-window.2.clone.indvar.dim.2 = load i64* %reduce-window.2.clone.invar_address.dim.2
  %8 = icmp uge i64 %reduce-window.2.clone.indvar.dim.2, 28
  br i1 %8, label %reduce-window.2.clone.loop_exit.dim.2, label %reduce-window.2.clone.loop_body.dim.2

reduce-window.2.clone.loop_body.dim.2:            ; preds = %reduce-window.2.clone.loop_header.dim.2
  store i64 0, i64* %reduce-window.2.clone.invar_address.dim.3
  br label %reduce-window.2.clone.loop_header.dim.3

reduce-window.2.clone.loop_header.dim.3:          ; preds = %reduce-window.2.clone.inner.loop_exit.window.0, %reduce-window.2.clone.loop_body.dim.2
  %reduce-window.2.clone.indvar.dim.3 = load i64* %reduce-window.2.clone.invar_address.dim.3
  %9 = icmp uge i64 %reduce-window.2.clone.indvar.dim.3, 256
  br i1 %9, label %reduce-window.2.clone.loop_exit.dim.3, label %reduce-window.2.clone.loop_body.dim.3

reduce-window.2.clone.loop_body.dim.3:            ; preds = %reduce-window.2.clone.loop_header.dim.3
  %10 = load float* %1
  store float %10, float* %reduce_window_accumulator_address
  store i64 0, i64* %reduce-window.2.clone.inner.invar_address.window.0
  br label %reduce-window.2.clone.inner.loop_header.window.0

reduce-window.2.clone.inner.loop_header.window.0: ; preds = %reduce-window.2.clone.inner.loop_exit.window.1, %reduce-window.2.clone.loop_body.dim.3
  %reduce-window.2.clone.inner.indvar.window.0 = load i64* %reduce-window.2.clone.inner.invar_address.window.0
  %11 = icmp uge i64 %reduce-window.2.clone.inner.indvar.window.0, 1
  br i1 %11, label %reduce-window.2.clone.inner.loop_exit.window.0, label %reduce-window.2.clone.inner.loop_body.window.0

reduce-window.2.clone.inner.loop_body.window.0:   ; preds = %reduce-window.2.clone.inner.loop_header.window.0
  store i64 0, i64* %reduce-window.2.clone.inner.invar_address.window.1
  br label %reduce-window.2.clone.inner.loop_header.window.1

reduce-window.2.clone.inner.loop_header.window.1: ; preds = %reduce-window.2.clone.inner.loop_exit.window.2, %reduce-window.2.clone.inner.loop_body.window.0
  %reduce-window.2.clone.inner.indvar.window.1 = load i64* %reduce-window.2.clone.inner.invar_address.window.1
  %12 = icmp uge i64 %reduce-window.2.clone.inner.indvar.window.1, 1
  br i1 %12, label %reduce-window.2.clone.inner.loop_exit.window.1, label %reduce-window.2.clone.inner.loop_body.window.1

reduce-window.2.clone.inner.loop_body.window.1:   ; preds = %reduce-window.2.clone.inner.loop_header.window.1
  store i64 0, i64* %reduce-window.2.clone.inner.invar_address.window.2
  br label %reduce-window.2.clone.inner.loop_header.window.2

reduce-window.2.clone.inner.loop_header.window.2: ; preds = %reduce-window.2.clone.inner.loop_exit.window.3, %reduce-window.2.clone.inner.loop_body.window.1
  %reduce-window.2.clone.inner.indvar.window.2 = load i64* %reduce-window.2.clone.inner.invar_address.window.2
  %13 = icmp uge i64 %reduce-window.2.clone.inner.indvar.window.2, 1
  br i1 %13, label %reduce-window.2.clone.inner.loop_exit.window.2, label %reduce-window.2.clone.inner.loop_body.window.2

reduce-window.2.clone.inner.loop_body.window.2:   ; preds = %reduce-window.2.clone.inner.loop_header.window.2
  store i64 0, i64* %reduce-window.2.clone.inner.invar_address.window.3
  br label %reduce-window.2.clone.inner.loop_header.window.3

reduce-window.2.clone.inner.loop_header.window.3: ; preds = %in-bounds-after, %reduce-window.2.clone.inner.loop_body.window.2
  %reduce-window.2.clone.inner.indvar.window.3 = load i64* %reduce-window.2.clone.inner.invar_address.window.3
  %14 = icmp uge i64 %reduce-window.2.clone.inner.indvar.window.3, 5
  br i1 %14, label %reduce-window.2.clone.inner.loop_exit.window.3, label %reduce-window.2.clone.inner.loop_body.window.3

reduce-window.2.clone.inner.loop_body.window.3:   ; preds = %reduce-window.2.clone.inner.loop_header.window.3
  %15 = mul nsw i64 %reduce-window.2.clone.indvar.dim.0, 1
  %16 = add nsw i64 %15, %reduce-window.2.clone.inner.indvar.window.0
  %17 = sub nsw i64 %16, 0
  %18 = icmp ult i64 %17, 2
  %19 = mul nsw i64 %reduce-window.2.clone.indvar.dim.1, 1
  %20 = add nsw i64 %19, %reduce-window.2.clone.inner.indvar.window.1
  %21 = sub nsw i64 %20, 0
  %22 = icmp ult i64 %21, 28
  %23 = and i1 %18, %22
  %24 = mul nsw i64 %reduce-window.2.clone.indvar.dim.2, 1
  %25 = add nsw i64 %24, %reduce-window.2.clone.inner.indvar.window.2
  %26 = sub nsw i64 %25, 0
  %27 = icmp ult i64 %26, 28
  %28 = and i1 %23, %27
  %29 = mul nsw i64 %reduce-window.2.clone.indvar.dim.3, 1
  %30 = add nsw i64 %29, %reduce-window.2.clone.inner.indvar.window.3
  %31 = sub nsw i64 %30, 2
  %32 = icmp ult i64 %31, 256
  %33 = and i1 %28, %32
  br i1 %33, label %in-bounds-true, label %in-bounds-false

in-bounds-after:                                  ; preds = %in-bounds-false, %in-bounds-true
  %invar.inc7 = add nuw nsw i64 %reduce-window.2.clone.inner.indvar.window.3, 1
  store i64 %invar.inc7, i64* %reduce-window.2.clone.inner.invar_address.window.3
  br label %reduce-window.2.clone.inner.loop_header.window.3

reduce-window.2.clone.inner.loop_exit.window.3:   ; preds = %reduce-window.2.clone.inner.loop_header.window.3
  %invar.inc6 = add nuw nsw i64 %reduce-window.2.clone.inner.indvar.window.2, 1
  store i64 %invar.inc6, i64* %reduce-window.2.clone.inner.invar_address.window.2
  br label %reduce-window.2.clone.inner.loop_header.window.2

reduce-window.2.clone.inner.loop_exit.window.2:   ; preds = %reduce-window.2.clone.inner.loop_header.window.2
  %invar.inc5 = add nuw nsw i64 %reduce-window.2.clone.inner.indvar.window.1, 1
  store i64 %invar.inc5, i64* %reduce-window.2.clone.inner.invar_address.window.1
  br label %reduce-window.2.clone.inner.loop_header.window.1

reduce-window.2.clone.inner.loop_exit.window.1:   ; preds = %reduce-window.2.clone.inner.loop_header.window.1
  %invar.inc4 = add nuw nsw i64 %reduce-window.2.clone.inner.indvar.window.0, 1
  store i64 %invar.inc4, i64* %reduce-window.2.clone.inner.invar_address.window.0
  br label %reduce-window.2.clone.inner.loop_header.window.0

reduce-window.2.clone.inner.loop_exit.window.0:   ; preds = %reduce-window.2.clone.inner.loop_header.window.0
  %34 = load float* %reduce_window_accumulator_address
  %35 = getelementptr inbounds [2 x [28 x [28 x [256 x float]]]]* %reduce-window.2.clone, i64 0, i64 %reduce-window.2.clone.indvar.dim.0, i64 %reduce-window.2.clone.indvar.dim.1, i64 %reduce-window.2.clone.indvar.dim.2, i64 %reduce-window.2.clone.indvar.dim.3
  store float %34, float* %35
  %invar.inc3 = add nuw nsw i64 %reduce-window.2.clone.indvar.dim.3, 1
  store i64 %invar.inc3, i64* %reduce-window.2.clone.invar_address.dim.3
  br label %reduce-window.2.clone.loop_header.dim.3

reduce-window.2.clone.loop_exit.dim.3:            ; preds = %reduce-window.2.clone.loop_header.dim.3
  %invar.inc2 = add nuw nsw i64 %reduce-window.2.clone.indvar.dim.2, 1
  store i64 %invar.inc2, i64* %reduce-window.2.clone.invar_address.dim.2
  br label %reduce-window.2.clone.loop_header.dim.2

reduce-window.2.clone.loop_exit.dim.2:            ; preds = %reduce-window.2.clone.loop_header.dim.2
  %invar.inc1 = add nuw nsw i64 %reduce-window.2.clone.indvar.dim.1, 1
  store i64 %invar.inc1, i64* %reduce-window.2.clone.invar_address.dim.1
  br label %reduce-window.2.clone.loop_header.dim.1

reduce-window.2.clone.loop_exit.dim.1:            ; preds = %reduce-window.2.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %reduce-window.2.clone.indvar.dim.0, 1
  store i64 %invar.inc, i64* %reduce-window.2.clone.invar_address.dim.0
  br label %reduce-window.2.clone.loop_header.dim.0

reduce-window.2.clone.loop_exit.dim.0:            ; preds = %reduce-window.2.clone.loop_header.dim.0
  ret void

in-bounds-true:                                   ; preds = %reduce-window.2.clone.inner.loop_body.window.3
  %36 = getelementptr inbounds [2 x [28 x [28 x [256 x float]]]]* %3, i64 0, i64 %17, i64 %21, i64 %26, i64 %31
  %reducer_function_parameter_0_address_as_i8ptr = bitcast float* %reduce_window_accumulator_address to i8*
  %37 = getelementptr inbounds i8** %reducer_function_parameter_addresses, i64 0
  store i8* %reducer_function_parameter_0_address_as_i8ptr, i8** %37
  %reducer_function_parameter_1_address_as_i8ptr = bitcast float* %36 to i8*
  %38 = getelementptr inbounds i8** %reducer_function_parameter_addresses, i64 1
  store i8* %reducer_function_parameter_1_address_as_i8ptr, i8** %38
  %39 = bitcast float* %reducer_function_return_value_address to i8*
  call void @add_float_.v3(i8* %39, i8* %run_options, i8** %reducer_function_parameter_addresses, i8** %temps, i64* %prof_counters)
  %reducer_function_return_value = load float* %reducer_function_return_value_address
  store float %reducer_function_return_value, float* %reduce_window_accumulator_address
  br label %in-bounds-after

in-bounds-false:                                  ; preds = %reduce-window.2.clone.inner.loop_body.window.3
  br label %in-bounds-after
}

define internal void @parallel_slice.7(i8* align 16 dereferenceable(1327104) %retval, i8* noalias %run_options, i8** noalias %params, i8** noalias %temps, i64* noalias %dynamic_loop_bounds, i64* noalias %prof_counters) #0 {
entry:
  %slice.7.clone.invar_address.dim.3 = alloca i64
  %slice.7.clone.invar_address.dim.2 = alloca i64
  %slice.7.clone.invar_address.dim.1 = alloca i64
  %slice.7.clone.invar_address.dim.0 = alloca i64
  %0 = getelementptr inbounds i8** %params, i64 0
  %name.10.untyped = load i8** %0, !dereferenceable !3, !align !2
  %1 = bitcast i8* %name.10.untyped to [3 x [3 x [192 x [384 x float]]]]*
  %slice.7.clone = bitcast i8* %retval to [3 x [3 x [192 x [192 x float]]]]*
  %dynamic_loop_bound_0 = getelementptr i64* %dynamic_loop_bounds, i64 0
  %2 = load i64* %dynamic_loop_bound_0
  %dynamic_loop_bound_1 = getelementptr i64* %dynamic_loop_bounds, i64 1
  %3 = load i64* %dynamic_loop_bound_1
  store i64 %2, i64* %slice.7.clone.invar_address.dim.0
  br label %slice.7.clone.loop_header.dim.0

slice.7.clone.loop_header.dim.0:                  ; preds = %slice.7.clone.loop_exit.dim.1, %entry
  %slice.7.clone.indvar.dim.0 = load i64* %slice.7.clone.invar_address.dim.0
  %4 = icmp uge i64 %slice.7.clone.indvar.dim.0, %3
  br i1 %4, label %slice.7.clone.loop_exit.dim.0, label %slice.7.clone.loop_body.dim.0

slice.7.clone.loop_body.dim.0:                    ; preds = %slice.7.clone.loop_header.dim.0
  store i64 0, i64* %slice.7.clone.invar_address.dim.1
  br label %slice.7.clone.loop_header.dim.1

slice.7.clone.loop_header.dim.1:                  ; preds = %slice.7.clone.loop_exit.dim.2, %slice.7.clone.loop_body.dim.0
  %slice.7.clone.indvar.dim.1 = load i64* %slice.7.clone.invar_address.dim.1
  %5 = icmp uge i64 %slice.7.clone.indvar.dim.1, 3
  br i1 %5, label %slice.7.clone.loop_exit.dim.1, label %slice.7.clone.loop_body.dim.1

slice.7.clone.loop_body.dim.1:                    ; preds = %slice.7.clone.loop_header.dim.1
  store i64 0, i64* %slice.7.clone.invar_address.dim.2
  br label %slice.7.clone.loop_header.dim.2

slice.7.clone.loop_header.dim.2:                  ; preds = %slice.7.clone.loop_exit.dim.3, %slice.7.clone.loop_body.dim.1
  %slice.7.clone.indvar.dim.2 = load i64* %slice.7.clone.invar_address.dim.2
  %6 = icmp uge i64 %slice.7.clone.indvar.dim.2, 192
  br i1 %6, label %slice.7.clone.loop_exit.dim.2, label %slice.7.clone.loop_body.dim.2

slice.7.clone.loop_body.dim.2:                    ; preds = %slice.7.clone.loop_header.dim.2
  store i64 0, i64* %slice.7.clone.invar_address.dim.3
  br label %slice.7.clone.loop_header.dim.3

slice.7.clone.loop_header.dim.3:                  ; preds = %slice.7.clone.loop_body.dim.3, %slice.7.clone.loop_body.dim.2
  %slice.7.clone.indvar.dim.3 = load i64* %slice.7.clone.invar_address.dim.3
  %7 = icmp uge i64 %slice.7.clone.indvar.dim.3, 192
  br i1 %7, label %slice.7.clone.loop_exit.dim.3, label %slice.7.clone.loop_body.dim.3

slice.7.clone.loop_body.dim.3:                    ; preds = %slice.7.clone.loop_header.dim.3
  %8 = add i64 %slice.7.clone.indvar.dim.0, 0
  %9 = add i64 %slice.7.clone.indvar.dim.1, 0
  %10 = add i64 %slice.7.clone.indvar.dim.2, 0
  %11 = add i64 %slice.7.clone.indvar.dim.3, 0
  %12 = getelementptr inbounds [3 x [3 x [192 x [384 x float]]]]* %1, i64 0, i64 %8, i64 %9, i64 %10, i64 %11
  %13 = load float* %12
  %14 = getelementptr inbounds [3 x [3 x [192 x [192 x float]]]]* %slice.7.clone, i64 0, i64 %slice.7.clone.indvar.dim.0, i64 %slice.7.clone.indvar.dim.1, i64 %slice.7.clone.indvar.dim.2, i64 %slice.7.clone.indvar.dim.3
  store float %13, float* %14
  %invar.inc3 = add nuw nsw i64 %slice.7.clone.indvar.dim.3, 1
  store i64 %invar.inc3, i64* %slice.7.clone.invar_address.dim.3
  br label %slice.7.clone.loop_header.dim.3

slice.7.clone.loop_exit.dim.3:                    ; preds = %slice.7.clone.loop_header.dim.3
  %invar.inc2 = add nuw nsw i64 %slice.7.clone.indvar.dim.2, 1
  store i64 %invar.inc2, i64* %slice.7.clone.invar_address.dim.2
  br label %slice.7.clone.loop_header.dim.2

slice.7.clone.loop_exit.dim.2:                    ; preds = %slice.7.clone.loop_header.dim.2
  %invar.inc1 = add nuw nsw i64 %slice.7.clone.indvar.dim.1, 1
  store i64 %invar.inc1, i64* %slice.7.clone.invar_address.dim.1
  br label %slice.7.clone.loop_header.dim.1

slice.7.clone.loop_exit.dim.1:                    ; preds = %slice.7.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %slice.7.clone.indvar.dim.0, 1
  store i64 %invar.inc, i64* %slice.7.clone.invar_address.dim.0
  br label %slice.7.clone.loop_header.dim.0

slice.7.clone.loop_exit.dim.0:                    ; preds = %slice.7.clone.loop_header.dim.0
  ret void
}

define internal void @parallel_slice.10(i8* align 16 dereferenceable(884736) %retval, i8* noalias %run_options, i8** noalias %params, i8** noalias %temps, i64* noalias %dynamic_loop_bounds, i64* noalias %prof_counters) #0 {
entry:
  %slice.10.clone.invar_address.dim.3 = alloca i64
  %slice.10.clone.invar_address.dim.2 = alloca i64
  %slice.10.clone.invar_address.dim.1 = alloca i64
  %slice.10.clone.invar_address.dim.0 = alloca i64
  %0 = getelementptr inbounds i8** %params, i64 0
  %name.11.untyped = load i8** %0, !dereferenceable !1, !align !2
  %1 = bitcast i8* %name.11.untyped to [3 x [3 x [192 x [256 x float]]]]*
  %slice.10.clone = bitcast i8* %retval to [3 x [3 x [192 x [128 x float]]]]*
  %dynamic_loop_bound_0 = getelementptr i64* %dynamic_loop_bounds, i64 0
  %2 = load i64* %dynamic_loop_bound_0
  %dynamic_loop_bound_1 = getelementptr i64* %dynamic_loop_bounds, i64 1
  %3 = load i64* %dynamic_loop_bound_1
  store i64 %2, i64* %slice.10.clone.invar_address.dim.0
  br label %slice.10.clone.loop_header.dim.0

slice.10.clone.loop_header.dim.0:                 ; preds = %slice.10.clone.loop_exit.dim.1, %entry
  %slice.10.clone.indvar.dim.0 = load i64* %slice.10.clone.invar_address.dim.0
  %4 = icmp uge i64 %slice.10.clone.indvar.dim.0, %3
  br i1 %4, label %slice.10.clone.loop_exit.dim.0, label %slice.10.clone.loop_body.dim.0

slice.10.clone.loop_body.dim.0:                   ; preds = %slice.10.clone.loop_header.dim.0
  store i64 0, i64* %slice.10.clone.invar_address.dim.1
  br label %slice.10.clone.loop_header.dim.1

slice.10.clone.loop_header.dim.1:                 ; preds = %slice.10.clone.loop_exit.dim.2, %slice.10.clone.loop_body.dim.0
  %slice.10.clone.indvar.dim.1 = load i64* %slice.10.clone.invar_address.dim.1
  %5 = icmp uge i64 %slice.10.clone.indvar.dim.1, 3
  br i1 %5, label %slice.10.clone.loop_exit.dim.1, label %slice.10.clone.loop_body.dim.1

slice.10.clone.loop_body.dim.1:                   ; preds = %slice.10.clone.loop_header.dim.1
  store i64 0, i64* %slice.10.clone.invar_address.dim.2
  br label %slice.10.clone.loop_header.dim.2

slice.10.clone.loop_header.dim.2:                 ; preds = %slice.10.clone.loop_exit.dim.3, %slice.10.clone.loop_body.dim.1
  %slice.10.clone.indvar.dim.2 = load i64* %slice.10.clone.invar_address.dim.2
  %6 = icmp uge i64 %slice.10.clone.indvar.dim.2, 192
  br i1 %6, label %slice.10.clone.loop_exit.dim.2, label %slice.10.clone.loop_body.dim.2

slice.10.clone.loop_body.dim.2:                   ; preds = %slice.10.clone.loop_header.dim.2
  store i64 0, i64* %slice.10.clone.invar_address.dim.3
  br label %slice.10.clone.loop_header.dim.3

slice.10.clone.loop_header.dim.3:                 ; preds = %slice.10.clone.loop_body.dim.3, %slice.10.clone.loop_body.dim.2
  %slice.10.clone.indvar.dim.3 = load i64* %slice.10.clone.invar_address.dim.3
  %7 = icmp uge i64 %slice.10.clone.indvar.dim.3, 128
  br i1 %7, label %slice.10.clone.loop_exit.dim.3, label %slice.10.clone.loop_body.dim.3

slice.10.clone.loop_body.dim.3:                   ; preds = %slice.10.clone.loop_header.dim.3
  %8 = add i64 %slice.10.clone.indvar.dim.0, 0
  %9 = add i64 %slice.10.clone.indvar.dim.1, 0
  %10 = add i64 %slice.10.clone.indvar.dim.2, 0
  %11 = add i64 %slice.10.clone.indvar.dim.3, 0
  %12 = getelementptr inbounds [3 x [3 x [192 x [256 x float]]]]* %1, i64 0, i64 %8, i64 %9, i64 %10, i64 %11
  %13 = load float* %12
  %14 = getelementptr inbounds [3 x [3 x [192 x [128 x float]]]]* %slice.10.clone, i64 0, i64 %slice.10.clone.indvar.dim.0, i64 %slice.10.clone.indvar.dim.1, i64 %slice.10.clone.indvar.dim.2, i64 %slice.10.clone.indvar.dim.3
  store float %13, float* %14
  %invar.inc3 = add nuw nsw i64 %slice.10.clone.indvar.dim.3, 1
  store i64 %invar.inc3, i64* %slice.10.clone.invar_address.dim.3
  br label %slice.10.clone.loop_header.dim.3

slice.10.clone.loop_exit.dim.3:                   ; preds = %slice.10.clone.loop_header.dim.3
  %invar.inc2 = add nuw nsw i64 %slice.10.clone.indvar.dim.2, 1
  store i64 %invar.inc2, i64* %slice.10.clone.invar_address.dim.2
  br label %slice.10.clone.loop_header.dim.2

slice.10.clone.loop_exit.dim.2:                   ; preds = %slice.10.clone.loop_header.dim.2
  %invar.inc1 = add nuw nsw i64 %slice.10.clone.indvar.dim.1, 1
  store i64 %invar.inc1, i64* %slice.10.clone.invar_address.dim.1
  br label %slice.10.clone.loop_header.dim.1

slice.10.clone.loop_exit.dim.1:                   ; preds = %slice.10.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %slice.10.clone.indvar.dim.0, 1
  store i64 %invar.inc, i64* %slice.10.clone.invar_address.dim.0
  br label %slice.10.clone.loop_header.dim.0

slice.10.clone.loop_exit.dim.0:                   ; preds = %slice.10.clone.loop_header.dim.0
  ret void
}

define internal void @parallel_fusion.10(i8* align 16 dereferenceable(1605632) %retval, i8* noalias %run_options, i8** noalias %params, i8** noalias %temps, i64* noalias %dynamic_loop_bounds, i64* noalias %prof_counters) #0 {
entry:
  %fusion.10.clone.invar_address.dim.3 = alloca i64
  %fusion.10.clone.invar_address.dim.2 = alloca i64
  %fusion.10.clone.invar_address.dim.1 = alloca i64
  %fusion.10.clone.invar_address.dim.0 = alloca i64
  %0 = getelementptr inbounds i8** %params, i64 7
  %name.19.untyped = load i8** %0, !dereferenceable !0, !align !0
  %1 = bitcast i8* %name.19.untyped to float*
  %2 = getelementptr inbounds i8** %params, i64 6
  %name.18.untyped = load i8** %2, !dereferenceable !7, !align !2
  %3 = bitcast i8* %name.18.untyped to [2 x [28 x [28 x [128 x float]]]]*
  %4 = getelementptr inbounds i8** %params, i64 5
  %name.17.untyped = load i8** %4, !dereferenceable !7, !align !2
  %5 = bitcast i8* %name.17.untyped to [2 x [28 x [28 x [128 x float]]]]*
  %6 = getelementptr inbounds i8** %params, i64 4
  %name.16.untyped = load i8** %6, !dereferenceable !8, !align !2
  %7 = bitcast i8* %name.16.untyped to [256 x float]*
  %8 = getelementptr inbounds i8** %params, i64 3
  %name.15.untyped = load i8** %8, !dereferenceable !0, !align !0
  %9 = bitcast i8* %name.15.untyped to float*
  %10 = getelementptr inbounds i8** %params, i64 2
  %name.14.untyped = load i8** %10, !dereferenceable !0, !align !0
  %11 = bitcast i8* %name.14.untyped to float*
  %12 = getelementptr inbounds i8** %params, i64 1
  %name.13.untyped = load i8** %12, !dereferenceable !6, !align !2
  %13 = bitcast i8* %name.13.untyped to [2 x [28 x [28 x [256 x float]]]]*
  %14 = getelementptr inbounds i8** %params, i64 0
  %name.12.untyped = load i8** %14, !dereferenceable !0, !align !0
  %15 = bitcast i8* %name.12.untyped to float*
  %fusion.10.clone = bitcast i8* %retval to [2 x [28 x [28 x [256 x float]]]]*
  %dynamic_loop_bound_0 = getelementptr i64* %dynamic_loop_bounds, i64 0
  %16 = load i64* %dynamic_loop_bound_0
  %dynamic_loop_bound_1 = getelementptr i64* %dynamic_loop_bounds, i64 1
  %17 = load i64* %dynamic_loop_bound_1
  store i64 %16, i64* %fusion.10.clone.invar_address.dim.0
  br label %fusion.10.clone.loop_header.dim.0

fusion.10.clone.loop_header.dim.0:                ; preds = %fusion.10.clone.loop_exit.dim.1, %entry
  %fusion.10.clone.indvar.dim.0 = load i64* %fusion.10.clone.invar_address.dim.0
  %18 = icmp uge i64 %fusion.10.clone.indvar.dim.0, %17
  br i1 %18, label %fusion.10.clone.loop_exit.dim.0, label %fusion.10.clone.loop_body.dim.0

fusion.10.clone.loop_body.dim.0:                  ; preds = %fusion.10.clone.loop_header.dim.0
  store i64 0, i64* %fusion.10.clone.invar_address.dim.1
  br label %fusion.10.clone.loop_header.dim.1

fusion.10.clone.loop_header.dim.1:                ; preds = %fusion.10.clone.loop_exit.dim.2, %fusion.10.clone.loop_body.dim.0
  %fusion.10.clone.indvar.dim.1 = load i64* %fusion.10.clone.invar_address.dim.1
  %19 = icmp uge i64 %fusion.10.clone.indvar.dim.1, 28
  br i1 %19, label %fusion.10.clone.loop_exit.dim.1, label %fusion.10.clone.loop_body.dim.1

fusion.10.clone.loop_body.dim.1:                  ; preds = %fusion.10.clone.loop_header.dim.1
  store i64 0, i64* %fusion.10.clone.invar_address.dim.2
  br label %fusion.10.clone.loop_header.dim.2

fusion.10.clone.loop_header.dim.2:                ; preds = %fusion.10.clone.loop_exit.dim.3, %fusion.10.clone.loop_body.dim.1
  %fusion.10.clone.indvar.dim.2 = load i64* %fusion.10.clone.invar_address.dim.2
  %20 = icmp uge i64 %fusion.10.clone.indvar.dim.2, 28
  br i1 %20, label %fusion.10.clone.loop_exit.dim.2, label %fusion.10.clone.loop_body.dim.2

fusion.10.clone.loop_body.dim.2:                  ; preds = %fusion.10.clone.loop_header.dim.2
  store i64 0, i64* %fusion.10.clone.invar_address.dim.3
  br label %fusion.10.clone.loop_header.dim.3

fusion.10.clone.loop_header.dim.3:                ; preds = %concatenate.8.merge, %fusion.10.clone.loop_body.dim.2
  %fusion.10.clone.indvar.dim.3 = load i64* %fusion.10.clone.invar_address.dim.3
  %21 = icmp uge i64 %fusion.10.clone.indvar.dim.3, 256
  br i1 %21, label %fusion.10.clone.loop_exit.dim.3, label %fusion.10.clone.loop_body.dim.3

fusion.10.clone.loop_body.dim.3:                  ; preds = %fusion.10.clone.loop_header.dim.3
  %22 = load float* %1
  %23 = icmp ult i64 %fusion.10.clone.indvar.dim.3, 128
  br i1 %23, label %concat_index_from_operand0, label %concat_index_not_from_operand0

concat_index_from_operand0:                       ; preds = %fusion.10.clone.loop_body.dim.3
  %24 = getelementptr inbounds [2 x [28 x [28 x [128 x float]]]]* %5, i64 0, i64 %fusion.10.clone.indvar.dim.0, i64 %fusion.10.clone.indvar.dim.1, i64 %fusion.10.clone.indvar.dim.2, i64 %fusion.10.clone.indvar.dim.3
  %25 = load float* %24
  br label %concatenate.8.merge

concat_index_not_from_operand0:                   ; preds = %fusion.10.clone.loop_body.dim.3
  %26 = sub i64 %fusion.10.clone.indvar.dim.3, 128
  %27 = icmp ult i64 %26, 128
  br i1 %27, label %concat_index_from_operand1, label %concat_index_not_from_operand1

concat_index_from_operand1:                       ; preds = %concat_index_not_from_operand0
  %28 = getelementptr inbounds [2 x [28 x [28 x [128 x float]]]]* %3, i64 0, i64 %fusion.10.clone.indvar.dim.0, i64 %fusion.10.clone.indvar.dim.1, i64 %fusion.10.clone.indvar.dim.2, i64 %26
  %29 = load float* %28
  br label %concatenate.8.merge

concat_index_not_from_operand1:                   ; preds = %concat_index_not_from_operand0
  %30 = sub i64 %26, 128
  unreachable

concatenate.8.merge:                              ; preds = %concat_index_from_operand1, %concat_index_from_operand0
  %31 = phi float [ %25, %concat_index_from_operand0 ], [ %29, %concat_index_from_operand1 ]
  %32 = getelementptr inbounds [256 x float]* %7, i64 0, i64 %fusion.10.clone.indvar.dim.3
  %33 = load float* %32
  %34 = fadd float %31, %33
  %35 = fcmp oge float %22, %34
  %36 = fcmp une float %22, %22
  %37 = or i1 %35, %36
  %38 = select i1 %37, float %22, float %34
  %39 = load float* %9
  %40 = load float* %11
  %41 = getelementptr inbounds [2 x [28 x [28 x [256 x float]]]]* %13, i64 0, i64 %fusion.10.clone.indvar.dim.0, i64 %fusion.10.clone.indvar.dim.1, i64 %fusion.10.clone.indvar.dim.2, i64 %fusion.10.clone.indvar.dim.3
  %42 = load float* %41
  %43 = fmul float %40, %42
  %44 = fadd float %39, %43
  %45 = load float* %15
  %46 = call float @llvm.pow.f32(float %44, float %45)
  %47 = fmul float %38, %46
  %48 = getelementptr inbounds [2 x [28 x [28 x [256 x float]]]]* %fusion.10.clone, i64 0, i64 %fusion.10.clone.indvar.dim.0, i64 %fusion.10.clone.indvar.dim.1, i64 %fusion.10.clone.indvar.dim.2, i64 %fusion.10.clone.indvar.dim.3
  store float %47, float* %48
  %invar.inc3 = add nuw nsw i64 %fusion.10.clone.indvar.dim.3, 1
  store i64 %invar.inc3, i64* %fusion.10.clone.invar_address.dim.3
  br label %fusion.10.clone.loop_header.dim.3

fusion.10.clone.loop_exit.dim.3:                  ; preds = %fusion.10.clone.loop_header.dim.3
  %invar.inc2 = add nuw nsw i64 %fusion.10.clone.indvar.dim.2, 1
  store i64 %invar.inc2, i64* %fusion.10.clone.invar_address.dim.2
  br label %fusion.10.clone.loop_header.dim.2

fusion.10.clone.loop_exit.dim.2:                  ; preds = %fusion.10.clone.loop_header.dim.2
  %invar.inc1 = add nuw nsw i64 %fusion.10.clone.indvar.dim.1, 1
  store i64 %invar.inc1, i64* %fusion.10.clone.invar_address.dim.1
  br label %fusion.10.clone.loop_header.dim.1

fusion.10.clone.loop_exit.dim.1:                  ; preds = %fusion.10.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %fusion.10.clone.indvar.dim.0, 1
  store i64 %invar.inc, i64* %fusion.10.clone.invar_address.dim.0
  br label %fusion.10.clone.loop_header.dim.0

fusion.10.clone.loop_exit.dim.0:                  ; preds = %fusion.10.clone.loop_header.dim.0
  ret void
}

; Function Attrs: nounwind readnone speculatable
declare float @llvm.pow.f32(float, float) #1

define internal void @parallel_fusion.11(i8* align 16 dereferenceable(1605632) %retval, i8* noalias %run_options, i8** noalias %params, i8** noalias %temps, i64* noalias %dynamic_loop_bounds, i64* noalias %prof_counters) #0 {
entry:
  %fusion.11.clone.invar_address.dim.3 = alloca i64
  %fusion.11.clone.invar_address.dim.2 = alloca i64
  %fusion.11.clone.invar_address.dim.1 = alloca i64
  %fusion.11.clone.invar_address.dim.0 = alloca i64
  %0 = getelementptr inbounds i8** %params, i64 3
  %name.23.untyped = load i8** %0, !dereferenceable !0, !align !0
  %1 = bitcast i8* %name.23.untyped to float*
  %2 = getelementptr inbounds i8** %params, i64 2
  %name.22.untyped = load i8** %2, !dereferenceable !7, !align !2
  %3 = bitcast i8* %name.22.untyped to [2 x [28 x [28 x [128 x float]]]]*
  %4 = getelementptr inbounds i8** %params, i64 1
  %name.21.untyped = load i8** %4, !dereferenceable !7, !align !2
  %5 = bitcast i8* %name.21.untyped to [2 x [28 x [28 x [128 x float]]]]*
  %6 = getelementptr inbounds i8** %params, i64 0
  %name.20.untyped = load i8** %6, !dereferenceable !8, !align !2
  %7 = bitcast i8* %name.20.untyped to [256 x float]*
  %fusion.11.clone = bitcast i8* %retval to [2 x [28 x [28 x [256 x float]]]]*
  %dynamic_loop_bound_0 = getelementptr i64* %dynamic_loop_bounds, i64 0
  %8 = load i64* %dynamic_loop_bound_0
  %dynamic_loop_bound_1 = getelementptr i64* %dynamic_loop_bounds, i64 1
  %9 = load i64* %dynamic_loop_bound_1
  store i64 %8, i64* %fusion.11.clone.invar_address.dim.0
  br label %fusion.11.clone.loop_header.dim.0

fusion.11.clone.loop_header.dim.0:                ; preds = %fusion.11.clone.loop_exit.dim.1, %entry
  %fusion.11.clone.indvar.dim.0 = load i64* %fusion.11.clone.invar_address.dim.0
  %10 = icmp uge i64 %fusion.11.clone.indvar.dim.0, %9
  br i1 %10, label %fusion.11.clone.loop_exit.dim.0, label %fusion.11.clone.loop_body.dim.0

fusion.11.clone.loop_body.dim.0:                  ; preds = %fusion.11.clone.loop_header.dim.0
  store i64 0, i64* %fusion.11.clone.invar_address.dim.1
  br label %fusion.11.clone.loop_header.dim.1

fusion.11.clone.loop_header.dim.1:                ; preds = %fusion.11.clone.loop_exit.dim.2, %fusion.11.clone.loop_body.dim.0
  %fusion.11.clone.indvar.dim.1 = load i64* %fusion.11.clone.invar_address.dim.1
  %11 = icmp uge i64 %fusion.11.clone.indvar.dim.1, 28
  br i1 %11, label %fusion.11.clone.loop_exit.dim.1, label %fusion.11.clone.loop_body.dim.1

fusion.11.clone.loop_body.dim.1:                  ; preds = %fusion.11.clone.loop_header.dim.1
  store i64 0, i64* %fusion.11.clone.invar_address.dim.2
  br label %fusion.11.clone.loop_header.dim.2

fusion.11.clone.loop_header.dim.2:                ; preds = %fusion.11.clone.loop_exit.dim.3, %fusion.11.clone.loop_body.dim.1
  %fusion.11.clone.indvar.dim.2 = load i64* %fusion.11.clone.invar_address.dim.2
  %12 = icmp uge i64 %fusion.11.clone.indvar.dim.2, 28
  br i1 %12, label %fusion.11.clone.loop_exit.dim.2, label %fusion.11.clone.loop_body.dim.2

fusion.11.clone.loop_body.dim.2:                  ; preds = %fusion.11.clone.loop_header.dim.2
  store i64 0, i64* %fusion.11.clone.invar_address.dim.3
  br label %fusion.11.clone.loop_header.dim.3

fusion.11.clone.loop_header.dim.3:                ; preds = %concatenate.9.merge, %fusion.11.clone.loop_body.dim.2
  %fusion.11.clone.indvar.dim.3 = load i64* %fusion.11.clone.invar_address.dim.3
  %13 = icmp uge i64 %fusion.11.clone.indvar.dim.3, 256
  br i1 %13, label %fusion.11.clone.loop_exit.dim.3, label %fusion.11.clone.loop_body.dim.3

fusion.11.clone.loop_body.dim.3:                  ; preds = %fusion.11.clone.loop_header.dim.3
  %14 = load float* %1
  %15 = icmp ult i64 %fusion.11.clone.indvar.dim.3, 128
  br i1 %15, label %concat_index_from_operand0, label %concat_index_not_from_operand0

concat_index_from_operand0:                       ; preds = %fusion.11.clone.loop_body.dim.3
  %16 = getelementptr inbounds [2 x [28 x [28 x [128 x float]]]]* %5, i64 0, i64 %fusion.11.clone.indvar.dim.0, i64 %fusion.11.clone.indvar.dim.1, i64 %fusion.11.clone.indvar.dim.2, i64 %fusion.11.clone.indvar.dim.3
  %17 = load float* %16
  br label %concatenate.9.merge

concat_index_not_from_operand0:                   ; preds = %fusion.11.clone.loop_body.dim.3
  %18 = sub i64 %fusion.11.clone.indvar.dim.3, 128
  %19 = icmp ult i64 %18, 128
  br i1 %19, label %concat_index_from_operand1, label %concat_index_not_from_operand1

concat_index_from_operand1:                       ; preds = %concat_index_not_from_operand0
  %20 = getelementptr inbounds [2 x [28 x [28 x [128 x float]]]]* %3, i64 0, i64 %fusion.11.clone.indvar.dim.0, i64 %fusion.11.clone.indvar.dim.1, i64 %fusion.11.clone.indvar.dim.2, i64 %18
  %21 = load float* %20
  br label %concatenate.9.merge

concat_index_not_from_operand1:                   ; preds = %concat_index_not_from_operand0
  %22 = sub i64 %18, 128
  unreachable

concatenate.9.merge:                              ; preds = %concat_index_from_operand1, %concat_index_from_operand0
  %23 = phi float [ %17, %concat_index_from_operand0 ], [ %21, %concat_index_from_operand1 ]
  %24 = getelementptr inbounds [256 x float]* %7, i64 0, i64 %fusion.11.clone.indvar.dim.3
  %25 = load float* %24
  %26 = fadd float %23, %25
  %27 = fcmp oge float %14, %26
  %28 = fcmp une float %14, %14
  %29 = or i1 %27, %28
  %30 = select i1 %29, float %14, float %26
  %31 = fmul float %30, %30
  %32 = getelementptr inbounds [2 x [28 x [28 x [256 x float]]]]* %fusion.11.clone, i64 0, i64 %fusion.11.clone.indvar.dim.0, i64 %fusion.11.clone.indvar.dim.1, i64 %fusion.11.clone.indvar.dim.2, i64 %fusion.11.clone.indvar.dim.3
  store float %31, float* %32
  %invar.inc3 = add nuw nsw i64 %fusion.11.clone.indvar.dim.3, 1
  store i64 %invar.inc3, i64* %fusion.11.clone.invar_address.dim.3
  br label %fusion.11.clone.loop_header.dim.3

fusion.11.clone.loop_exit.dim.3:                  ; preds = %fusion.11.clone.loop_header.dim.3
  %invar.inc2 = add nuw nsw i64 %fusion.11.clone.indvar.dim.2, 1
  store i64 %invar.inc2, i64* %fusion.11.clone.invar_address.dim.2
  br label %fusion.11.clone.loop_header.dim.2

fusion.11.clone.loop_exit.dim.2:                  ; preds = %fusion.11.clone.loop_header.dim.2
  %invar.inc1 = add nuw nsw i64 %fusion.11.clone.indvar.dim.1, 1
  store i64 %invar.inc1, i64* %fusion.11.clone.invar_address.dim.1
  br label %fusion.11.clone.loop_header.dim.1

fusion.11.clone.loop_exit.dim.1:                  ; preds = %fusion.11.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %fusion.11.clone.indvar.dim.0, 1
  store i64 %invar.inc, i64* %fusion.11.clone.invar_address.dim.0
  br label %fusion.11.clone.loop_header.dim.0

fusion.11.clone.loop_exit.dim.0:                  ; preds = %fusion.11.clone.loop_header.dim.0
  ret void
}

define internal void @parallel_fusion.12(i8* align 16 dereferenceable(2495232) %retval, i8* noalias %run_options, i8** noalias %params, i8** noalias %temps, i64* noalias %dynamic_loop_bounds, i64* noalias %prof_counters) #0 {
entry:
  %fusion.12.clone.invar_address.dim.3 = alloca i64
  %fusion.12.clone.invar_address.dim.2 = alloca i64
  %fusion.12.clone.invar_address.dim.1 = alloca i64
  %fusion.12.clone.invar_address.dim.0 = alloca i64
  %0 = getelementptr inbounds i8** %params, i64 6
  %name.30.untyped = load i8** %0, !dereferenceable !0, !align !0
  %1 = bitcast i8* %name.30.untyped to float*
  %2 = getelementptr inbounds i8** %params, i64 5
  %name.29.untyped = load i8** %2, !dereferenceable !9, !align !10
  %3 = bitcast i8* %name.29.untyped to [96 x float]*
  %4 = getelementptr inbounds i8** %params, i64 4
  %name.28.untyped = load i8** %4, !dereferenceable !5, !align !2
  %5 = bitcast i8* %name.28.untyped to [2 x [57 x [57 x [96 x float]]]]*
  %6 = getelementptr inbounds i8** %params, i64 3
  %name.27.untyped = load i8** %6, !dereferenceable !0, !align !0
  %7 = bitcast i8* %name.27.untyped to float*
  %8 = getelementptr inbounds i8** %params, i64 2
  %name.26.untyped = load i8** %8, !dereferenceable !0, !align !0
  %9 = bitcast i8* %name.26.untyped to float*
  %10 = getelementptr inbounds i8** %params, i64 1
  %name.25.untyped = load i8** %10, !dereferenceable !5, !align !2
  %11 = bitcast i8* %name.25.untyped to [2 x [57 x [57 x [96 x float]]]]*
  %12 = getelementptr inbounds i8** %params, i64 0
  %name.24.untyped = load i8** %12, !dereferenceable !0, !align !0
  %13 = bitcast i8* %name.24.untyped to float*
  %fusion.12.clone = bitcast i8* %retval to [2 x [57 x [57 x [96 x float]]]]*
  %dynamic_loop_bound_0 = getelementptr i64* %dynamic_loop_bounds, i64 0
  %14 = load i64* %dynamic_loop_bound_0
  %dynamic_loop_bound_1 = getelementptr i64* %dynamic_loop_bounds, i64 1
  %15 = load i64* %dynamic_loop_bound_1
  store i64 %14, i64* %fusion.12.clone.invar_address.dim.0
  br label %fusion.12.clone.loop_header.dim.0

fusion.12.clone.loop_header.dim.0:                ; preds = %fusion.12.clone.loop_exit.dim.1, %entry
  %fusion.12.clone.indvar.dim.0 = load i64* %fusion.12.clone.invar_address.dim.0
  %16 = icmp uge i64 %fusion.12.clone.indvar.dim.0, %15
  br i1 %16, label %fusion.12.clone.loop_exit.dim.0, label %fusion.12.clone.loop_body.dim.0

fusion.12.clone.loop_body.dim.0:                  ; preds = %fusion.12.clone.loop_header.dim.0
  store i64 0, i64* %fusion.12.clone.invar_address.dim.1
  br label %fusion.12.clone.loop_header.dim.1

fusion.12.clone.loop_header.dim.1:                ; preds = %fusion.12.clone.loop_exit.dim.2, %fusion.12.clone.loop_body.dim.0
  %fusion.12.clone.indvar.dim.1 = load i64* %fusion.12.clone.invar_address.dim.1
  %17 = icmp uge i64 %fusion.12.clone.indvar.dim.1, 57
  br i1 %17, label %fusion.12.clone.loop_exit.dim.1, label %fusion.12.clone.loop_body.dim.1

fusion.12.clone.loop_body.dim.1:                  ; preds = %fusion.12.clone.loop_header.dim.1
  store i64 0, i64* %fusion.12.clone.invar_address.dim.2
  br label %fusion.12.clone.loop_header.dim.2

fusion.12.clone.loop_header.dim.2:                ; preds = %fusion.12.clone.loop_exit.dim.3, %fusion.12.clone.loop_body.dim.1
  %fusion.12.clone.indvar.dim.2 = load i64* %fusion.12.clone.invar_address.dim.2
  %18 = icmp uge i64 %fusion.12.clone.indvar.dim.2, 57
  br i1 %18, label %fusion.12.clone.loop_exit.dim.2, label %fusion.12.clone.loop_body.dim.2

fusion.12.clone.loop_body.dim.2:                  ; preds = %fusion.12.clone.loop_header.dim.2
  store i64 0, i64* %fusion.12.clone.invar_address.dim.3
  br label %fusion.12.clone.loop_header.dim.3

fusion.12.clone.loop_header.dim.3:                ; preds = %fusion.12.clone.loop_body.dim.3, %fusion.12.clone.loop_body.dim.2
  %fusion.12.clone.indvar.dim.3 = load i64* %fusion.12.clone.invar_address.dim.3
  %19 = icmp uge i64 %fusion.12.clone.indvar.dim.3, 96
  br i1 %19, label %fusion.12.clone.loop_exit.dim.3, label %fusion.12.clone.loop_body.dim.3

fusion.12.clone.loop_body.dim.3:                  ; preds = %fusion.12.clone.loop_header.dim.3
  %20 = load float* %1
  %21 = getelementptr inbounds [2 x [57 x [57 x [96 x float]]]]* %5, i64 0, i64 %fusion.12.clone.indvar.dim.0, i64 %fusion.12.clone.indvar.dim.1, i64 %fusion.12.clone.indvar.dim.2, i64 %fusion.12.clone.indvar.dim.3
  %22 = load float* %21
  %23 = getelementptr inbounds [96 x float]* %3, i64 0, i64 %fusion.12.clone.indvar.dim.3
  %24 = load float* %23
  %25 = fadd float %22, %24
  %26 = fcmp oge float %20, %25
  %27 = fcmp une float %20, %20
  %28 = or i1 %26, %27
  %29 = select i1 %28, float %20, float %25
  %30 = load float* %7
  %31 = load float* %9
  %32 = getelementptr inbounds [2 x [57 x [57 x [96 x float]]]]* %11, i64 0, i64 %fusion.12.clone.indvar.dim.0, i64 %fusion.12.clone.indvar.dim.1, i64 %fusion.12.clone.indvar.dim.2, i64 %fusion.12.clone.indvar.dim.3
  %33 = load float* %32
  %34 = fmul float %31, %33
  %35 = fadd float %30, %34
  %36 = load float* %13
  %37 = call float @llvm.pow.f32(float %35, float %36)
  %38 = fmul float %29, %37
  %39 = getelementptr inbounds [2 x [57 x [57 x [96 x float]]]]* %fusion.12.clone, i64 0, i64 %fusion.12.clone.indvar.dim.0, i64 %fusion.12.clone.indvar.dim.1, i64 %fusion.12.clone.indvar.dim.2, i64 %fusion.12.clone.indvar.dim.3
  store float %38, float* %39
  %invar.inc3 = add nuw nsw i64 %fusion.12.clone.indvar.dim.3, 1
  store i64 %invar.inc3, i64* %fusion.12.clone.invar_address.dim.3
  br label %fusion.12.clone.loop_header.dim.3

fusion.12.clone.loop_exit.dim.3:                  ; preds = %fusion.12.clone.loop_header.dim.3
  %invar.inc2 = add nuw nsw i64 %fusion.12.clone.indvar.dim.2, 1
  store i64 %invar.inc2, i64* %fusion.12.clone.invar_address.dim.2
  br label %fusion.12.clone.loop_header.dim.2

fusion.12.clone.loop_exit.dim.2:                  ; preds = %fusion.12.clone.loop_header.dim.2
  %invar.inc1 = add nuw nsw i64 %fusion.12.clone.indvar.dim.1, 1
  store i64 %invar.inc1, i64* %fusion.12.clone.invar_address.dim.1
  br label %fusion.12.clone.loop_header.dim.1

fusion.12.clone.loop_exit.dim.1:                  ; preds = %fusion.12.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %fusion.12.clone.indvar.dim.0, 1
  store i64 %invar.inc, i64* %fusion.12.clone.invar_address.dim.0
  br label %fusion.12.clone.loop_header.dim.0

fusion.12.clone.loop_exit.dim.0:                  ; preds = %fusion.12.clone.loop_header.dim.0
  ret void
}

define internal void @parallel_fusion.13(i8* align 16 dereferenceable(2495232) %retval, i8* noalias %run_options, i8** noalias %params, i8** noalias %temps, i64* noalias %dynamic_loop_bounds, i64* noalias %prof_counters) #0 {
entry:
  %fusion.13.clone.invar_address.dim.3 = alloca i64
  %fusion.13.clone.invar_address.dim.2 = alloca i64
  %fusion.13.clone.invar_address.dim.1 = alloca i64
  %fusion.13.clone.invar_address.dim.0 = alloca i64
  %0 = getelementptr inbounds i8** %params, i64 2
  %name.33.untyped = load i8** %0, !dereferenceable !0, !align !0
  %1 = bitcast i8* %name.33.untyped to float*
  %2 = getelementptr inbounds i8** %params, i64 1
  %name.32.untyped = load i8** %2, !dereferenceable !9, !align !10
  %3 = bitcast i8* %name.32.untyped to [96 x float]*
  %4 = getelementptr inbounds i8** %params, i64 0
  %name.31.untyped = load i8** %4, !dereferenceable !5, !align !2
  %5 = bitcast i8* %name.31.untyped to [2 x [57 x [57 x [96 x float]]]]*
  %fusion.13.clone = bitcast i8* %retval to [2 x [57 x [57 x [96 x float]]]]*
  %dynamic_loop_bound_0 = getelementptr i64* %dynamic_loop_bounds, i64 0
  %6 = load i64* %dynamic_loop_bound_0
  %dynamic_loop_bound_1 = getelementptr i64* %dynamic_loop_bounds, i64 1
  %7 = load i64* %dynamic_loop_bound_1
  store i64 %6, i64* %fusion.13.clone.invar_address.dim.0
  br label %fusion.13.clone.loop_header.dim.0

fusion.13.clone.loop_header.dim.0:                ; preds = %fusion.13.clone.loop_exit.dim.1, %entry
  %fusion.13.clone.indvar.dim.0 = load i64* %fusion.13.clone.invar_address.dim.0
  %8 = icmp uge i64 %fusion.13.clone.indvar.dim.0, %7
  br i1 %8, label %fusion.13.clone.loop_exit.dim.0, label %fusion.13.clone.loop_body.dim.0

fusion.13.clone.loop_body.dim.0:                  ; preds = %fusion.13.clone.loop_header.dim.0
  store i64 0, i64* %fusion.13.clone.invar_address.dim.1
  br label %fusion.13.clone.loop_header.dim.1

fusion.13.clone.loop_header.dim.1:                ; preds = %fusion.13.clone.loop_exit.dim.2, %fusion.13.clone.loop_body.dim.0
  %fusion.13.clone.indvar.dim.1 = load i64* %fusion.13.clone.invar_address.dim.1
  %9 = icmp uge i64 %fusion.13.clone.indvar.dim.1, 57
  br i1 %9, label %fusion.13.clone.loop_exit.dim.1, label %fusion.13.clone.loop_body.dim.1

fusion.13.clone.loop_body.dim.1:                  ; preds = %fusion.13.clone.loop_header.dim.1
  store i64 0, i64* %fusion.13.clone.invar_address.dim.2
  br label %fusion.13.clone.loop_header.dim.2

fusion.13.clone.loop_header.dim.2:                ; preds = %fusion.13.clone.loop_exit.dim.3, %fusion.13.clone.loop_body.dim.1
  %fusion.13.clone.indvar.dim.2 = load i64* %fusion.13.clone.invar_address.dim.2
  %10 = icmp uge i64 %fusion.13.clone.indvar.dim.2, 57
  br i1 %10, label %fusion.13.clone.loop_exit.dim.2, label %fusion.13.clone.loop_body.dim.2

fusion.13.clone.loop_body.dim.2:                  ; preds = %fusion.13.clone.loop_header.dim.2
  store i64 0, i64* %fusion.13.clone.invar_address.dim.3
  br label %fusion.13.clone.loop_header.dim.3

fusion.13.clone.loop_header.dim.3:                ; preds = %fusion.13.clone.loop_body.dim.3, %fusion.13.clone.loop_body.dim.2
  %fusion.13.clone.indvar.dim.3 = load i64* %fusion.13.clone.invar_address.dim.3
  %11 = icmp uge i64 %fusion.13.clone.indvar.dim.3, 96
  br i1 %11, label %fusion.13.clone.loop_exit.dim.3, label %fusion.13.clone.loop_body.dim.3

fusion.13.clone.loop_body.dim.3:                  ; preds = %fusion.13.clone.loop_header.dim.3
  %12 = load float* %1
  %13 = getelementptr inbounds [2 x [57 x [57 x [96 x float]]]]* %5, i64 0, i64 %fusion.13.clone.indvar.dim.0, i64 %fusion.13.clone.indvar.dim.1, i64 %fusion.13.clone.indvar.dim.2, i64 %fusion.13.clone.indvar.dim.3
  %14 = load float* %13
  %15 = getelementptr inbounds [96 x float]* %3, i64 0, i64 %fusion.13.clone.indvar.dim.3
  %16 = load float* %15
  %17 = fadd float %14, %16
  %18 = fcmp oge float %12, %17
  %19 = fcmp une float %12, %12
  %20 = or i1 %18, %19
  %21 = select i1 %20, float %12, float %17
  %22 = fmul float %21, %21
  %23 = getelementptr inbounds [2 x [57 x [57 x [96 x float]]]]* %fusion.13.clone, i64 0, i64 %fusion.13.clone.indvar.dim.0, i64 %fusion.13.clone.indvar.dim.1, i64 %fusion.13.clone.indvar.dim.2, i64 %fusion.13.clone.indvar.dim.3
  store float %22, float* %23
  %invar.inc3 = add nuw nsw i64 %fusion.13.clone.indvar.dim.3, 1
  store i64 %invar.inc3, i64* %fusion.13.clone.invar_address.dim.3
  br label %fusion.13.clone.loop_header.dim.3

fusion.13.clone.loop_exit.dim.3:                  ; preds = %fusion.13.clone.loop_header.dim.3
  %invar.inc2 = add nuw nsw i64 %fusion.13.clone.indvar.dim.2, 1
  store i64 %invar.inc2, i64* %fusion.13.clone.invar_address.dim.2
  br label %fusion.13.clone.loop_header.dim.2

fusion.13.clone.loop_exit.dim.2:                  ; preds = %fusion.13.clone.loop_header.dim.2
  %invar.inc1 = add nuw nsw i64 %fusion.13.clone.indvar.dim.1, 1
  store i64 %invar.inc1, i64* %fusion.13.clone.invar_address.dim.1
  br label %fusion.13.clone.loop_header.dim.1

fusion.13.clone.loop_exit.dim.1:                  ; preds = %fusion.13.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %fusion.13.clone.indvar.dim.0, 1
  store i64 %invar.inc, i64* %fusion.13.clone.invar_address.dim.0
  br label %fusion.13.clone.loop_header.dim.0

fusion.13.clone.loop_exit.dim.0:                  ; preds = %fusion.13.clone.loop_header.dim.0
  ret void
}

define void @cluster_0__XlaCompiledKernel_true__XlaNumConstantArgs_0__XlaNumResourceArgs_0_.v106(i8* align 8 dereferenceable(8) %retval, i8* noalias %run_options, i8** noalias %params, i8** noalias %temps, i64* noalias %prof_counters) #0 {
entry:
  %fusion.invar_address.dim.1 = alloca i64
  %fusion.invar_address.dim.0 = alloca i64
  %reduce_function_parameter_addresses173 = alloca i8*, i32 2
  %reduce_function_return_value_address172 = alloca float, i64 1, align 4
  %reduce.1.inner.invar_address.reduction_dim.1 = alloca i64
  %accumulator170 = alloca float, align 4
  %reduce.1.invar_address.dim.0 = alloca i64
  %fusion.1.invar_address.dim.1 = alloca i64
  %fusion.1.invar_address.dim.0 = alloca i64
  %reduce_function_parameter_addresses = alloca i8*, i32 2
  %reduce_function_return_value_address = alloca float, i64 1, align 4
  %reduce.inner.invar_address.reduction_dim.1 = alloca i64
  %accumulator = alloca float, align 4
  %reduce.invar_address.dim.0 = alloca i64
  %fusion.2.invar_address.dim.1 = alloca i64
  %fusion.2.invar_address.dim.0 = alloca i64
  %accum_address162 = alloca float
  %dot.2.invar_address.reduction = alloca i64
  %dot.2.invar_address.rhs.1 = alloca i64
  %dot.2.invar_address.lhs.0 = alloca i64
  %fusion.3.invar_address.dim.1 = alloca i64
  %fusion.3.invar_address.dim.0 = alloca i64
  %accum_address156 = alloca float
  %dot.1.invar_address.reduction = alloca i64
  %dot.1.invar_address.rhs.1 = alloca i64
  %dot.1.invar_address.lhs.0 = alloca i64
  %fusion.4.invar_address.dim.1 = alloca i64
  %fusion.4.invar_address.dim.0 = alloca i64
  %accum_address = alloca float
  %dot.invar_address.reduction = alloca i64
  %dot.invar_address.rhs.1 = alloca i64
  %dot.invar_address.lhs.0 = alloca i64
  %reducer_function_parameter_addresses144 = alloca i8*, i32 2
  %reducer_function_return_value_address143 = alloca float, i64 1, align 4
  %reduce-window.4.inner.invar_address.window.3 = alloca i64
  %reduce-window.4.inner.invar_address.window.2 = alloca i64
  %reduce-window.4.inner.invar_address.window.1 = alloca i64
  %reduce-window.4.inner.invar_address.window.0 = alloca i64
  %reduce_window_accumulator_address135 = alloca float, align 4
  %reduce-window.4.invar_address.dim.3 = alloca i64
  %reduce-window.4.invar_address.dim.2 = alloca i64
  %reduce-window.4.invar_address.dim.1 = alloca i64
  %reduce-window.4.invar_address.dim.0 = alloca i64
  %fusion.5.invar_address.dim.3 = alloca i64
  %fusion.5.invar_address.dim.2 = alloca i64
  %fusion.5.invar_address.dim.1 = alloca i64
  %fusion.5.invar_address.dim.0 = alloca i64
  %convolution.7.inner.invar_address.iz = alloca i64
  %convolution.7.inner.invar_address.k1 = alloca i64
  %convolution.7.inner.invar_address.k0 = alloca i64
  %convolution_sum_address116 = alloca float, align 4
  %convolution.7.invar_address.dim.3 = alloca i64
  %convolution.7.invar_address.dim.2 = alloca i64
  %convolution.7.invar_address.dim.1 = alloca i64
  %convolution.7.invar_address.dim.0 = alloca i64
  %parallel_slice.10_parameter_addresses = alloca i8*
  %fusion.7.invar_address.dim.3 = alloca i64
  %fusion.7.invar_address.dim.2 = alloca i64
  %fusion.7.invar_address.dim.1 = alloca i64
  %fusion.7.invar_address.dim.0 = alloca i64
  %convolution.6.inner.invar_address.iz = alloca i64
  %convolution.6.inner.invar_address.k1 = alloca i64
  %convolution.6.inner.invar_address.k0 = alloca i64
  %convolution_sum_address97 = alloca float, align 4
  %convolution.6.invar_address.dim.3 = alloca i64
  %convolution.6.invar_address.dim.2 = alloca i64
  %convolution.6.invar_address.dim.1 = alloca i64
  %convolution.6.invar_address.dim.0 = alloca i64
  %parallel_slice_parameter_addresses = alloca i8*
  %fusion.6.invar_address.dim.3 = alloca i64
  %fusion.6.invar_address.dim.2 = alloca i64
  %fusion.6.invar_address.dim.1 = alloca i64
  %fusion.6.invar_address.dim.0 = alloca i64
  %convolution.5.inner.invar_address.iz = alloca i64
  %convolution.5.inner.invar_address.k1 = alloca i64
  %convolution.5.inner.invar_address.k0 = alloca i64
  %convolution_sum_address82 = alloca float, align 4
  %convolution.5.invar_address.dim.3 = alloca i64
  %convolution.5.invar_address.dim.2 = alloca i64
  %convolution.5.invar_address.dim.1 = alloca i64
  %convolution.5.invar_address.dim.0 = alloca i64
  %parallel_slice.7_parameter_addresses = alloca i8*
  %fusion.9.invar_address.dim.3 = alloca i64
  %fusion.9.invar_address.dim.2 = alloca i64
  %fusion.9.invar_address.dim.1 = alloca i64
  %fusion.9.invar_address.dim.0 = alloca i64
  %convolution.4.inner.invar_address.iz = alloca i64
  %convolution.4.inner.invar_address.k1 = alloca i64
  %convolution.4.inner.invar_address.k0 = alloca i64
  %convolution_sum_address67 = alloca float, align 4
  %convolution.4.invar_address.dim.3 = alloca i64
  %convolution.4.invar_address.dim.2 = alloca i64
  %convolution.4.invar_address.dim.1 = alloca i64
  %convolution.4.invar_address.dim.0 = alloca i64
  %parallel_slice.1_parameter_addresses = alloca i8*
  %fusion.8.invar_address.dim.3 = alloca i64
  %fusion.8.invar_address.dim.2 = alloca i64
  %fusion.8.invar_address.dim.1 = alloca i64
  %fusion.8.invar_address.dim.0 = alloca i64
  %convolution.3.inner.invar_address.iz = alloca i64
  %convolution.3.inner.invar_address.k1 = alloca i64
  %convolution.3.inner.invar_address.k0 = alloca i64
  %convolution_sum_address52 = alloca float, align 4
  %convolution.3.invar_address.dim.3 = alloca i64
  %convolution.3.invar_address.dim.2 = alloca i64
  %convolution.3.invar_address.dim.1 = alloca i64
  %convolution.3.invar_address.dim.0 = alloca i64
  %reducer_function_parameter_addresses = alloca i8*, i32 2
  %reducer_function_return_value_address = alloca float, i64 1, align 4
  %reduce-window.3.inner.invar_address.window.3 = alloca i64
  %reduce-window.3.inner.invar_address.window.2 = alloca i64
  %reduce-window.3.inner.invar_address.window.1 = alloca i64
  %reduce-window.3.inner.invar_address.window.0 = alloca i64
  %reduce_window_accumulator_address = alloca float, align 4
  %reduce-window.3.invar_address.dim.3 = alloca i64
  %reduce-window.3.invar_address.dim.2 = alloca i64
  %reduce-window.3.invar_address.dim.1 = alloca i64
  %reduce-window.3.invar_address.dim.0 = alloca i64
  %parallel_fusion.10_parameter_addresses = alloca i8*, i32 8
  %parallel_reduce-window.2_parameter_addresses = alloca i8*, i32 2
  %parallel_fusion.11_parameter_addresses = alloca i8*, i32 4
  %convolution.2.inner.invar_address.iz = alloca i64
  %convolution.2.inner.invar_address.k1 = alloca i64
  %convolution.2.inner.invar_address.k0 = alloca i64
  %convolution_sum_address30 = alloca float, align 4
  %convolution.2.invar_address.dim.3 = alloca i64
  %convolution.2.invar_address.dim.2 = alloca i64
  %convolution.2.invar_address.dim.1 = alloca i64
  %convolution.2.invar_address.dim.0 = alloca i64
  %parallel_slice.4_parameter_addresses = alloca i8*
  %slice.5.invar_address.slice.2 = alloca i64
  %slice.5.invar_address.slice.1 = alloca i64
  %slice.5.invar_address.slice.0 = alloca i64
  %convolution.1.inner.invar_address.iz = alloca i64
  %convolution.1.inner.invar_address.k1 = alloca i64
  %convolution.1.inner.invar_address.k0 = alloca i64
  %convolution_sum_address14 = alloca float, align 4
  %convolution.1.invar_address.dim.3 = alloca i64
  %convolution.1.invar_address.dim.2 = alloca i64
  %convolution.1.invar_address.dim.1 = alloca i64
  %convolution.1.invar_address.dim.0 = alloca i64
  %parallel_slice.2_parameter_addresses = alloca i8*
  %slice.3.invar_address.slice.2 = alloca i64
  %slice.3.invar_address.slice.1 = alloca i64
  %slice.3.invar_address.slice.0 = alloca i64
  %parallel_reduce-window.1_parameter_addresses = alloca i8*, i32 2
  %parallel_fusion.12_parameter_addresses = alloca i8*, i32 7
  %parallel_reduce-window_parameter_addresses = alloca i8*, i32 2
  %parallel_fusion.13_parameter_addresses = alloca i8*, i32 3
  %convolution.inner.invar_address.iz = alloca i64
  %convolution.inner.invar_address.k1 = alloca i64
  %convolution.inner.invar_address.k0 = alloca i64
  %convolution_sum_address = alloca float, align 4
  %convolution.invar_address.dim.3 = alloca i64
  %convolution.invar_address.dim.2 = alloca i64
  %convolution.invar_address.dim.1 = alloca i64
  %convolution.invar_address.dim.0 = alloca i64
  %0 = getelementptr inbounds i8** %params, i64 0
  %arg0.untyped = load i8** %0, !dereferenceable !11, !align !2
  %1 = bitcast i8* %arg0.untyped to [11 x [11 x [3 x [96 x float]]]]*
  %2 = getelementptr inbounds i8** %params, i64 16
  %arg16.untyped = load i8** %2, !dereferenceable !12, !align !2
  %3 = bitcast i8* %arg16.untyped to [2 x [227 x [227 x [3 x float]]]]*
  %4 = getelementptr inbounds i8** %temps, i64 25
  %5 = load i8** %4, !dereferenceable !13, !align !2
  %6 = getelementptr inbounds i8* %5, i64 7202304
  %convolution = bitcast i8* %6 to [2 x [57 x [57 x [96 x float]]]]*
  store i64 0, i64* %convolution.invar_address.dim.0
  br label %convolution.loop_header.dim.0

convolution.loop_header.dim.0:                    ; preds = %convolution.loop_exit.dim.1, %entry
  %convolution.indvar.dim.0 = load i64* %convolution.invar_address.dim.0
  %7 = icmp uge i64 %convolution.indvar.dim.0, 2
  br i1 %7, label %convolution.loop_exit.dim.0, label %convolution.loop_body.dim.0

convolution.loop_body.dim.0:                      ; preds = %convolution.loop_header.dim.0
  store i64 0, i64* %convolution.invar_address.dim.1
  br label %convolution.loop_header.dim.1

convolution.loop_header.dim.1:                    ; preds = %convolution.loop_exit.dim.2, %convolution.loop_body.dim.0
  %convolution.indvar.dim.1 = load i64* %convolution.invar_address.dim.1
  %8 = icmp uge i64 %convolution.indvar.dim.1, 57
  br i1 %8, label %convolution.loop_exit.dim.1, label %convolution.loop_body.dim.1

convolution.loop_body.dim.1:                      ; preds = %convolution.loop_header.dim.1
  store i64 0, i64* %convolution.invar_address.dim.2
  br label %convolution.loop_header.dim.2

convolution.loop_header.dim.2:                    ; preds = %convolution.loop_exit.dim.3, %convolution.loop_body.dim.1
  %convolution.indvar.dim.2 = load i64* %convolution.invar_address.dim.2
  %9 = icmp uge i64 %convolution.indvar.dim.2, 57
  br i1 %9, label %convolution.loop_exit.dim.2, label %convolution.loop_body.dim.2

convolution.loop_body.dim.2:                      ; preds = %convolution.loop_header.dim.2
  store i64 0, i64* %convolution.invar_address.dim.3
  br label %convolution.loop_header.dim.3

convolution.loop_header.dim.3:                    ; preds = %convolution.inner.loop_exit.k0, %convolution.loop_body.dim.2
  %convolution.indvar.dim.3 = load i64* %convolution.invar_address.dim.3
  %10 = icmp uge i64 %convolution.indvar.dim.3, 96
  br i1 %10, label %convolution.loop_exit.dim.3, label %convolution.loop_body.dim.3

convolution.loop_body.dim.3:                      ; preds = %convolution.loop_header.dim.3
  store float 0.000000e+00, float* %convolution_sum_address
  store i64 0, i64* %convolution.inner.invar_address.k0
  br label %convolution.inner.loop_header.k0

convolution.inner.loop_header.k0:                 ; preds = %convolution.inner.loop_exit.k1, %convolution.loop_body.dim.3
  %convolution.inner.indvar.k0 = load i64* %convolution.inner.invar_address.k0
  %11 = icmp uge i64 %convolution.inner.indvar.k0, 11
  br i1 %11, label %convolution.inner.loop_exit.k0, label %convolution.inner.loop_body.k0

convolution.inner.loop_body.k0:                   ; preds = %convolution.inner.loop_header.k0
  store i64 0, i64* %convolution.inner.invar_address.k1
  br label %convolution.inner.loop_header.k1

convolution.inner.loop_header.k1:                 ; preds = %convolution.inner.loop_exit.iz, %convolution.inner.loop_body.k0
  %convolution.inner.indvar.k1 = load i64* %convolution.inner.invar_address.k1
  %12 = icmp uge i64 %convolution.inner.indvar.k1, 11
  br i1 %12, label %convolution.inner.loop_exit.k1, label %convolution.inner.loop_body.k1

convolution.inner.loop_body.k1:                   ; preds = %convolution.inner.loop_header.k1
  store i64 0, i64* %convolution.inner.invar_address.iz
  br label %convolution.inner.loop_header.iz

convolution.inner.loop_header.iz:                 ; preds = %in-bounds-after, %convolution.inner.loop_body.k1
  %convolution.inner.indvar.iz = load i64* %convolution.inner.invar_address.iz
  %13 = icmp uge i64 %convolution.inner.indvar.iz, 3
  br i1 %13, label %convolution.inner.loop_exit.iz, label %convolution.inner.loop_body.iz

convolution.inner.loop_body.iz:                   ; preds = %convolution.inner.loop_header.iz
  %14 = mul nsw i64 %convolution.indvar.dim.1, 4
  %15 = mul nsw i64 %convolution.inner.indvar.k0, 1
  %16 = add nsw i64 %14, %15
  %17 = sub nsw i64 %16, 4
  %18 = mul nsw i64 %convolution.indvar.dim.2, 4
  %19 = mul nsw i64 %convolution.inner.indvar.k1, 1
  %20 = add nsw i64 %18, %19
  %21 = sub nsw i64 %20, 4
  %22 = icmp ult i64 %17, 227
  %23 = srem i64 %17, 1
  %24 = icmp eq i64 %23, 0
  %25 = and i1 %22, %24
  %26 = and i1 true, %25
  %27 = icmp ult i64 %21, 227
  %28 = srem i64 %21, 1
  %29 = icmp eq i64 %28, 0
  %30 = and i1 %27, %29
  %31 = and i1 %26, %30
  %32 = sdiv i64 %17, 1
  %33 = sdiv i64 %21, 1
  br i1 %31, label %in-bounds-true, label %in-bounds-false

in-bounds-after:                                  ; preds = %in-bounds-false, %in-bounds-true
  %invar.inc6 = add nuw nsw i64 %convolution.inner.indvar.iz, 1
  store i64 %invar.inc6, i64* %convolution.inner.invar_address.iz
  br label %convolution.inner.loop_header.iz

convolution.inner.loop_exit.iz:                   ; preds = %convolution.inner.loop_header.iz
  %invar.inc5 = add nuw nsw i64 %convolution.inner.indvar.k1, 1
  store i64 %invar.inc5, i64* %convolution.inner.invar_address.k1
  br label %convolution.inner.loop_header.k1

convolution.inner.loop_exit.k1:                   ; preds = %convolution.inner.loop_header.k1
  %invar.inc4 = add nuw nsw i64 %convolution.inner.indvar.k0, 1
  store i64 %invar.inc4, i64* %convolution.inner.invar_address.k0
  br label %convolution.inner.loop_header.k0

convolution.inner.loop_exit.k0:                   ; preds = %convolution.inner.loop_header.k0
  %34 = load float* %convolution_sum_address
  %35 = getelementptr inbounds [2 x [57 x [57 x [96 x float]]]]* %convolution, i64 0, i64 %convolution.indvar.dim.0, i64 %convolution.indvar.dim.1, i64 %convolution.indvar.dim.2, i64 %convolution.indvar.dim.3
  store float %34, float* %35
  %invar.inc3 = add nuw nsw i64 %convolution.indvar.dim.3, 1
  store i64 %invar.inc3, i64* %convolution.invar_address.dim.3
  br label %convolution.loop_header.dim.3

convolution.loop_exit.dim.3:                      ; preds = %convolution.loop_header.dim.3
  %invar.inc2 = add nuw nsw i64 %convolution.indvar.dim.2, 1
  store i64 %invar.inc2, i64* %convolution.invar_address.dim.2
  br label %convolution.loop_header.dim.2

convolution.loop_exit.dim.2:                      ; preds = %convolution.loop_header.dim.2
  %invar.inc1 = add nuw nsw i64 %convolution.indvar.dim.1, 1
  store i64 %invar.inc1, i64* %convolution.invar_address.dim.1
  br label %convolution.loop_header.dim.1

convolution.loop_exit.dim.1:                      ; preds = %convolution.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %convolution.indvar.dim.0, 1
  store i64 %invar.inc, i64* %convolution.invar_address.dim.0
  br label %convolution.loop_header.dim.0

convolution.loop_exit.dim.0:                      ; preds = %convolution.loop_header.dim.0
  %36 = getelementptr inbounds i8** %params, i64 1
  %arg1.untyped = load i8** %36, !dereferenceable !9, !align !10
  %37 = bitcast i8* %arg1.untyped to [96 x float]*
  %38 = getelementptr inbounds i8** %temps, i64 25
  %39 = load i8** %38, !dereferenceable !13, !align !2
  %40 = getelementptr inbounds i8* %39, i64 11918016
  %call.12 = bitcast i8* %40 to [2 x [57 x [57 x [96 x float]]]]*
  %parallel_fusion.13_parameter_0_address_as_i8ptr = bitcast [2 x [57 x [57 x [96 x float]]]]* %convolution to i8*
  %41 = getelementptr inbounds i8** %parallel_fusion.13_parameter_addresses, i64 0
  store i8* %parallel_fusion.13_parameter_0_address_as_i8ptr, i8** %41
  %parallel_fusion.13_parameter_1_address_as_i8ptr = bitcast [96 x float]* %37 to i8*
  %42 = getelementptr inbounds i8** %parallel_fusion.13_parameter_addresses, i64 1
  store i8* %parallel_fusion.13_parameter_1_address_as_i8ptr, i8** %42
  %43 = getelementptr inbounds i8** %parallel_fusion.13_parameter_addresses, i64 2
  store i8* bitcast (float* @0 to i8*), i8** %43
  %44 = bitcast [2 x [57 x [57 x [96 x float]]]]* %call.12 to i8*
  call void @__xla_cpu_runtime_ParallelForkJoin(i8* %44, i8* %run_options, i8** %parallel_fusion.13_parameter_addresses, i8** %temps, i64* %prof_counters, i32 2, i64* getelementptr inbounds ([4 x i64]* @parallel_fusion.13_parallel_dimension_partitions, i32 0, i32 0), i32 1, i8* bitcast (void (i8*, i8*, i8**, i8**, i64*, i64*)* @parallel_fusion.13 to i8*))
  %45 = getelementptr inbounds i8** %temps, i64 25
  %46 = load i8** %45, !dereferenceable !13, !align !2
  %47 = getelementptr inbounds i8* %46, i64 16620992
  %call.3 = bitcast i8* %47 to [2 x [57 x [57 x [96 x float]]]]*
  %parallel_reduce-window_parameter_0_address_as_i8ptr = bitcast [2 x [57 x [57 x [96 x float]]]]* %call.12 to i8*
  %48 = getelementptr inbounds i8** %parallel_reduce-window_parameter_addresses, i64 0
  store i8* %parallel_reduce-window_parameter_0_address_as_i8ptr, i8** %48
  %49 = getelementptr inbounds i8** %parallel_reduce-window_parameter_addresses, i64 1
  store i8* bitcast (float* @0 to i8*), i8** %49
  %50 = bitcast [2 x [57 x [57 x [96 x float]]]]* %call.3 to i8*
  call void @__xla_cpu_runtime_ParallelForkJoin(i8* %50, i8* %run_options, i8** %parallel_reduce-window_parameter_addresses, i8** %temps, i64* %prof_counters, i32 2, i64* getelementptr inbounds ([4 x i64]* @parallel_reduce-window_parallel_dimension_partitions, i32 0, i32 0), i32 1, i8* bitcast (void (i8*, i8*, i8**, i8**, i64*, i64*)* @parallel_reduce-window to i8*))
  %51 = getelementptr inbounds i8** %temps, i64 25
  %52 = load i8** %51, !dereferenceable !13, !align !2
  %53 = getelementptr inbounds i8* %52, i64 11918016
  %call.11 = bitcast i8* %53 to [2 x [57 x [57 x [96 x float]]]]*
  %54 = getelementptr inbounds i8** %parallel_fusion.12_parameter_addresses, i64 0
  store i8* bitcast (float* @3 to i8*), i8** %54
  %parallel_fusion.12_parameter_1_address_as_i8ptr = bitcast [2 x [57 x [57 x [96 x float]]]]* %call.3 to i8*
  %55 = getelementptr inbounds i8** %parallel_fusion.12_parameter_addresses, i64 1
  store i8* %parallel_fusion.12_parameter_1_address_as_i8ptr, i8** %55
  %56 = getelementptr inbounds i8** %parallel_fusion.12_parameter_addresses, i64 2
  store i8* bitcast (float* @2 to i8*), i8** %56
  %57 = getelementptr inbounds i8** %parallel_fusion.12_parameter_addresses, i64 3
  store i8* bitcast (float* @1 to i8*), i8** %57
  %parallel_fusion.12_parameter_4_address_as_i8ptr = bitcast [2 x [57 x [57 x [96 x float]]]]* %convolution to i8*
  %58 = getelementptr inbounds i8** %parallel_fusion.12_parameter_addresses, i64 4
  store i8* %parallel_fusion.12_parameter_4_address_as_i8ptr, i8** %58
  %parallel_fusion.12_parameter_5_address_as_i8ptr = bitcast [96 x float]* %37 to i8*
  %59 = getelementptr inbounds i8** %parallel_fusion.12_parameter_addresses, i64 5
  store i8* %parallel_fusion.12_parameter_5_address_as_i8ptr, i8** %59
  %60 = getelementptr inbounds i8** %parallel_fusion.12_parameter_addresses, i64 6
  store i8* bitcast (float* @0 to i8*), i8** %60
  %61 = bitcast [2 x [57 x [57 x [96 x float]]]]* %call.11 to i8*
  call void @__xla_cpu_runtime_ParallelForkJoin(i8* %61, i8* %run_options, i8** %parallel_fusion.12_parameter_addresses, i8** %temps, i64* %prof_counters, i32 2, i64* getelementptr inbounds ([4 x i64]* @parallel_fusion.12_parallel_dimension_partitions, i32 0, i32 0), i32 1, i8* bitcast (void (i8*, i8*, i8**, i8**, i64*, i64*)* @parallel_fusion.12 to i8*))
  %62 = getelementptr inbounds i8** %temps, i64 25
  %63 = load i8** %62, !dereferenceable !13, !align !2
  %64 = getelementptr inbounds i8* %63, i64 16018880
  %call.4 = bitcast i8* %64 to [2 x [28 x [28 x [96 x float]]]]*
  %parallel_reduce-window.1_parameter_0_address_as_i8ptr = bitcast [2 x [57 x [57 x [96 x float]]]]* %call.11 to i8*
  %65 = getelementptr inbounds i8** %parallel_reduce-window.1_parameter_addresses, i64 0
  store i8* %parallel_reduce-window.1_parameter_0_address_as_i8ptr, i8** %65
  %66 = getelementptr inbounds i8** %parallel_reduce-window.1_parameter_addresses, i64 1
  store i8* bitcast (float* @4 to i8*), i8** %66
  %67 = bitcast [2 x [28 x [28 x [96 x float]]]]* %call.4 to i8*
  call void @__xla_cpu_runtime_ParallelForkJoin(i8* %67, i8* %run_options, i8** %parallel_reduce-window.1_parameter_addresses, i8** %temps, i64* %prof_counters, i32 2, i64* getelementptr inbounds ([4 x i64]* @parallel_reduce-window.1_parallel_dimension_partitions, i32 0, i32 0), i32 1, i8* bitcast (void (i8*, i8*, i8**, i8**, i64*, i64*)* @parallel_reduce-window.1 to i8*))
  %68 = getelementptr inbounds i8** %temps, i64 25
  %69 = load i8** %68, !dereferenceable !13, !align !2
  %70 = getelementptr inbounds i8* %69, i64 3440640
  %slice.3 = bitcast i8* %70 to [2 x [28 x [28 x [48 x float]]]]*
  store i64 0, i64* %slice.3.invar_address.slice.0
  br label %slice.3.loop_header.slice.0

in-bounds-true:                                   ; preds = %convolution.inner.loop_body.iz
  %71 = getelementptr inbounds [11 x [11 x [3 x [96 x float]]]]* %1, i64 0, i64 %convolution.inner.indvar.k0, i64 %convolution.inner.indvar.k1, i64 %convolution.inner.indvar.iz, i64 %convolution.indvar.dim.3
  %72 = load float* %71
  %73 = getelementptr inbounds [2 x [227 x [227 x [3 x float]]]]* %3, i64 0, i64 %convolution.indvar.dim.0, i64 %32, i64 %33, i64 %convolution.inner.indvar.iz
  %74 = load float* %73
  %75 = fmul float %74, %72
  %76 = load float* %convolution_sum_address
  %77 = fadd float %76, %75
  store float %77, float* %convolution_sum_address
  br label %in-bounds-after

in-bounds-false:                                  ; preds = %convolution.inner.loop_body.iz
  br label %in-bounds-after

slice.3.loop_header.slice.0:                      ; preds = %slice.3.loop_exit.slice.1, %convolution.loop_exit.dim.0
  %slice.3.indvar.slice.0 = load i64* %slice.3.invar_address.slice.0
  %78 = icmp uge i64 %slice.3.indvar.slice.0, 2
  br i1 %78, label %slice.3.loop_exit.slice.0, label %slice.3.loop_body.slice.0

slice.3.loop_body.slice.0:                        ; preds = %slice.3.loop_header.slice.0
  store i64 0, i64* %slice.3.invar_address.slice.1
  br label %slice.3.loop_header.slice.1

slice.3.loop_header.slice.1:                      ; preds = %slice.3.loop_exit.slice.2, %slice.3.loop_body.slice.0
  %slice.3.indvar.slice.1 = load i64* %slice.3.invar_address.slice.1
  %79 = icmp uge i64 %slice.3.indvar.slice.1, 28
  br i1 %79, label %slice.3.loop_exit.slice.1, label %slice.3.loop_body.slice.1

slice.3.loop_body.slice.1:                        ; preds = %slice.3.loop_header.slice.1
  store i64 0, i64* %slice.3.invar_address.slice.2
  br label %slice.3.loop_header.slice.2

slice.3.loop_header.slice.2:                      ; preds = %slice.3.loop_body.slice.2, %slice.3.loop_body.slice.1
  %slice.3.indvar.slice.2 = load i64* %slice.3.invar_address.slice.2
  %80 = icmp uge i64 %slice.3.indvar.slice.2, 28
  br i1 %80, label %slice.3.loop_exit.slice.2, label %slice.3.loop_body.slice.2

slice.3.loop_body.slice.2:                        ; preds = %slice.3.loop_header.slice.2
  %81 = add i64 %slice.3.indvar.slice.0, 0
  %82 = add i64 %slice.3.indvar.slice.1, 0
  %83 = add i64 %slice.3.indvar.slice.2, 0
  %slice.dest = getelementptr inbounds [2 x [28 x [28 x [48 x float]]]]* %slice.3, i64 0, i64 %slice.3.indvar.slice.0, i64 %slice.3.indvar.slice.1, i64 %slice.3.indvar.slice.2, i64 0
  %slice.source = getelementptr inbounds [2 x [28 x [28 x [96 x float]]]]* %call.4, i64 0, i64 %81, i64 %82, i64 %83, i64 48
  %84 = bitcast float* %slice.dest to i8*
  %85 = bitcast float* %slice.source to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %84, i8* align 4 %85, i64 192, i32 0, i1 false)
  %invar.inc9 = add nuw nsw i64 %slice.3.indvar.slice.2, 1
  store i64 %invar.inc9, i64* %slice.3.invar_address.slice.2
  br label %slice.3.loop_header.slice.2

slice.3.loop_exit.slice.2:                        ; preds = %slice.3.loop_header.slice.2
  %invar.inc8 = add nuw nsw i64 %slice.3.indvar.slice.1, 1
  store i64 %invar.inc8, i64* %slice.3.invar_address.slice.1
  br label %slice.3.loop_header.slice.1

slice.3.loop_exit.slice.1:                        ; preds = %slice.3.loop_header.slice.1
  %invar.inc7 = add nuw nsw i64 %slice.3.indvar.slice.0, 1
  store i64 %invar.inc7, i64* %slice.3.invar_address.slice.0
  br label %slice.3.loop_header.slice.0

slice.3.loop_exit.slice.0:                        ; preds = %slice.3.loop_header.slice.0
  %86 = getelementptr inbounds i8** %params, i64 4
  %arg4.untyped = load i8** %86, !dereferenceable !4, !align !2
  %87 = bitcast i8* %arg4.untyped to [5 x [5 x [48 x [256 x float]]]]*
  %88 = getelementptr inbounds i8** %temps, i64 25
  %89 = load i8** %88, !dereferenceable !13, !align !2
  %90 = getelementptr inbounds i8* %89, i64 11303616
  %call.2 = bitcast i8* %90 to [5 x [5 x [48 x [128 x float]]]]*
  %parallel_slice.2_parameter_0_address_as_i8ptr = bitcast [5 x [5 x [48 x [256 x float]]]]* %87 to i8*
  %91 = getelementptr inbounds i8** %parallel_slice.2_parameter_addresses, i64 0
  store i8* %parallel_slice.2_parameter_0_address_as_i8ptr, i8** %91
  %92 = bitcast [5 x [5 x [48 x [128 x float]]]]* %call.2 to i8*
  call void @__xla_cpu_runtime_ParallelForkJoin(i8* %92, i8* %run_options, i8** %parallel_slice.2_parameter_addresses, i8** %temps, i64* %prof_counters, i32 2, i64* getelementptr inbounds ([4 x i64]* @parallel_slice.2_parallel_dimension_partitions, i32 0, i32 0), i32 1, i8* bitcast (void (i8*, i8*, i8**, i8**, i64*, i64*)* @parallel_slice.2 to i8*))
  %93 = getelementptr inbounds i8** %temps, i64 25
  %94 = load i8** %93, !dereferenceable !13, !align !2
  %95 = getelementptr inbounds i8* %94, i64 2211840
  %convolution.1 = bitcast i8* %95 to [2 x [28 x [28 x [128 x float]]]]*
  store i64 0, i64* %convolution.1.invar_address.dim.0
  br label %convolution.1.loop_header.dim.0

convolution.1.loop_header.dim.0:                  ; preds = %convolution.1.loop_exit.dim.1, %slice.3.loop_exit.slice.0
  %convolution.1.indvar.dim.0 = load i64* %convolution.1.invar_address.dim.0
  %96 = icmp uge i64 %convolution.1.indvar.dim.0, 2
  br i1 %96, label %convolution.1.loop_exit.dim.0, label %convolution.1.loop_body.dim.0

convolution.1.loop_body.dim.0:                    ; preds = %convolution.1.loop_header.dim.0
  store i64 0, i64* %convolution.1.invar_address.dim.1
  br label %convolution.1.loop_header.dim.1

convolution.1.loop_header.dim.1:                  ; preds = %convolution.1.loop_exit.dim.2, %convolution.1.loop_body.dim.0
  %convolution.1.indvar.dim.1 = load i64* %convolution.1.invar_address.dim.1
  %97 = icmp uge i64 %convolution.1.indvar.dim.1, 28
  br i1 %97, label %convolution.1.loop_exit.dim.1, label %convolution.1.loop_body.dim.1

convolution.1.loop_body.dim.1:                    ; preds = %convolution.1.loop_header.dim.1
  store i64 0, i64* %convolution.1.invar_address.dim.2
  br label %convolution.1.loop_header.dim.2

convolution.1.loop_header.dim.2:                  ; preds = %convolution.1.loop_exit.dim.3, %convolution.1.loop_body.dim.1
  %convolution.1.indvar.dim.2 = load i64* %convolution.1.invar_address.dim.2
  %98 = icmp uge i64 %convolution.1.indvar.dim.2, 28
  br i1 %98, label %convolution.1.loop_exit.dim.2, label %convolution.1.loop_body.dim.2

convolution.1.loop_body.dim.2:                    ; preds = %convolution.1.loop_header.dim.2
  store i64 0, i64* %convolution.1.invar_address.dim.3
  br label %convolution.1.loop_header.dim.3

convolution.1.loop_header.dim.3:                  ; preds = %convolution.1.inner.loop_exit.k0, %convolution.1.loop_body.dim.2
  %convolution.1.indvar.dim.3 = load i64* %convolution.1.invar_address.dim.3
  %99 = icmp uge i64 %convolution.1.indvar.dim.3, 128
  br i1 %99, label %convolution.1.loop_exit.dim.3, label %convolution.1.loop_body.dim.3

convolution.1.loop_body.dim.3:                    ; preds = %convolution.1.loop_header.dim.3
  store float 0.000000e+00, float* %convolution_sum_address14
  store i64 0, i64* %convolution.1.inner.invar_address.k0
  br label %convolution.1.inner.loop_header.k0

convolution.1.inner.loop_header.k0:               ; preds = %convolution.1.inner.loop_exit.k1, %convolution.1.loop_body.dim.3
  %convolution.1.inner.indvar.k0 = load i64* %convolution.1.inner.invar_address.k0
  %100 = icmp uge i64 %convolution.1.inner.indvar.k0, 5
  br i1 %100, label %convolution.1.inner.loop_exit.k0, label %convolution.1.inner.loop_body.k0

convolution.1.inner.loop_body.k0:                 ; preds = %convolution.1.inner.loop_header.k0
  store i64 0, i64* %convolution.1.inner.invar_address.k1
  br label %convolution.1.inner.loop_header.k1

convolution.1.inner.loop_header.k1:               ; preds = %convolution.1.inner.loop_exit.iz, %convolution.1.inner.loop_body.k0
  %convolution.1.inner.indvar.k1 = load i64* %convolution.1.inner.invar_address.k1
  %101 = icmp uge i64 %convolution.1.inner.indvar.k1, 5
  br i1 %101, label %convolution.1.inner.loop_exit.k1, label %convolution.1.inner.loop_body.k1

convolution.1.inner.loop_body.k1:                 ; preds = %convolution.1.inner.loop_header.k1
  store i64 0, i64* %convolution.1.inner.invar_address.iz
  br label %convolution.1.inner.loop_header.iz

convolution.1.inner.loop_header.iz:               ; preds = %in-bounds-after20, %convolution.1.inner.loop_body.k1
  %convolution.1.inner.indvar.iz = load i64* %convolution.1.inner.invar_address.iz
  %102 = icmp uge i64 %convolution.1.inner.indvar.iz, 48
  br i1 %102, label %convolution.1.inner.loop_exit.iz, label %convolution.1.inner.loop_body.iz

convolution.1.inner.loop_body.iz:                 ; preds = %convolution.1.inner.loop_header.iz
  %103 = mul nsw i64 %convolution.1.indvar.dim.1, 1
  %104 = mul nsw i64 %convolution.1.inner.indvar.k0, 1
  %105 = add nsw i64 %103, %104
  %106 = sub nsw i64 %105, 2
  %107 = mul nsw i64 %convolution.1.indvar.dim.2, 1
  %108 = mul nsw i64 %convolution.1.inner.indvar.k1, 1
  %109 = add nsw i64 %107, %108
  %110 = sub nsw i64 %109, 2
  %111 = icmp ult i64 %106, 28
  %112 = srem i64 %106, 1
  %113 = icmp eq i64 %112, 0
  %114 = and i1 %111, %113
  %115 = and i1 true, %114
  %116 = icmp ult i64 %110, 28
  %117 = srem i64 %110, 1
  %118 = icmp eq i64 %117, 0
  %119 = and i1 %116, %118
  %120 = and i1 %115, %119
  %121 = sdiv i64 %106, 1
  %122 = sdiv i64 %110, 1
  br i1 %120, label %in-bounds-true18, label %in-bounds-false19

in-bounds-after20:                                ; preds = %in-bounds-false19, %in-bounds-true18
  %invar.inc17 = add nuw nsw i64 %convolution.1.inner.indvar.iz, 1
  store i64 %invar.inc17, i64* %convolution.1.inner.invar_address.iz
  br label %convolution.1.inner.loop_header.iz

convolution.1.inner.loop_exit.iz:                 ; preds = %convolution.1.inner.loop_header.iz
  %invar.inc16 = add nuw nsw i64 %convolution.1.inner.indvar.k1, 1
  store i64 %invar.inc16, i64* %convolution.1.inner.invar_address.k1
  br label %convolution.1.inner.loop_header.k1

convolution.1.inner.loop_exit.k1:                 ; preds = %convolution.1.inner.loop_header.k1
  %invar.inc15 = add nuw nsw i64 %convolution.1.inner.indvar.k0, 1
  store i64 %invar.inc15, i64* %convolution.1.inner.invar_address.k0
  br label %convolution.1.inner.loop_header.k0

convolution.1.inner.loop_exit.k0:                 ; preds = %convolution.1.inner.loop_header.k0
  %123 = load float* %convolution_sum_address14
  %124 = getelementptr inbounds [2 x [28 x [28 x [128 x float]]]]* %convolution.1, i64 0, i64 %convolution.1.indvar.dim.0, i64 %convolution.1.indvar.dim.1, i64 %convolution.1.indvar.dim.2, i64 %convolution.1.indvar.dim.3
  store float %123, float* %124
  %invar.inc13 = add nuw nsw i64 %convolution.1.indvar.dim.3, 1
  store i64 %invar.inc13, i64* %convolution.1.invar_address.dim.3
  br label %convolution.1.loop_header.dim.3

convolution.1.loop_exit.dim.3:                    ; preds = %convolution.1.loop_header.dim.3
  %invar.inc12 = add nuw nsw i64 %convolution.1.indvar.dim.2, 1
  store i64 %invar.inc12, i64* %convolution.1.invar_address.dim.2
  br label %convolution.1.loop_header.dim.2

convolution.1.loop_exit.dim.2:                    ; preds = %convolution.1.loop_header.dim.2
  %invar.inc11 = add nuw nsw i64 %convolution.1.indvar.dim.1, 1
  store i64 %invar.inc11, i64* %convolution.1.invar_address.dim.1
  br label %convolution.1.loop_header.dim.1

convolution.1.loop_exit.dim.1:                    ; preds = %convolution.1.loop_header.dim.1
  %invar.inc10 = add nuw nsw i64 %convolution.1.indvar.dim.0, 1
  store i64 %invar.inc10, i64* %convolution.1.invar_address.dim.0
  br label %convolution.1.loop_header.dim.0

convolution.1.loop_exit.dim.0:                    ; preds = %convolution.1.loop_header.dim.0
  %125 = getelementptr inbounds i8** %temps, i64 25
  %126 = load i8** %125, !dereferenceable !13, !align !2
  %127 = getelementptr inbounds i8* %126, i64 4243456
  %slice.5 = bitcast i8* %127 to [2 x [28 x [28 x [48 x float]]]]*
  store i64 0, i64* %slice.5.invar_address.slice.0
  br label %slice.5.loop_header.slice.0

in-bounds-true18:                                 ; preds = %convolution.1.inner.loop_body.iz
  %128 = getelementptr inbounds [5 x [5 x [48 x [128 x float]]]]* %call.2, i64 0, i64 %convolution.1.inner.indvar.k0, i64 %convolution.1.inner.indvar.k1, i64 %convolution.1.inner.indvar.iz, i64 %convolution.1.indvar.dim.3
  %129 = load float* %128
  %130 = getelementptr inbounds [2 x [28 x [28 x [48 x float]]]]* %slice.3, i64 0, i64 %convolution.1.indvar.dim.0, i64 %121, i64 %122, i64 %convolution.1.inner.indvar.iz
  %131 = load float* %130
  %132 = fmul float %131, %129
  %133 = load float* %convolution_sum_address14
  %134 = fadd float %133, %132
  store float %134, float* %convolution_sum_address14
  br label %in-bounds-after20

in-bounds-false19:                                ; preds = %convolution.1.inner.loop_body.iz
  br label %in-bounds-after20

slice.5.loop_header.slice.0:                      ; preds = %slice.5.loop_exit.slice.1, %convolution.1.loop_exit.dim.0
  %slice.5.indvar.slice.0 = load i64* %slice.5.invar_address.slice.0
  %135 = icmp uge i64 %slice.5.indvar.slice.0, 2
  br i1 %135, label %slice.5.loop_exit.slice.0, label %slice.5.loop_body.slice.0

slice.5.loop_body.slice.0:                        ; preds = %slice.5.loop_header.slice.0
  store i64 0, i64* %slice.5.invar_address.slice.1
  br label %slice.5.loop_header.slice.1

slice.5.loop_header.slice.1:                      ; preds = %slice.5.loop_exit.slice.2, %slice.5.loop_body.slice.0
  %slice.5.indvar.slice.1 = load i64* %slice.5.invar_address.slice.1
  %136 = icmp uge i64 %slice.5.indvar.slice.1, 28
  br i1 %136, label %slice.5.loop_exit.slice.1, label %slice.5.loop_body.slice.1

slice.5.loop_body.slice.1:                        ; preds = %slice.5.loop_header.slice.1
  store i64 0, i64* %slice.5.invar_address.slice.2
  br label %slice.5.loop_header.slice.2

slice.5.loop_header.slice.2:                      ; preds = %slice.5.loop_body.slice.2, %slice.5.loop_body.slice.1
  %slice.5.indvar.slice.2 = load i64* %slice.5.invar_address.slice.2
  %137 = icmp uge i64 %slice.5.indvar.slice.2, 28
  br i1 %137, label %slice.5.loop_exit.slice.2, label %slice.5.loop_body.slice.2

slice.5.loop_body.slice.2:                        ; preds = %slice.5.loop_header.slice.2
  %138 = add i64 %slice.5.indvar.slice.0, 0
  %139 = add i64 %slice.5.indvar.slice.1, 0
  %140 = add i64 %slice.5.indvar.slice.2, 0
  %slice.dest24 = getelementptr inbounds [2 x [28 x [28 x [48 x float]]]]* %slice.5, i64 0, i64 %slice.5.indvar.slice.0, i64 %slice.5.indvar.slice.1, i64 %slice.5.indvar.slice.2, i64 0
  %slice.source25 = getelementptr inbounds [2 x [28 x [28 x [96 x float]]]]* %call.4, i64 0, i64 %138, i64 %139, i64 %140, i64 0
  %141 = bitcast float* %slice.dest24 to i8*
  %142 = bitcast float* %slice.source25 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %141, i8* align 4 %142, i64 192, i32 0, i1 false)
  %invar.inc23 = add nuw nsw i64 %slice.5.indvar.slice.2, 1
  store i64 %invar.inc23, i64* %slice.5.invar_address.slice.2
  br label %slice.5.loop_header.slice.2

slice.5.loop_exit.slice.2:                        ; preds = %slice.5.loop_header.slice.2
  %invar.inc22 = add nuw nsw i64 %slice.5.indvar.slice.1, 1
  store i64 %invar.inc22, i64* %slice.5.invar_address.slice.1
  br label %slice.5.loop_header.slice.1

slice.5.loop_exit.slice.1:                        ; preds = %slice.5.loop_header.slice.1
  %invar.inc21 = add nuw nsw i64 %slice.5.indvar.slice.0, 1
  store i64 %invar.inc21, i64* %slice.5.invar_address.slice.0
  br label %slice.5.loop_header.slice.0

slice.5.loop_exit.slice.0:                        ; preds = %slice.5.loop_header.slice.0
  %143 = getelementptr inbounds i8** %temps, i64 25
  %144 = load i8** %143, !dereferenceable !13, !align !2
  %145 = getelementptr inbounds i8* %144, i64 11303616
  %call.5 = bitcast i8* %145 to [5 x [5 x [48 x [128 x float]]]]*
  %parallel_slice.4_parameter_0_address_as_i8ptr = bitcast [5 x [5 x [48 x [256 x float]]]]* %87 to i8*
  %146 = getelementptr inbounds i8** %parallel_slice.4_parameter_addresses, i64 0
  store i8* %parallel_slice.4_parameter_0_address_as_i8ptr, i8** %146
  %147 = bitcast [5 x [5 x [48 x [128 x float]]]]* %call.5 to i8*
  call void @__xla_cpu_runtime_ParallelForkJoin(i8* %147, i8* %run_options, i8** %parallel_slice.4_parameter_addresses, i8** %temps, i64* %prof_counters, i32 2, i64* getelementptr inbounds ([4 x i64]* @parallel_slice.4_parallel_dimension_partitions, i32 0, i32 0), i32 1, i8* bitcast (void (i8*, i8*, i8**, i8**, i64*, i64*)* @parallel_slice.4 to i8*))
  %148 = getelementptr inbounds i8** %temps, i64 25
  %149 = load i8** %148, !dereferenceable !13, !align !2
  %150 = getelementptr inbounds i8* %149, i64 3014656
  %convolution.2 = bitcast i8* %150 to [2 x [28 x [28 x [128 x float]]]]*
  store i64 0, i64* %convolution.2.invar_address.dim.0
  br label %convolution.2.loop_header.dim.0

convolution.2.loop_header.dim.0:                  ; preds = %convolution.2.loop_exit.dim.1, %slice.5.loop_exit.slice.0
  %convolution.2.indvar.dim.0 = load i64* %convolution.2.invar_address.dim.0
  %151 = icmp uge i64 %convolution.2.indvar.dim.0, 2
  br i1 %151, label %convolution.2.loop_exit.dim.0, label %convolution.2.loop_body.dim.0

convolution.2.loop_body.dim.0:                    ; preds = %convolution.2.loop_header.dim.0
  store i64 0, i64* %convolution.2.invar_address.dim.1
  br label %convolution.2.loop_header.dim.1

convolution.2.loop_header.dim.1:                  ; preds = %convolution.2.loop_exit.dim.2, %convolution.2.loop_body.dim.0
  %convolution.2.indvar.dim.1 = load i64* %convolution.2.invar_address.dim.1
  %152 = icmp uge i64 %convolution.2.indvar.dim.1, 28
  br i1 %152, label %convolution.2.loop_exit.dim.1, label %convolution.2.loop_body.dim.1

convolution.2.loop_body.dim.1:                    ; preds = %convolution.2.loop_header.dim.1
  store i64 0, i64* %convolution.2.invar_address.dim.2
  br label %convolution.2.loop_header.dim.2

convolution.2.loop_header.dim.2:                  ; preds = %convolution.2.loop_exit.dim.3, %convolution.2.loop_body.dim.1
  %convolution.2.indvar.dim.2 = load i64* %convolution.2.invar_address.dim.2
  %153 = icmp uge i64 %convolution.2.indvar.dim.2, 28
  br i1 %153, label %convolution.2.loop_exit.dim.2, label %convolution.2.loop_body.dim.2

convolution.2.loop_body.dim.2:                    ; preds = %convolution.2.loop_header.dim.2
  store i64 0, i64* %convolution.2.invar_address.dim.3
  br label %convolution.2.loop_header.dim.3

convolution.2.loop_header.dim.3:                  ; preds = %convolution.2.inner.loop_exit.k0, %convolution.2.loop_body.dim.2
  %convolution.2.indvar.dim.3 = load i64* %convolution.2.invar_address.dim.3
  %154 = icmp uge i64 %convolution.2.indvar.dim.3, 128
  br i1 %154, label %convolution.2.loop_exit.dim.3, label %convolution.2.loop_body.dim.3

convolution.2.loop_body.dim.3:                    ; preds = %convolution.2.loop_header.dim.3
  store float 0.000000e+00, float* %convolution_sum_address30
  store i64 0, i64* %convolution.2.inner.invar_address.k0
  br label %convolution.2.inner.loop_header.k0

convolution.2.inner.loop_header.k0:               ; preds = %convolution.2.inner.loop_exit.k1, %convolution.2.loop_body.dim.3
  %convolution.2.inner.indvar.k0 = load i64* %convolution.2.inner.invar_address.k0
  %155 = icmp uge i64 %convolution.2.inner.indvar.k0, 5
  br i1 %155, label %convolution.2.inner.loop_exit.k0, label %convolution.2.inner.loop_body.k0

convolution.2.inner.loop_body.k0:                 ; preds = %convolution.2.inner.loop_header.k0
  store i64 0, i64* %convolution.2.inner.invar_address.k1
  br label %convolution.2.inner.loop_header.k1

convolution.2.inner.loop_header.k1:               ; preds = %convolution.2.inner.loop_exit.iz, %convolution.2.inner.loop_body.k0
  %convolution.2.inner.indvar.k1 = load i64* %convolution.2.inner.invar_address.k1
  %156 = icmp uge i64 %convolution.2.inner.indvar.k1, 5
  br i1 %156, label %convolution.2.inner.loop_exit.k1, label %convolution.2.inner.loop_body.k1

convolution.2.inner.loop_body.k1:                 ; preds = %convolution.2.inner.loop_header.k1
  store i64 0, i64* %convolution.2.inner.invar_address.iz
  br label %convolution.2.inner.loop_header.iz

convolution.2.inner.loop_header.iz:               ; preds = %in-bounds-after36, %convolution.2.inner.loop_body.k1
  %convolution.2.inner.indvar.iz = load i64* %convolution.2.inner.invar_address.iz
  %157 = icmp uge i64 %convolution.2.inner.indvar.iz, 48
  br i1 %157, label %convolution.2.inner.loop_exit.iz, label %convolution.2.inner.loop_body.iz

convolution.2.inner.loop_body.iz:                 ; preds = %convolution.2.inner.loop_header.iz
  %158 = mul nsw i64 %convolution.2.indvar.dim.1, 1
  %159 = mul nsw i64 %convolution.2.inner.indvar.k0, 1
  %160 = add nsw i64 %158, %159
  %161 = sub nsw i64 %160, 2
  %162 = mul nsw i64 %convolution.2.indvar.dim.2, 1
  %163 = mul nsw i64 %convolution.2.inner.indvar.k1, 1
  %164 = add nsw i64 %162, %163
  %165 = sub nsw i64 %164, 2
  %166 = icmp ult i64 %161, 28
  %167 = srem i64 %161, 1
  %168 = icmp eq i64 %167, 0
  %169 = and i1 %166, %168
  %170 = and i1 true, %169
  %171 = icmp ult i64 %165, 28
  %172 = srem i64 %165, 1
  %173 = icmp eq i64 %172, 0
  %174 = and i1 %171, %173
  %175 = and i1 %170, %174
  %176 = sdiv i64 %161, 1
  %177 = sdiv i64 %165, 1
  br i1 %175, label %in-bounds-true34, label %in-bounds-false35

in-bounds-after36:                                ; preds = %in-bounds-false35, %in-bounds-true34
  %invar.inc33 = add nuw nsw i64 %convolution.2.inner.indvar.iz, 1
  store i64 %invar.inc33, i64* %convolution.2.inner.invar_address.iz
  br label %convolution.2.inner.loop_header.iz

convolution.2.inner.loop_exit.iz:                 ; preds = %convolution.2.inner.loop_header.iz
  %invar.inc32 = add nuw nsw i64 %convolution.2.inner.indvar.k1, 1
  store i64 %invar.inc32, i64* %convolution.2.inner.invar_address.k1
  br label %convolution.2.inner.loop_header.k1

convolution.2.inner.loop_exit.k1:                 ; preds = %convolution.2.inner.loop_header.k1
  %invar.inc31 = add nuw nsw i64 %convolution.2.inner.indvar.k0, 1
  store i64 %invar.inc31, i64* %convolution.2.inner.invar_address.k0
  br label %convolution.2.inner.loop_header.k0

convolution.2.inner.loop_exit.k0:                 ; preds = %convolution.2.inner.loop_header.k0
  %178 = load float* %convolution_sum_address30
  %179 = getelementptr inbounds [2 x [28 x [28 x [128 x float]]]]* %convolution.2, i64 0, i64 %convolution.2.indvar.dim.0, i64 %convolution.2.indvar.dim.1, i64 %convolution.2.indvar.dim.2, i64 %convolution.2.indvar.dim.3
  store float %178, float* %179
  %invar.inc29 = add nuw nsw i64 %convolution.2.indvar.dim.3, 1
  store i64 %invar.inc29, i64* %convolution.2.invar_address.dim.3
  br label %convolution.2.loop_header.dim.3

convolution.2.loop_exit.dim.3:                    ; preds = %convolution.2.loop_header.dim.3
  %invar.inc28 = add nuw nsw i64 %convolution.2.indvar.dim.2, 1
  store i64 %invar.inc28, i64* %convolution.2.invar_address.dim.2
  br label %convolution.2.loop_header.dim.2

convolution.2.loop_exit.dim.2:                    ; preds = %convolution.2.loop_header.dim.2
  %invar.inc27 = add nuw nsw i64 %convolution.2.indvar.dim.1, 1
  store i64 %invar.inc27, i64* %convolution.2.invar_address.dim.1
  br label %convolution.2.loop_header.dim.1

convolution.2.loop_exit.dim.1:                    ; preds = %convolution.2.loop_header.dim.1
  %invar.inc26 = add nuw nsw i64 %convolution.2.indvar.dim.0, 1
  store i64 %invar.inc26, i64* %convolution.2.invar_address.dim.0
  br label %convolution.2.loop_header.dim.0

convolution.2.loop_exit.dim.0:                    ; preds = %convolution.2.loop_header.dim.0
  %180 = getelementptr inbounds i8** %params, i64 5
  %arg5.untyped = load i8** %180, !dereferenceable !8, !align !2
  %181 = bitcast i8* %arg5.untyped to [256 x float]*
  %182 = getelementptr inbounds i8** %temps, i64 25
  %183 = load i8** %182, !dereferenceable !13, !align !2
  %184 = getelementptr inbounds i8* %183, i64 9697984
  %call.10 = bitcast i8* %184 to [2 x [28 x [28 x [256 x float]]]]*
  %parallel_fusion.11_parameter_0_address_as_i8ptr = bitcast [256 x float]* %181 to i8*
  %185 = getelementptr inbounds i8** %parallel_fusion.11_parameter_addresses, i64 0
  store i8* %parallel_fusion.11_parameter_0_address_as_i8ptr, i8** %185
  %parallel_fusion.11_parameter_1_address_as_i8ptr = bitcast [2 x [28 x [28 x [128 x float]]]]* %convolution.2 to i8*
  %186 = getelementptr inbounds i8** %parallel_fusion.11_parameter_addresses, i64 1
  store i8* %parallel_fusion.11_parameter_1_address_as_i8ptr, i8** %186
  %parallel_fusion.11_parameter_2_address_as_i8ptr = bitcast [2 x [28 x [28 x [128 x float]]]]* %convolution.1 to i8*
  %187 = getelementptr inbounds i8** %parallel_fusion.11_parameter_addresses, i64 2
  store i8* %parallel_fusion.11_parameter_2_address_as_i8ptr, i8** %187
  %188 = getelementptr inbounds i8** %parallel_fusion.11_parameter_addresses, i64 3
  store i8* bitcast (float* @0 to i8*), i8** %188
  %189 = bitcast [2 x [28 x [28 x [256 x float]]]]* %call.10 to i8*
  call void @__xla_cpu_runtime_ParallelForkJoin(i8* %189, i8* %run_options, i8** %parallel_fusion.11_parameter_addresses, i8** %temps, i64* %prof_counters, i32 2, i64* getelementptr inbounds ([4 x i64]* @parallel_fusion.11_parallel_dimension_partitions, i32 0, i32 0), i32 1, i8* bitcast (void (i8*, i8*, i8**, i8**, i64*, i64*)* @parallel_fusion.11 to i8*))
  %190 = getelementptr inbounds i8** %temps, i64 25
  %191 = load i8** %190, !dereferenceable !13, !align !2
  %192 = getelementptr inbounds i8* %191, i64 14413248
  %call.6 = bitcast i8* %192 to [2 x [28 x [28 x [256 x float]]]]*
  %parallel_reduce-window.2_parameter_0_address_as_i8ptr = bitcast [2 x [28 x [28 x [256 x float]]]]* %call.10 to i8*
  %193 = getelementptr inbounds i8** %parallel_reduce-window.2_parameter_addresses, i64 0
  store i8* %parallel_reduce-window.2_parameter_0_address_as_i8ptr, i8** %193
  %194 = getelementptr inbounds i8** %parallel_reduce-window.2_parameter_addresses, i64 1
  store i8* bitcast (float* @0 to i8*), i8** %194
  %195 = bitcast [2 x [28 x [28 x [256 x float]]]]* %call.6 to i8*
  call void @__xla_cpu_runtime_ParallelForkJoin(i8* %195, i8* %run_options, i8** %parallel_reduce-window.2_parameter_addresses, i8** %temps, i64* %prof_counters, i32 2, i64* getelementptr inbounds ([4 x i64]* @parallel_reduce-window.2_parallel_dimension_partitions, i32 0, i32 0), i32 1, i8* bitcast (void (i8*, i8*, i8**, i8**, i64*, i64*)* @parallel_reduce-window.2 to i8*))
  %196 = getelementptr inbounds i8** %temps, i64 25
  %197 = load i8** %196, !dereferenceable !13, !align !2
  %198 = getelementptr inbounds i8* %197, i64 9697984
  %call.9 = bitcast i8* %198 to [2 x [28 x [28 x [256 x float]]]]*
  %199 = getelementptr inbounds i8** %parallel_fusion.10_parameter_addresses, i64 0
  store i8* bitcast (float* @3 to i8*), i8** %199
  %parallel_fusion.10_parameter_1_address_as_i8ptr = bitcast [2 x [28 x [28 x [256 x float]]]]* %call.6 to i8*
  %200 = getelementptr inbounds i8** %parallel_fusion.10_parameter_addresses, i64 1
  store i8* %parallel_fusion.10_parameter_1_address_as_i8ptr, i8** %200
  %201 = getelementptr inbounds i8** %parallel_fusion.10_parameter_addresses, i64 2
  store i8* bitcast (float* @2 to i8*), i8** %201
  %202 = getelementptr inbounds i8** %parallel_fusion.10_parameter_addresses, i64 3
  store i8* bitcast (float* @1 to i8*), i8** %202
  %parallel_fusion.10_parameter_4_address_as_i8ptr = bitcast [256 x float]* %181 to i8*
  %203 = getelementptr inbounds i8** %parallel_fusion.10_parameter_addresses, i64 4
  store i8* %parallel_fusion.10_parameter_4_address_as_i8ptr, i8** %203
  %parallel_fusion.10_parameter_5_address_as_i8ptr = bitcast [2 x [28 x [28 x [128 x float]]]]* %convolution.2 to i8*
  %204 = getelementptr inbounds i8** %parallel_fusion.10_parameter_addresses, i64 5
  store i8* %parallel_fusion.10_parameter_5_address_as_i8ptr, i8** %204
  %parallel_fusion.10_parameter_6_address_as_i8ptr = bitcast [2 x [28 x [28 x [128 x float]]]]* %convolution.1 to i8*
  %205 = getelementptr inbounds i8** %parallel_fusion.10_parameter_addresses, i64 6
  store i8* %parallel_fusion.10_parameter_6_address_as_i8ptr, i8** %205
  %206 = getelementptr inbounds i8** %parallel_fusion.10_parameter_addresses, i64 7
  store i8* bitcast (float* @0 to i8*), i8** %206
  %207 = bitcast [2 x [28 x [28 x [256 x float]]]]* %call.9 to i8*
  call void @__xla_cpu_runtime_ParallelForkJoin(i8* %207, i8* %run_options, i8** %parallel_fusion.10_parameter_addresses, i8** %temps, i64* %prof_counters, i32 2, i64* getelementptr inbounds ([4 x i64]* @parallel_fusion.10_parallel_dimension_partitions, i32 0, i32 0), i32 1, i8* bitcast (void (i8*, i8*, i8**, i8**, i64*, i64*)* @parallel_fusion.10 to i8*))
  %208 = getelementptr inbounds i8** %temps, i64 25
  %209 = load i8** %208, !dereferenceable !13, !align !2
  %210 = getelementptr inbounds i8* %209, i64 2731008
  %reduce-window.3 = bitcast i8* %210 to [2 x [13 x [13 x [256 x float]]]]*
  store i64 0, i64* %reduce-window.3.invar_address.dim.0
  br label %reduce-window.3.loop_header.dim.0

in-bounds-true34:                                 ; preds = %convolution.2.inner.loop_body.iz
  %211 = getelementptr inbounds [5 x [5 x [48 x [128 x float]]]]* %call.5, i64 0, i64 %convolution.2.inner.indvar.k0, i64 %convolution.2.inner.indvar.k1, i64 %convolution.2.inner.indvar.iz, i64 %convolution.2.indvar.dim.3
  %212 = load float* %211
  %213 = getelementptr inbounds [2 x [28 x [28 x [48 x float]]]]* %slice.5, i64 0, i64 %convolution.2.indvar.dim.0, i64 %176, i64 %177, i64 %convolution.2.inner.indvar.iz
  %214 = load float* %213
  %215 = fmul float %214, %212
  %216 = load float* %convolution_sum_address30
  %217 = fadd float %216, %215
  store float %217, float* %convolution_sum_address30
  br label %in-bounds-after36

in-bounds-false35:                                ; preds = %convolution.2.inner.loop_body.iz
  br label %in-bounds-after36

reduce-window.3.loop_header.dim.0:                ; preds = %reduce-window.3.loop_exit.dim.1, %convolution.2.loop_exit.dim.0
  %reduce-window.3.indvar.dim.0 = load i64* %reduce-window.3.invar_address.dim.0
  %218 = icmp uge i64 %reduce-window.3.indvar.dim.0, 2
  br i1 %218, label %reduce-window.3.loop_exit.dim.0, label %reduce-window.3.loop_body.dim.0

reduce-window.3.loop_body.dim.0:                  ; preds = %reduce-window.3.loop_header.dim.0
  store i64 0, i64* %reduce-window.3.invar_address.dim.1
  br label %reduce-window.3.loop_header.dim.1

reduce-window.3.loop_header.dim.1:                ; preds = %reduce-window.3.loop_exit.dim.2, %reduce-window.3.loop_body.dim.0
  %reduce-window.3.indvar.dim.1 = load i64* %reduce-window.3.invar_address.dim.1
  %219 = icmp uge i64 %reduce-window.3.indvar.dim.1, 13
  br i1 %219, label %reduce-window.3.loop_exit.dim.1, label %reduce-window.3.loop_body.dim.1

reduce-window.3.loop_body.dim.1:                  ; preds = %reduce-window.3.loop_header.dim.1
  store i64 0, i64* %reduce-window.3.invar_address.dim.2
  br label %reduce-window.3.loop_header.dim.2

reduce-window.3.loop_header.dim.2:                ; preds = %reduce-window.3.loop_exit.dim.3, %reduce-window.3.loop_body.dim.1
  %reduce-window.3.indvar.dim.2 = load i64* %reduce-window.3.invar_address.dim.2
  %220 = icmp uge i64 %reduce-window.3.indvar.dim.2, 13
  br i1 %220, label %reduce-window.3.loop_exit.dim.2, label %reduce-window.3.loop_body.dim.2

reduce-window.3.loop_body.dim.2:                  ; preds = %reduce-window.3.loop_header.dim.2
  store i64 0, i64* %reduce-window.3.invar_address.dim.3
  br label %reduce-window.3.loop_header.dim.3

reduce-window.3.loop_header.dim.3:                ; preds = %reduce-window.3.inner.loop_exit.window.0, %reduce-window.3.loop_body.dim.2
  %reduce-window.3.indvar.dim.3 = load i64* %reduce-window.3.invar_address.dim.3
  %221 = icmp uge i64 %reduce-window.3.indvar.dim.3, 256
  br i1 %221, label %reduce-window.3.loop_exit.dim.3, label %reduce-window.3.loop_body.dim.3

reduce-window.3.loop_body.dim.3:                  ; preds = %reduce-window.3.loop_header.dim.3
  %222 = load float* @4
  store float %222, float* %reduce_window_accumulator_address
  store i64 0, i64* %reduce-window.3.inner.invar_address.window.0
  br label %reduce-window.3.inner.loop_header.window.0

reduce-window.3.inner.loop_header.window.0:       ; preds = %reduce-window.3.inner.loop_exit.window.1, %reduce-window.3.loop_body.dim.3
  %reduce-window.3.inner.indvar.window.0 = load i64* %reduce-window.3.inner.invar_address.window.0
  %223 = icmp uge i64 %reduce-window.3.inner.indvar.window.0, 1
  br i1 %223, label %reduce-window.3.inner.loop_exit.window.0, label %reduce-window.3.inner.loop_body.window.0

reduce-window.3.inner.loop_body.window.0:         ; preds = %reduce-window.3.inner.loop_header.window.0
  store i64 0, i64* %reduce-window.3.inner.invar_address.window.1
  br label %reduce-window.3.inner.loop_header.window.1

reduce-window.3.inner.loop_header.window.1:       ; preds = %reduce-window.3.inner.loop_exit.window.2, %reduce-window.3.inner.loop_body.window.0
  %reduce-window.3.inner.indvar.window.1 = load i64* %reduce-window.3.inner.invar_address.window.1
  %224 = icmp uge i64 %reduce-window.3.inner.indvar.window.1, 3
  br i1 %224, label %reduce-window.3.inner.loop_exit.window.1, label %reduce-window.3.inner.loop_body.window.1

reduce-window.3.inner.loop_body.window.1:         ; preds = %reduce-window.3.inner.loop_header.window.1
  store i64 0, i64* %reduce-window.3.inner.invar_address.window.2
  br label %reduce-window.3.inner.loop_header.window.2

reduce-window.3.inner.loop_header.window.2:       ; preds = %reduce-window.3.inner.loop_exit.window.3, %reduce-window.3.inner.loop_body.window.1
  %reduce-window.3.inner.indvar.window.2 = load i64* %reduce-window.3.inner.invar_address.window.2
  %225 = icmp uge i64 %reduce-window.3.inner.indvar.window.2, 3
  br i1 %225, label %reduce-window.3.inner.loop_exit.window.2, label %reduce-window.3.inner.loop_body.window.2

reduce-window.3.inner.loop_body.window.2:         ; preds = %reduce-window.3.inner.loop_header.window.2
  store i64 0, i64* %reduce-window.3.inner.invar_address.window.3
  br label %reduce-window.3.inner.loop_header.window.3

reduce-window.3.inner.loop_header.window.3:       ; preds = %in-bounds-after47, %reduce-window.3.inner.loop_body.window.2
  %reduce-window.3.inner.indvar.window.3 = load i64* %reduce-window.3.inner.invar_address.window.3
  %226 = icmp uge i64 %reduce-window.3.inner.indvar.window.3, 1
  br i1 %226, label %reduce-window.3.inner.loop_exit.window.3, label %reduce-window.3.inner.loop_body.window.3

reduce-window.3.inner.loop_body.window.3:         ; preds = %reduce-window.3.inner.loop_header.window.3
  %227 = mul nsw i64 %reduce-window.3.indvar.dim.0, 1
  %228 = add nsw i64 %227, %reduce-window.3.inner.indvar.window.0
  %229 = sub nsw i64 %228, 0
  %230 = icmp ult i64 %229, 2
  %231 = mul nsw i64 %reduce-window.3.indvar.dim.1, 2
  %232 = add nsw i64 %231, %reduce-window.3.inner.indvar.window.1
  %233 = sub nsw i64 %232, 0
  %234 = icmp ult i64 %233, 28
  %235 = and i1 %230, %234
  %236 = mul nsw i64 %reduce-window.3.indvar.dim.2, 2
  %237 = add nsw i64 %236, %reduce-window.3.inner.indvar.window.2
  %238 = sub nsw i64 %237, 0
  %239 = icmp ult i64 %238, 28
  %240 = and i1 %235, %239
  %241 = mul nsw i64 %reduce-window.3.indvar.dim.3, 1
  %242 = add nsw i64 %241, %reduce-window.3.inner.indvar.window.3
  %243 = sub nsw i64 %242, 0
  %244 = icmp ult i64 %243, 256
  %245 = and i1 %240, %244
  br i1 %245, label %in-bounds-true45, label %in-bounds-false46

in-bounds-after47:                                ; preds = %in-bounds-false46, %in-bounds-true45
  %invar.inc44 = add nuw nsw i64 %reduce-window.3.inner.indvar.window.3, 1
  store i64 %invar.inc44, i64* %reduce-window.3.inner.invar_address.window.3
  br label %reduce-window.3.inner.loop_header.window.3

reduce-window.3.inner.loop_exit.window.3:         ; preds = %reduce-window.3.inner.loop_header.window.3
  %invar.inc43 = add nuw nsw i64 %reduce-window.3.inner.indvar.window.2, 1
  store i64 %invar.inc43, i64* %reduce-window.3.inner.invar_address.window.2
  br label %reduce-window.3.inner.loop_header.window.2

reduce-window.3.inner.loop_exit.window.2:         ; preds = %reduce-window.3.inner.loop_header.window.2
  %invar.inc42 = add nuw nsw i64 %reduce-window.3.inner.indvar.window.1, 1
  store i64 %invar.inc42, i64* %reduce-window.3.inner.invar_address.window.1
  br label %reduce-window.3.inner.loop_header.window.1

reduce-window.3.inner.loop_exit.window.1:         ; preds = %reduce-window.3.inner.loop_header.window.1
  %invar.inc41 = add nuw nsw i64 %reduce-window.3.inner.indvar.window.0, 1
  store i64 %invar.inc41, i64* %reduce-window.3.inner.invar_address.window.0
  br label %reduce-window.3.inner.loop_header.window.0

reduce-window.3.inner.loop_exit.window.0:         ; preds = %reduce-window.3.inner.loop_header.window.0
  %246 = load float* %reduce_window_accumulator_address
  %247 = getelementptr inbounds [2 x [13 x [13 x [256 x float]]]]* %reduce-window.3, i64 0, i64 %reduce-window.3.indvar.dim.0, i64 %reduce-window.3.indvar.dim.1, i64 %reduce-window.3.indvar.dim.2, i64 %reduce-window.3.indvar.dim.3
  store float %246, float* %247
  %invar.inc40 = add nuw nsw i64 %reduce-window.3.indvar.dim.3, 1
  store i64 %invar.inc40, i64* %reduce-window.3.invar_address.dim.3
  br label %reduce-window.3.loop_header.dim.3

reduce-window.3.loop_exit.dim.3:                  ; preds = %reduce-window.3.loop_header.dim.3
  %invar.inc39 = add nuw nsw i64 %reduce-window.3.indvar.dim.2, 1
  store i64 %invar.inc39, i64* %reduce-window.3.invar_address.dim.2
  br label %reduce-window.3.loop_header.dim.2

reduce-window.3.loop_exit.dim.2:                  ; preds = %reduce-window.3.loop_header.dim.2
  %invar.inc38 = add nuw nsw i64 %reduce-window.3.indvar.dim.1, 1
  store i64 %invar.inc38, i64* %reduce-window.3.invar_address.dim.1
  br label %reduce-window.3.loop_header.dim.1

reduce-window.3.loop_exit.dim.1:                  ; preds = %reduce-window.3.loop_header.dim.1
  %invar.inc37 = add nuw nsw i64 %reduce-window.3.indvar.dim.0, 1
  store i64 %invar.inc37, i64* %reduce-window.3.invar_address.dim.0
  br label %reduce-window.3.loop_header.dim.0

reduce-window.3.loop_exit.dim.0:                  ; preds = %reduce-window.3.loop_header.dim.0
  %248 = getelementptr inbounds i8** %params, i64 6
  %arg6.untyped = load i8** %248, !dereferenceable !14, !align !2
  %249 = bitcast i8* %arg6.untyped to [3 x [3 x [256 x [384 x float]]]]*
  %250 = getelementptr inbounds i8** %temps, i64 25
  %251 = load i8** %250, !dereferenceable !13, !align !2
  %252 = getelementptr inbounds i8* %251, i64 2211840
  %convolution.3 = bitcast i8* %252 to [2 x [13 x [13 x [384 x float]]]]*
  store i64 0, i64* %convolution.3.invar_address.dim.0
  br label %convolution.3.loop_header.dim.0

in-bounds-true45:                                 ; preds = %reduce-window.3.inner.loop_body.window.3
  %253 = getelementptr inbounds [2 x [28 x [28 x [256 x float]]]]* %call.9, i64 0, i64 %229, i64 %233, i64 %238, i64 %243
  %reducer_function_parameter_0_address_as_i8ptr = bitcast float* %reduce_window_accumulator_address to i8*
  %254 = getelementptr inbounds i8** %reducer_function_parameter_addresses, i64 0
  store i8* %reducer_function_parameter_0_address_as_i8ptr, i8** %254
  %reducer_function_parameter_1_address_as_i8ptr = bitcast float* %253 to i8*
  %255 = getelementptr inbounds i8** %reducer_function_parameter_addresses, i64 1
  store i8* %reducer_function_parameter_1_address_as_i8ptr, i8** %255
  %256 = bitcast float* %reducer_function_return_value_address to i8*
  call void @max_float_.v3(i8* %256, i8* %run_options, i8** %reducer_function_parameter_addresses, i8** %temps, i64* %prof_counters)
  %reducer_function_return_value = load float* %reducer_function_return_value_address
  store float %reducer_function_return_value, float* %reduce_window_accumulator_address
  br label %in-bounds-after47

in-bounds-false46:                                ; preds = %reduce-window.3.inner.loop_body.window.3
  br label %in-bounds-after47

convolution.3.loop_header.dim.0:                  ; preds = %convolution.3.loop_exit.dim.1, %reduce-window.3.loop_exit.dim.0
  %convolution.3.indvar.dim.0 = load i64* %convolution.3.invar_address.dim.0
  %257 = icmp uge i64 %convolution.3.indvar.dim.0, 2
  br i1 %257, label %convolution.3.loop_exit.dim.0, label %convolution.3.loop_body.dim.0

convolution.3.loop_body.dim.0:                    ; preds = %convolution.3.loop_header.dim.0
  store i64 0, i64* %convolution.3.invar_address.dim.1
  br label %convolution.3.loop_header.dim.1

convolution.3.loop_header.dim.1:                  ; preds = %convolution.3.loop_exit.dim.2, %convolution.3.loop_body.dim.0
  %convolution.3.indvar.dim.1 = load i64* %convolution.3.invar_address.dim.1
  %258 = icmp uge i64 %convolution.3.indvar.dim.1, 13
  br i1 %258, label %convolution.3.loop_exit.dim.1, label %convolution.3.loop_body.dim.1

convolution.3.loop_body.dim.1:                    ; preds = %convolution.3.loop_header.dim.1
  store i64 0, i64* %convolution.3.invar_address.dim.2
  br label %convolution.3.loop_header.dim.2

convolution.3.loop_header.dim.2:                  ; preds = %convolution.3.loop_exit.dim.3, %convolution.3.loop_body.dim.1
  %convolution.3.indvar.dim.2 = load i64* %convolution.3.invar_address.dim.2
  %259 = icmp uge i64 %convolution.3.indvar.dim.2, 13
  br i1 %259, label %convolution.3.loop_exit.dim.2, label %convolution.3.loop_body.dim.2

convolution.3.loop_body.dim.2:                    ; preds = %convolution.3.loop_header.dim.2
  store i64 0, i64* %convolution.3.invar_address.dim.3
  br label %convolution.3.loop_header.dim.3

convolution.3.loop_header.dim.3:                  ; preds = %convolution.3.inner.loop_exit.k0, %convolution.3.loop_body.dim.2
  %convolution.3.indvar.dim.3 = load i64* %convolution.3.invar_address.dim.3
  %260 = icmp uge i64 %convolution.3.indvar.dim.3, 384
  br i1 %260, label %convolution.3.loop_exit.dim.3, label %convolution.3.loop_body.dim.3

convolution.3.loop_body.dim.3:                    ; preds = %convolution.3.loop_header.dim.3
  store float 0.000000e+00, float* %convolution_sum_address52
  store i64 0, i64* %convolution.3.inner.invar_address.k0
  br label %convolution.3.inner.loop_header.k0

convolution.3.inner.loop_header.k0:               ; preds = %convolution.3.inner.loop_exit.k1, %convolution.3.loop_body.dim.3
  %convolution.3.inner.indvar.k0 = load i64* %convolution.3.inner.invar_address.k0
  %261 = icmp uge i64 %convolution.3.inner.indvar.k0, 3
  br i1 %261, label %convolution.3.inner.loop_exit.k0, label %convolution.3.inner.loop_body.k0

convolution.3.inner.loop_body.k0:                 ; preds = %convolution.3.inner.loop_header.k0
  store i64 0, i64* %convolution.3.inner.invar_address.k1
  br label %convolution.3.inner.loop_header.k1

convolution.3.inner.loop_header.k1:               ; preds = %convolution.3.inner.loop_exit.iz, %convolution.3.inner.loop_body.k0
  %convolution.3.inner.indvar.k1 = load i64* %convolution.3.inner.invar_address.k1
  %262 = icmp uge i64 %convolution.3.inner.indvar.k1, 3
  br i1 %262, label %convolution.3.inner.loop_exit.k1, label %convolution.3.inner.loop_body.k1

convolution.3.inner.loop_body.k1:                 ; preds = %convolution.3.inner.loop_header.k1
  store i64 0, i64* %convolution.3.inner.invar_address.iz
  br label %convolution.3.inner.loop_header.iz

convolution.3.inner.loop_header.iz:               ; preds = %in-bounds-after58, %convolution.3.inner.loop_body.k1
  %convolution.3.inner.indvar.iz = load i64* %convolution.3.inner.invar_address.iz
  %263 = icmp uge i64 %convolution.3.inner.indvar.iz, 256
  br i1 %263, label %convolution.3.inner.loop_exit.iz, label %convolution.3.inner.loop_body.iz

convolution.3.inner.loop_body.iz:                 ; preds = %convolution.3.inner.loop_header.iz
  %264 = mul nsw i64 %convolution.3.indvar.dim.1, 1
  %265 = mul nsw i64 %convolution.3.inner.indvar.k0, 1
  %266 = add nsw i64 %264, %265
  %267 = sub nsw i64 %266, 1
  %268 = mul nsw i64 %convolution.3.indvar.dim.2, 1
  %269 = mul nsw i64 %convolution.3.inner.indvar.k1, 1
  %270 = add nsw i64 %268, %269
  %271 = sub nsw i64 %270, 1
  %272 = icmp ult i64 %267, 13
  %273 = srem i64 %267, 1
  %274 = icmp eq i64 %273, 0
  %275 = and i1 %272, %274
  %276 = and i1 true, %275
  %277 = icmp ult i64 %271, 13
  %278 = srem i64 %271, 1
  %279 = icmp eq i64 %278, 0
  %280 = and i1 %277, %279
  %281 = and i1 %276, %280
  %282 = sdiv i64 %267, 1
  %283 = sdiv i64 %271, 1
  br i1 %281, label %in-bounds-true56, label %in-bounds-false57

in-bounds-after58:                                ; preds = %in-bounds-false57, %in-bounds-true56
  %invar.inc55 = add nuw nsw i64 %convolution.3.inner.indvar.iz, 1
  store i64 %invar.inc55, i64* %convolution.3.inner.invar_address.iz
  br label %convolution.3.inner.loop_header.iz

convolution.3.inner.loop_exit.iz:                 ; preds = %convolution.3.inner.loop_header.iz
  %invar.inc54 = add nuw nsw i64 %convolution.3.inner.indvar.k1, 1
  store i64 %invar.inc54, i64* %convolution.3.inner.invar_address.k1
  br label %convolution.3.inner.loop_header.k1

convolution.3.inner.loop_exit.k1:                 ; preds = %convolution.3.inner.loop_header.k1
  %invar.inc53 = add nuw nsw i64 %convolution.3.inner.indvar.k0, 1
  store i64 %invar.inc53, i64* %convolution.3.inner.invar_address.k0
  br label %convolution.3.inner.loop_header.k0

convolution.3.inner.loop_exit.k0:                 ; preds = %convolution.3.inner.loop_header.k0
  %284 = load float* %convolution_sum_address52
  %285 = getelementptr inbounds [2 x [13 x [13 x [384 x float]]]]* %convolution.3, i64 0, i64 %convolution.3.indvar.dim.0, i64 %convolution.3.indvar.dim.1, i64 %convolution.3.indvar.dim.2, i64 %convolution.3.indvar.dim.3
  store float %284, float* %285
  %invar.inc51 = add nuw nsw i64 %convolution.3.indvar.dim.3, 1
  store i64 %invar.inc51, i64* %convolution.3.invar_address.dim.3
  br label %convolution.3.loop_header.dim.3

convolution.3.loop_exit.dim.3:                    ; preds = %convolution.3.loop_header.dim.3
  %invar.inc50 = add nuw nsw i64 %convolution.3.indvar.dim.2, 1
  store i64 %invar.inc50, i64* %convolution.3.invar_address.dim.2
  br label %convolution.3.loop_header.dim.2

convolution.3.loop_exit.dim.2:                    ; preds = %convolution.3.loop_header.dim.2
  %invar.inc49 = add nuw nsw i64 %convolution.3.indvar.dim.1, 1
  store i64 %invar.inc49, i64* %convolution.3.invar_address.dim.1
  br label %convolution.3.loop_header.dim.1

convolution.3.loop_exit.dim.1:                    ; preds = %convolution.3.loop_header.dim.1
  %invar.inc48 = add nuw nsw i64 %convolution.3.indvar.dim.0, 1
  store i64 %invar.inc48, i64* %convolution.3.invar_address.dim.0
  br label %convolution.3.loop_header.dim.0

convolution.3.loop_exit.dim.0:                    ; preds = %convolution.3.loop_header.dim.0
  %286 = getelementptr inbounds i8** %params, i64 7
  %arg7.untyped = load i8** %286, !dereferenceable !15, !align !2
  %287 = bitcast i8* %arg7.untyped to [384 x float]*
  %288 = getelementptr inbounds i8** %temps, i64 25
  %289 = load i8** %288, !dereferenceable !13, !align !2
  %290 = getelementptr inbounds i8* %289, i64 5385216
  %fusion.8 = bitcast i8* %290 to [2 x [13 x [13 x [192 x float]]]]*
  store i64 0, i64* %fusion.8.invar_address.dim.0
  br label %fusion.8.loop_header.dim.0

in-bounds-true56:                                 ; preds = %convolution.3.inner.loop_body.iz
  %291 = getelementptr inbounds [3 x [3 x [256 x [384 x float]]]]* %249, i64 0, i64 %convolution.3.inner.indvar.k0, i64 %convolution.3.inner.indvar.k1, i64 %convolution.3.inner.indvar.iz, i64 %convolution.3.indvar.dim.3
  %292 = load float* %291
  %293 = getelementptr inbounds [2 x [13 x [13 x [256 x float]]]]* %reduce-window.3, i64 0, i64 %convolution.3.indvar.dim.0, i64 %282, i64 %283, i64 %convolution.3.inner.indvar.iz
  %294 = load float* %293
  %295 = fmul float %294, %292
  %296 = load float* %convolution_sum_address52
  %297 = fadd float %296, %295
  store float %297, float* %convolution_sum_address52
  br label %in-bounds-after58

in-bounds-false57:                                ; preds = %convolution.3.inner.loop_body.iz
  br label %in-bounds-after58

fusion.8.loop_header.dim.0:                       ; preds = %fusion.8.loop_exit.dim.1, %convolution.3.loop_exit.dim.0
  %fusion.8.indvar.dim.0 = load i64* %fusion.8.invar_address.dim.0
  %298 = icmp uge i64 %fusion.8.indvar.dim.0, 2
  br i1 %298, label %fusion.8.loop_exit.dim.0, label %fusion.8.loop_body.dim.0

fusion.8.loop_body.dim.0:                         ; preds = %fusion.8.loop_header.dim.0
  store i64 0, i64* %fusion.8.invar_address.dim.1
  br label %fusion.8.loop_header.dim.1

fusion.8.loop_header.dim.1:                       ; preds = %fusion.8.loop_exit.dim.2, %fusion.8.loop_body.dim.0
  %fusion.8.indvar.dim.1 = load i64* %fusion.8.invar_address.dim.1
  %299 = icmp uge i64 %fusion.8.indvar.dim.1, 13
  br i1 %299, label %fusion.8.loop_exit.dim.1, label %fusion.8.loop_body.dim.1

fusion.8.loop_body.dim.1:                         ; preds = %fusion.8.loop_header.dim.1
  store i64 0, i64* %fusion.8.invar_address.dim.2
  br label %fusion.8.loop_header.dim.2

fusion.8.loop_header.dim.2:                       ; preds = %fusion.8.loop_exit.dim.3, %fusion.8.loop_body.dim.1
  %fusion.8.indvar.dim.2 = load i64* %fusion.8.invar_address.dim.2
  %300 = icmp uge i64 %fusion.8.indvar.dim.2, 13
  br i1 %300, label %fusion.8.loop_exit.dim.2, label %fusion.8.loop_body.dim.2

fusion.8.loop_body.dim.2:                         ; preds = %fusion.8.loop_header.dim.2
  store i64 0, i64* %fusion.8.invar_address.dim.3
  br label %fusion.8.loop_header.dim.3

fusion.8.loop_header.dim.3:                       ; preds = %fusion.8.loop_body.dim.3, %fusion.8.loop_body.dim.2
  %fusion.8.indvar.dim.3 = load i64* %fusion.8.invar_address.dim.3
  %301 = icmp uge i64 %fusion.8.indvar.dim.3, 192
  br i1 %301, label %fusion.8.loop_exit.dim.3, label %fusion.8.loop_body.dim.3

fusion.8.loop_body.dim.3:                         ; preds = %fusion.8.loop_header.dim.3
  %302 = add i64 %fusion.8.indvar.dim.0, 0
  %303 = add i64 %fusion.8.indvar.dim.1, 0
  %304 = add i64 %fusion.8.indvar.dim.2, 0
  %305 = add i64 %fusion.8.indvar.dim.3, 192
  %306 = load float* @0
  %307 = getelementptr inbounds [2 x [13 x [13 x [384 x float]]]]* %convolution.3, i64 0, i64 %302, i64 %303, i64 %304, i64 %305
  %308 = load float* %307
  %309 = getelementptr inbounds [384 x float]* %287, i64 0, i64 %305
  %310 = load float* %309
  %311 = fadd float %308, %310
  %312 = fcmp oge float %306, %311
  %313 = fcmp une float %306, %306
  %314 = or i1 %312, %313
  %315 = select i1 %314, float %306, float %311
  %316 = getelementptr inbounds [2 x [13 x [13 x [192 x float]]]]* %fusion.8, i64 0, i64 %fusion.8.indvar.dim.0, i64 %fusion.8.indvar.dim.1, i64 %fusion.8.indvar.dim.2, i64 %fusion.8.indvar.dim.3
  store float %315, float* %316
  %invar.inc62 = add nuw nsw i64 %fusion.8.indvar.dim.3, 1
  store i64 %invar.inc62, i64* %fusion.8.invar_address.dim.3
  br label %fusion.8.loop_header.dim.3

fusion.8.loop_exit.dim.3:                         ; preds = %fusion.8.loop_header.dim.3
  %invar.inc61 = add nuw nsw i64 %fusion.8.indvar.dim.2, 1
  store i64 %invar.inc61, i64* %fusion.8.invar_address.dim.2
  br label %fusion.8.loop_header.dim.2

fusion.8.loop_exit.dim.2:                         ; preds = %fusion.8.loop_header.dim.2
  %invar.inc60 = add nuw nsw i64 %fusion.8.indvar.dim.1, 1
  store i64 %invar.inc60, i64* %fusion.8.invar_address.dim.1
  br label %fusion.8.loop_header.dim.1

fusion.8.loop_exit.dim.1:                         ; preds = %fusion.8.loop_header.dim.1
  %invar.inc59 = add nuw nsw i64 %fusion.8.indvar.dim.0, 1
  store i64 %invar.inc59, i64* %fusion.8.invar_address.dim.0
  br label %fusion.8.loop_header.dim.0

fusion.8.loop_exit.dim.0:                         ; preds = %fusion.8.loop_header.dim.0
  %317 = getelementptr inbounds i8** %params, i64 3
  %arg3.untyped = load i8** %317, !dereferenceable !3, !align !2
  %318 = bitcast i8* %arg3.untyped to [3 x [3 x [192 x [384 x float]]]]*
  %319 = getelementptr inbounds i8** %temps, i64 25
  %320 = load i8** %319, !dereferenceable !13, !align !2
  %321 = getelementptr inbounds i8* %320, i64 884736
  %call.1 = bitcast i8* %321 to [3 x [3 x [192 x [192 x float]]]]*
  %parallel_slice.1_parameter_0_address_as_i8ptr = bitcast [3 x [3 x [192 x [384 x float]]]]* %318 to i8*
  %322 = getelementptr inbounds i8** %parallel_slice.1_parameter_addresses, i64 0
  store i8* %parallel_slice.1_parameter_0_address_as_i8ptr, i8** %322
  %323 = bitcast [3 x [3 x [192 x [192 x float]]]]* %call.1 to i8*
  call void @__xla_cpu_runtime_ParallelForkJoin(i8* %323, i8* %run_options, i8** %parallel_slice.1_parameter_addresses, i8** %temps, i64* %prof_counters, i32 2, i64* getelementptr inbounds ([4 x i64]* @parallel_slice.1_parallel_dimension_partitions, i32 0, i32 0), i32 1, i8* bitcast (void (i8*, i8*, i8**, i8**, i64*, i64*)* @parallel_slice.1 to i8*))
  %324 = getelementptr inbounds i8** %temps, i64 25
  %325 = load i8** %324, !dereferenceable !13, !align !2
  %326 = getelementptr inbounds i8* %325, i64 2731008
  %convolution.4 = bitcast i8* %326 to [2 x [13 x [13 x [192 x float]]]]*
  store i64 0, i64* %convolution.4.invar_address.dim.0
  br label %convolution.4.loop_header.dim.0

convolution.4.loop_header.dim.0:                  ; preds = %convolution.4.loop_exit.dim.1, %fusion.8.loop_exit.dim.0
  %convolution.4.indvar.dim.0 = load i64* %convolution.4.invar_address.dim.0
  %327 = icmp uge i64 %convolution.4.indvar.dim.0, 2
  br i1 %327, label %convolution.4.loop_exit.dim.0, label %convolution.4.loop_body.dim.0

convolution.4.loop_body.dim.0:                    ; preds = %convolution.4.loop_header.dim.0
  store i64 0, i64* %convolution.4.invar_address.dim.1
  br label %convolution.4.loop_header.dim.1

convolution.4.loop_header.dim.1:                  ; preds = %convolution.4.loop_exit.dim.2, %convolution.4.loop_body.dim.0
  %convolution.4.indvar.dim.1 = load i64* %convolution.4.invar_address.dim.1
  %328 = icmp uge i64 %convolution.4.indvar.dim.1, 13
  br i1 %328, label %convolution.4.loop_exit.dim.1, label %convolution.4.loop_body.dim.1

convolution.4.loop_body.dim.1:                    ; preds = %convolution.4.loop_header.dim.1
  store i64 0, i64* %convolution.4.invar_address.dim.2
  br label %convolution.4.loop_header.dim.2

convolution.4.loop_header.dim.2:                  ; preds = %convolution.4.loop_exit.dim.3, %convolution.4.loop_body.dim.1
  %convolution.4.indvar.dim.2 = load i64* %convolution.4.invar_address.dim.2
  %329 = icmp uge i64 %convolution.4.indvar.dim.2, 13
  br i1 %329, label %convolution.4.loop_exit.dim.2, label %convolution.4.loop_body.dim.2

convolution.4.loop_body.dim.2:                    ; preds = %convolution.4.loop_header.dim.2
  store i64 0, i64* %convolution.4.invar_address.dim.3
  br label %convolution.4.loop_header.dim.3

convolution.4.loop_header.dim.3:                  ; preds = %convolution.4.inner.loop_exit.k0, %convolution.4.loop_body.dim.2
  %convolution.4.indvar.dim.3 = load i64* %convolution.4.invar_address.dim.3
  %330 = icmp uge i64 %convolution.4.indvar.dim.3, 192
  br i1 %330, label %convolution.4.loop_exit.dim.3, label %convolution.4.loop_body.dim.3

convolution.4.loop_body.dim.3:                    ; preds = %convolution.4.loop_header.dim.3
  store float 0.000000e+00, float* %convolution_sum_address67
  store i64 0, i64* %convolution.4.inner.invar_address.k0
  br label %convolution.4.inner.loop_header.k0

convolution.4.inner.loop_header.k0:               ; preds = %convolution.4.inner.loop_exit.k1, %convolution.4.loop_body.dim.3
  %convolution.4.inner.indvar.k0 = load i64* %convolution.4.inner.invar_address.k0
  %331 = icmp uge i64 %convolution.4.inner.indvar.k0, 3
  br i1 %331, label %convolution.4.inner.loop_exit.k0, label %convolution.4.inner.loop_body.k0

convolution.4.inner.loop_body.k0:                 ; preds = %convolution.4.inner.loop_header.k0
  store i64 0, i64* %convolution.4.inner.invar_address.k1
  br label %convolution.4.inner.loop_header.k1

convolution.4.inner.loop_header.k1:               ; preds = %convolution.4.inner.loop_exit.iz, %convolution.4.inner.loop_body.k0
  %convolution.4.inner.indvar.k1 = load i64* %convolution.4.inner.invar_address.k1
  %332 = icmp uge i64 %convolution.4.inner.indvar.k1, 3
  br i1 %332, label %convolution.4.inner.loop_exit.k1, label %convolution.4.inner.loop_body.k1

convolution.4.inner.loop_body.k1:                 ; preds = %convolution.4.inner.loop_header.k1
  store i64 0, i64* %convolution.4.inner.invar_address.iz
  br label %convolution.4.inner.loop_header.iz

convolution.4.inner.loop_header.iz:               ; preds = %in-bounds-after73, %convolution.4.inner.loop_body.k1
  %convolution.4.inner.indvar.iz = load i64* %convolution.4.inner.invar_address.iz
  %333 = icmp uge i64 %convolution.4.inner.indvar.iz, 192
  br i1 %333, label %convolution.4.inner.loop_exit.iz, label %convolution.4.inner.loop_body.iz

convolution.4.inner.loop_body.iz:                 ; preds = %convolution.4.inner.loop_header.iz
  %334 = mul nsw i64 %convolution.4.indvar.dim.1, 1
  %335 = mul nsw i64 %convolution.4.inner.indvar.k0, 1
  %336 = add nsw i64 %334, %335
  %337 = sub nsw i64 %336, 1
  %338 = mul nsw i64 %convolution.4.indvar.dim.2, 1
  %339 = mul nsw i64 %convolution.4.inner.indvar.k1, 1
  %340 = add nsw i64 %338, %339
  %341 = sub nsw i64 %340, 1
  %342 = icmp ult i64 %337, 13
  %343 = srem i64 %337, 1
  %344 = icmp eq i64 %343, 0
  %345 = and i1 %342, %344
  %346 = and i1 true, %345
  %347 = icmp ult i64 %341, 13
  %348 = srem i64 %341, 1
  %349 = icmp eq i64 %348, 0
  %350 = and i1 %347, %349
  %351 = and i1 %346, %350
  %352 = sdiv i64 %337, 1
  %353 = sdiv i64 %341, 1
  br i1 %351, label %in-bounds-true71, label %in-bounds-false72

in-bounds-after73:                                ; preds = %in-bounds-false72, %in-bounds-true71
  %invar.inc70 = add nuw nsw i64 %convolution.4.inner.indvar.iz, 1
  store i64 %invar.inc70, i64* %convolution.4.inner.invar_address.iz
  br label %convolution.4.inner.loop_header.iz

convolution.4.inner.loop_exit.iz:                 ; preds = %convolution.4.inner.loop_header.iz
  %invar.inc69 = add nuw nsw i64 %convolution.4.inner.indvar.k1, 1
  store i64 %invar.inc69, i64* %convolution.4.inner.invar_address.k1
  br label %convolution.4.inner.loop_header.k1

convolution.4.inner.loop_exit.k1:                 ; preds = %convolution.4.inner.loop_header.k1
  %invar.inc68 = add nuw nsw i64 %convolution.4.inner.indvar.k0, 1
  store i64 %invar.inc68, i64* %convolution.4.inner.invar_address.k0
  br label %convolution.4.inner.loop_header.k0

convolution.4.inner.loop_exit.k0:                 ; preds = %convolution.4.inner.loop_header.k0
  %354 = load float* %convolution_sum_address67
  %355 = getelementptr inbounds [2 x [13 x [13 x [192 x float]]]]* %convolution.4, i64 0, i64 %convolution.4.indvar.dim.0, i64 %convolution.4.indvar.dim.1, i64 %convolution.4.indvar.dim.2, i64 %convolution.4.indvar.dim.3
  store float %354, float* %355
  %invar.inc66 = add nuw nsw i64 %convolution.4.indvar.dim.3, 1
  store i64 %invar.inc66, i64* %convolution.4.invar_address.dim.3
  br label %convolution.4.loop_header.dim.3

convolution.4.loop_exit.dim.3:                    ; preds = %convolution.4.loop_header.dim.3
  %invar.inc65 = add nuw nsw i64 %convolution.4.indvar.dim.2, 1
  store i64 %invar.inc65, i64* %convolution.4.invar_address.dim.2
  br label %convolution.4.loop_header.dim.2

convolution.4.loop_exit.dim.2:                    ; preds = %convolution.4.loop_header.dim.2
  %invar.inc64 = add nuw nsw i64 %convolution.4.indvar.dim.1, 1
  store i64 %invar.inc64, i64* %convolution.4.invar_address.dim.1
  br label %convolution.4.loop_header.dim.1

convolution.4.loop_exit.dim.1:                    ; preds = %convolution.4.loop_header.dim.1
  %invar.inc63 = add nuw nsw i64 %convolution.4.indvar.dim.0, 1
  store i64 %invar.inc63, i64* %convolution.4.invar_address.dim.0
  br label %convolution.4.loop_header.dim.0

convolution.4.loop_exit.dim.0:                    ; preds = %convolution.4.loop_header.dim.0
  %356 = getelementptr inbounds i8** %temps, i64 25
  %357 = load i8** %356, !dereferenceable !13, !align !2
  %358 = getelementptr inbounds i8* %357, i64 2990592
  %fusion.9 = bitcast i8* %358 to [2 x [13 x [13 x [192 x float]]]]*
  store i64 0, i64* %fusion.9.invar_address.dim.0
  br label %fusion.9.loop_header.dim.0

in-bounds-true71:                                 ; preds = %convolution.4.inner.loop_body.iz
  %359 = getelementptr inbounds [3 x [3 x [192 x [192 x float]]]]* %call.1, i64 0, i64 %convolution.4.inner.indvar.k0, i64 %convolution.4.inner.indvar.k1, i64 %convolution.4.inner.indvar.iz, i64 %convolution.4.indvar.dim.3
  %360 = load float* %359
  %361 = getelementptr inbounds [2 x [13 x [13 x [192 x float]]]]* %fusion.8, i64 0, i64 %convolution.4.indvar.dim.0, i64 %352, i64 %353, i64 %convolution.4.inner.indvar.iz
  %362 = load float* %361
  %363 = fmul float %362, %360
  %364 = load float* %convolution_sum_address67
  %365 = fadd float %364, %363
  store float %365, float* %convolution_sum_address67
  br label %in-bounds-after73

in-bounds-false72:                                ; preds = %convolution.4.inner.loop_body.iz
  br label %in-bounds-after73

fusion.9.loop_header.dim.0:                       ; preds = %fusion.9.loop_exit.dim.1, %convolution.4.loop_exit.dim.0
  %fusion.9.indvar.dim.0 = load i64* %fusion.9.invar_address.dim.0
  %366 = icmp uge i64 %fusion.9.indvar.dim.0, 2
  br i1 %366, label %fusion.9.loop_exit.dim.0, label %fusion.9.loop_body.dim.0

fusion.9.loop_body.dim.0:                         ; preds = %fusion.9.loop_header.dim.0
  store i64 0, i64* %fusion.9.invar_address.dim.1
  br label %fusion.9.loop_header.dim.1

fusion.9.loop_header.dim.1:                       ; preds = %fusion.9.loop_exit.dim.2, %fusion.9.loop_body.dim.0
  %fusion.9.indvar.dim.1 = load i64* %fusion.9.invar_address.dim.1
  %367 = icmp uge i64 %fusion.9.indvar.dim.1, 13
  br i1 %367, label %fusion.9.loop_exit.dim.1, label %fusion.9.loop_body.dim.1

fusion.9.loop_body.dim.1:                         ; preds = %fusion.9.loop_header.dim.1
  store i64 0, i64* %fusion.9.invar_address.dim.2
  br label %fusion.9.loop_header.dim.2

fusion.9.loop_header.dim.2:                       ; preds = %fusion.9.loop_exit.dim.3, %fusion.9.loop_body.dim.1
  %fusion.9.indvar.dim.2 = load i64* %fusion.9.invar_address.dim.2
  %368 = icmp uge i64 %fusion.9.indvar.dim.2, 13
  br i1 %368, label %fusion.9.loop_exit.dim.2, label %fusion.9.loop_body.dim.2

fusion.9.loop_body.dim.2:                         ; preds = %fusion.9.loop_header.dim.2
  store i64 0, i64* %fusion.9.invar_address.dim.3
  br label %fusion.9.loop_header.dim.3

fusion.9.loop_header.dim.3:                       ; preds = %fusion.9.loop_body.dim.3, %fusion.9.loop_body.dim.2
  %fusion.9.indvar.dim.3 = load i64* %fusion.9.invar_address.dim.3
  %369 = icmp uge i64 %fusion.9.indvar.dim.3, 192
  br i1 %369, label %fusion.9.loop_exit.dim.3, label %fusion.9.loop_body.dim.3

fusion.9.loop_body.dim.3:                         ; preds = %fusion.9.loop_header.dim.3
  %370 = add i64 %fusion.9.indvar.dim.0, 0
  %371 = add i64 %fusion.9.indvar.dim.1, 0
  %372 = add i64 %fusion.9.indvar.dim.2, 0
  %373 = add i64 %fusion.9.indvar.dim.3, 0
  %374 = load float* @0
  %375 = getelementptr inbounds [2 x [13 x [13 x [384 x float]]]]* %convolution.3, i64 0, i64 %370, i64 %371, i64 %372, i64 %373
  %376 = load float* %375
  %377 = getelementptr inbounds [384 x float]* %287, i64 0, i64 %373
  %378 = load float* %377
  %379 = fadd float %376, %378
  %380 = fcmp oge float %374, %379
  %381 = fcmp une float %374, %374
  %382 = or i1 %380, %381
  %383 = select i1 %382, float %374, float %379
  %384 = getelementptr inbounds [2 x [13 x [13 x [192 x float]]]]* %fusion.9, i64 0, i64 %fusion.9.indvar.dim.0, i64 %fusion.9.indvar.dim.1, i64 %fusion.9.indvar.dim.2, i64 %fusion.9.indvar.dim.3
  store float %383, float* %384
  %invar.inc77 = add nuw nsw i64 %fusion.9.indvar.dim.3, 1
  store i64 %invar.inc77, i64* %fusion.9.invar_address.dim.3
  br label %fusion.9.loop_header.dim.3

fusion.9.loop_exit.dim.3:                         ; preds = %fusion.9.loop_header.dim.3
  %invar.inc76 = add nuw nsw i64 %fusion.9.indvar.dim.2, 1
  store i64 %invar.inc76, i64* %fusion.9.invar_address.dim.2
  br label %fusion.9.loop_header.dim.2

fusion.9.loop_exit.dim.2:                         ; preds = %fusion.9.loop_header.dim.2
  %invar.inc75 = add nuw nsw i64 %fusion.9.indvar.dim.1, 1
  store i64 %invar.inc75, i64* %fusion.9.invar_address.dim.1
  br label %fusion.9.loop_header.dim.1

fusion.9.loop_exit.dim.1:                         ; preds = %fusion.9.loop_header.dim.1
  %invar.inc74 = add nuw nsw i64 %fusion.9.indvar.dim.0, 1
  store i64 %invar.inc74, i64* %fusion.9.invar_address.dim.0
  br label %fusion.9.loop_header.dim.0

fusion.9.loop_exit.dim.0:                         ; preds = %fusion.9.loop_header.dim.0
  %385 = getelementptr inbounds i8** %temps, i64 25
  %386 = load i8** %385, !dereferenceable !13, !align !2
  %387 = getelementptr inbounds i8* %386, i64 884736
  %call.7 = bitcast i8* %387 to [3 x [3 x [192 x [192 x float]]]]*
  %parallel_slice.7_parameter_0_address_as_i8ptr = bitcast [3 x [3 x [192 x [384 x float]]]]* %318 to i8*
  %388 = getelementptr inbounds i8** %parallel_slice.7_parameter_addresses, i64 0
  store i8* %parallel_slice.7_parameter_0_address_as_i8ptr, i8** %388
  %389 = bitcast [3 x [3 x [192 x [192 x float]]]]* %call.7 to i8*
  call void @__xla_cpu_runtime_ParallelForkJoin(i8* %389, i8* %run_options, i8** %parallel_slice.7_parameter_addresses, i8** %temps, i64* %prof_counters, i32 2, i64* getelementptr inbounds ([4 x i64]* @parallel_slice.7_parallel_dimension_partitions, i32 0, i32 0), i32 1, i8* bitcast (void (i8*, i8*, i8**, i8**, i64*, i64*)* @parallel_slice.7 to i8*))
  %390 = getelementptr inbounds i8** %temps, i64 25
  %391 = load i8** %390, !dereferenceable !13, !align !2
  %392 = getelementptr inbounds i8* %391, i64 2211840
  %convolution.5 = bitcast i8* %392 to [2 x [13 x [13 x [192 x float]]]]*
  store i64 0, i64* %convolution.5.invar_address.dim.0
  br label %convolution.5.loop_header.dim.0

convolution.5.loop_header.dim.0:                  ; preds = %convolution.5.loop_exit.dim.1, %fusion.9.loop_exit.dim.0
  %convolution.5.indvar.dim.0 = load i64* %convolution.5.invar_address.dim.0
  %393 = icmp uge i64 %convolution.5.indvar.dim.0, 2
  br i1 %393, label %convolution.5.loop_exit.dim.0, label %convolution.5.loop_body.dim.0

convolution.5.loop_body.dim.0:                    ; preds = %convolution.5.loop_header.dim.0
  store i64 0, i64* %convolution.5.invar_address.dim.1
  br label %convolution.5.loop_header.dim.1

convolution.5.loop_header.dim.1:                  ; preds = %convolution.5.loop_exit.dim.2, %convolution.5.loop_body.dim.0
  %convolution.5.indvar.dim.1 = load i64* %convolution.5.invar_address.dim.1
  %394 = icmp uge i64 %convolution.5.indvar.dim.1, 13
  br i1 %394, label %convolution.5.loop_exit.dim.1, label %convolution.5.loop_body.dim.1

convolution.5.loop_body.dim.1:                    ; preds = %convolution.5.loop_header.dim.1
  store i64 0, i64* %convolution.5.invar_address.dim.2
  br label %convolution.5.loop_header.dim.2

convolution.5.loop_header.dim.2:                  ; preds = %convolution.5.loop_exit.dim.3, %convolution.5.loop_body.dim.1
  %convolution.5.indvar.dim.2 = load i64* %convolution.5.invar_address.dim.2
  %395 = icmp uge i64 %convolution.5.indvar.dim.2, 13
  br i1 %395, label %convolution.5.loop_exit.dim.2, label %convolution.5.loop_body.dim.2

convolution.5.loop_body.dim.2:                    ; preds = %convolution.5.loop_header.dim.2
  store i64 0, i64* %convolution.5.invar_address.dim.3
  br label %convolution.5.loop_header.dim.3

convolution.5.loop_header.dim.3:                  ; preds = %convolution.5.inner.loop_exit.k0, %convolution.5.loop_body.dim.2
  %convolution.5.indvar.dim.3 = load i64* %convolution.5.invar_address.dim.3
  %396 = icmp uge i64 %convolution.5.indvar.dim.3, 192
  br i1 %396, label %convolution.5.loop_exit.dim.3, label %convolution.5.loop_body.dim.3

convolution.5.loop_body.dim.3:                    ; preds = %convolution.5.loop_header.dim.3
  store float 0.000000e+00, float* %convolution_sum_address82
  store i64 0, i64* %convolution.5.inner.invar_address.k0
  br label %convolution.5.inner.loop_header.k0

convolution.5.inner.loop_header.k0:               ; preds = %convolution.5.inner.loop_exit.k1, %convolution.5.loop_body.dim.3
  %convolution.5.inner.indvar.k0 = load i64* %convolution.5.inner.invar_address.k0
  %397 = icmp uge i64 %convolution.5.inner.indvar.k0, 3
  br i1 %397, label %convolution.5.inner.loop_exit.k0, label %convolution.5.inner.loop_body.k0

convolution.5.inner.loop_body.k0:                 ; preds = %convolution.5.inner.loop_header.k0
  store i64 0, i64* %convolution.5.inner.invar_address.k1
  br label %convolution.5.inner.loop_header.k1

convolution.5.inner.loop_header.k1:               ; preds = %convolution.5.inner.loop_exit.iz, %convolution.5.inner.loop_body.k0
  %convolution.5.inner.indvar.k1 = load i64* %convolution.5.inner.invar_address.k1
  %398 = icmp uge i64 %convolution.5.inner.indvar.k1, 3
  br i1 %398, label %convolution.5.inner.loop_exit.k1, label %convolution.5.inner.loop_body.k1

convolution.5.inner.loop_body.k1:                 ; preds = %convolution.5.inner.loop_header.k1
  store i64 0, i64* %convolution.5.inner.invar_address.iz
  br label %convolution.5.inner.loop_header.iz

convolution.5.inner.loop_header.iz:               ; preds = %in-bounds-after88, %convolution.5.inner.loop_body.k1
  %convolution.5.inner.indvar.iz = load i64* %convolution.5.inner.invar_address.iz
  %399 = icmp uge i64 %convolution.5.inner.indvar.iz, 192
  br i1 %399, label %convolution.5.inner.loop_exit.iz, label %convolution.5.inner.loop_body.iz

convolution.5.inner.loop_body.iz:                 ; preds = %convolution.5.inner.loop_header.iz
  %400 = mul nsw i64 %convolution.5.indvar.dim.1, 1
  %401 = mul nsw i64 %convolution.5.inner.indvar.k0, 1
  %402 = add nsw i64 %400, %401
  %403 = sub nsw i64 %402, 1
  %404 = mul nsw i64 %convolution.5.indvar.dim.2, 1
  %405 = mul nsw i64 %convolution.5.inner.indvar.k1, 1
  %406 = add nsw i64 %404, %405
  %407 = sub nsw i64 %406, 1
  %408 = icmp ult i64 %403, 13
  %409 = srem i64 %403, 1
  %410 = icmp eq i64 %409, 0
  %411 = and i1 %408, %410
  %412 = and i1 true, %411
  %413 = icmp ult i64 %407, 13
  %414 = srem i64 %407, 1
  %415 = icmp eq i64 %414, 0
  %416 = and i1 %413, %415
  %417 = and i1 %412, %416
  %418 = sdiv i64 %403, 1
  %419 = sdiv i64 %407, 1
  br i1 %417, label %in-bounds-true86, label %in-bounds-false87

in-bounds-after88:                                ; preds = %in-bounds-false87, %in-bounds-true86
  %invar.inc85 = add nuw nsw i64 %convolution.5.inner.indvar.iz, 1
  store i64 %invar.inc85, i64* %convolution.5.inner.invar_address.iz
  br label %convolution.5.inner.loop_header.iz

convolution.5.inner.loop_exit.iz:                 ; preds = %convolution.5.inner.loop_header.iz
  %invar.inc84 = add nuw nsw i64 %convolution.5.inner.indvar.k1, 1
  store i64 %invar.inc84, i64* %convolution.5.inner.invar_address.k1
  br label %convolution.5.inner.loop_header.k1

convolution.5.inner.loop_exit.k1:                 ; preds = %convolution.5.inner.loop_header.k1
  %invar.inc83 = add nuw nsw i64 %convolution.5.inner.indvar.k0, 1
  store i64 %invar.inc83, i64* %convolution.5.inner.invar_address.k0
  br label %convolution.5.inner.loop_header.k0

convolution.5.inner.loop_exit.k0:                 ; preds = %convolution.5.inner.loop_header.k0
  %420 = load float* %convolution_sum_address82
  %421 = getelementptr inbounds [2 x [13 x [13 x [192 x float]]]]* %convolution.5, i64 0, i64 %convolution.5.indvar.dim.0, i64 %convolution.5.indvar.dim.1, i64 %convolution.5.indvar.dim.2, i64 %convolution.5.indvar.dim.3
  store float %420, float* %421
  %invar.inc81 = add nuw nsw i64 %convolution.5.indvar.dim.3, 1
  store i64 %invar.inc81, i64* %convolution.5.invar_address.dim.3
  br label %convolution.5.loop_header.dim.3

convolution.5.loop_exit.dim.3:                    ; preds = %convolution.5.loop_header.dim.3
  %invar.inc80 = add nuw nsw i64 %convolution.5.indvar.dim.2, 1
  store i64 %invar.inc80, i64* %convolution.5.invar_address.dim.2
  br label %convolution.5.loop_header.dim.2

convolution.5.loop_exit.dim.2:                    ; preds = %convolution.5.loop_header.dim.2
  %invar.inc79 = add nuw nsw i64 %convolution.5.indvar.dim.1, 1
  store i64 %invar.inc79, i64* %convolution.5.invar_address.dim.1
  br label %convolution.5.loop_header.dim.1

convolution.5.loop_exit.dim.1:                    ; preds = %convolution.5.loop_header.dim.1
  %invar.inc78 = add nuw nsw i64 %convolution.5.indvar.dim.0, 1
  store i64 %invar.inc78, i64* %convolution.5.invar_address.dim.0
  br label %convolution.5.loop_header.dim.0

convolution.5.loop_exit.dim.0:                    ; preds = %convolution.5.loop_header.dim.0
  %422 = getelementptr inbounds i8** %params, i64 8
  %arg8.untyped = load i8** %422, !dereferenceable !15, !align !2
  %423 = bitcast i8* %arg8.untyped to [384 x float]*
  %424 = getelementptr inbounds i8** %temps, i64 25
  %425 = load i8** %424, !dereferenceable !13, !align !2
  %426 = getelementptr inbounds i8* %425, i64 2471424
  %fusion.6 = bitcast i8* %426 to [2 x [13 x [13 x [192 x float]]]]*
  store i64 0, i64* %fusion.6.invar_address.dim.0
  br label %fusion.6.loop_header.dim.0

in-bounds-true86:                                 ; preds = %convolution.5.inner.loop_body.iz
  %427 = getelementptr inbounds [3 x [3 x [192 x [192 x float]]]]* %call.7, i64 0, i64 %convolution.5.inner.indvar.k0, i64 %convolution.5.inner.indvar.k1, i64 %convolution.5.inner.indvar.iz, i64 %convolution.5.indvar.dim.3
  %428 = load float* %427
  %429 = getelementptr inbounds [2 x [13 x [13 x [192 x float]]]]* %fusion.9, i64 0, i64 %convolution.5.indvar.dim.0, i64 %418, i64 %419, i64 %convolution.5.inner.indvar.iz
  %430 = load float* %429
  %431 = fmul float %430, %428
  %432 = load float* %convolution_sum_address82
  %433 = fadd float %432, %431
  store float %433, float* %convolution_sum_address82
  br label %in-bounds-after88

in-bounds-false87:                                ; preds = %convolution.5.inner.loop_body.iz
  br label %in-bounds-after88

fusion.6.loop_header.dim.0:                       ; preds = %fusion.6.loop_exit.dim.1, %convolution.5.loop_exit.dim.0
  %fusion.6.indvar.dim.0 = load i64* %fusion.6.invar_address.dim.0
  %434 = icmp uge i64 %fusion.6.indvar.dim.0, 2
  br i1 %434, label %fusion.6.loop_exit.dim.0, label %fusion.6.loop_body.dim.0

fusion.6.loop_body.dim.0:                         ; preds = %fusion.6.loop_header.dim.0
  store i64 0, i64* %fusion.6.invar_address.dim.1
  br label %fusion.6.loop_header.dim.1

fusion.6.loop_header.dim.1:                       ; preds = %fusion.6.loop_exit.dim.2, %fusion.6.loop_body.dim.0
  %fusion.6.indvar.dim.1 = load i64* %fusion.6.invar_address.dim.1
  %435 = icmp uge i64 %fusion.6.indvar.dim.1, 13
  br i1 %435, label %fusion.6.loop_exit.dim.1, label %fusion.6.loop_body.dim.1

fusion.6.loop_body.dim.1:                         ; preds = %fusion.6.loop_header.dim.1
  store i64 0, i64* %fusion.6.invar_address.dim.2
  br label %fusion.6.loop_header.dim.2

fusion.6.loop_header.dim.2:                       ; preds = %fusion.6.loop_exit.dim.3, %fusion.6.loop_body.dim.1
  %fusion.6.indvar.dim.2 = load i64* %fusion.6.invar_address.dim.2
  %436 = icmp uge i64 %fusion.6.indvar.dim.2, 13
  br i1 %436, label %fusion.6.loop_exit.dim.2, label %fusion.6.loop_body.dim.2

fusion.6.loop_body.dim.2:                         ; preds = %fusion.6.loop_header.dim.2
  store i64 0, i64* %fusion.6.invar_address.dim.3
  br label %fusion.6.loop_header.dim.3

fusion.6.loop_header.dim.3:                       ; preds = %concatenate.4.merge, %fusion.6.loop_body.dim.2
  %fusion.6.indvar.dim.3 = load i64* %fusion.6.invar_address.dim.3
  %437 = icmp uge i64 %fusion.6.indvar.dim.3, 192
  br i1 %437, label %fusion.6.loop_exit.dim.3, label %fusion.6.loop_body.dim.3

fusion.6.loop_body.dim.3:                         ; preds = %fusion.6.loop_header.dim.3
  %438 = add i64 %fusion.6.indvar.dim.0, 0
  %439 = add i64 %fusion.6.indvar.dim.1, 0
  %440 = add i64 %fusion.6.indvar.dim.2, 0
  %441 = add i64 %fusion.6.indvar.dim.3, 192
  %442 = load float* @0
  %443 = icmp ult i64 %441, 192
  br i1 %443, label %concat_index_from_operand0, label %concat_index_not_from_operand0

concat_index_from_operand0:                       ; preds = %fusion.6.loop_body.dim.3
  %444 = getelementptr inbounds [2 x [13 x [13 x [192 x float]]]]* %convolution.5, i64 0, i64 %438, i64 %439, i64 %440, i64 %441
  %445 = load float* %444
  br label %concatenate.4.merge

concat_index_not_from_operand0:                   ; preds = %fusion.6.loop_body.dim.3
  %446 = sub i64 %441, 192
  %447 = icmp ult i64 %446, 192
  br i1 %447, label %concat_index_from_operand1, label %concat_index_not_from_operand1

concat_index_from_operand1:                       ; preds = %concat_index_not_from_operand0
  %448 = getelementptr inbounds [2 x [13 x [13 x [192 x float]]]]* %convolution.4, i64 0, i64 %438, i64 %439, i64 %440, i64 %446
  %449 = load float* %448
  br label %concatenate.4.merge

concat_index_not_from_operand1:                   ; preds = %concat_index_not_from_operand0
  %450 = sub i64 %446, 192
  unreachable

concatenate.4.merge:                              ; preds = %concat_index_from_operand1, %concat_index_from_operand0
  %451 = phi float [ %445, %concat_index_from_operand0 ], [ %449, %concat_index_from_operand1 ]
  %452 = getelementptr inbounds [384 x float]* %423, i64 0, i64 %441
  %453 = load float* %452
  %454 = fadd float %451, %453
  %455 = fcmp oge float %442, %454
  %456 = fcmp une float %442, %442
  %457 = or i1 %455, %456
  %458 = select i1 %457, float %442, float %454
  %459 = getelementptr inbounds [2 x [13 x [13 x [192 x float]]]]* %fusion.6, i64 0, i64 %fusion.6.indvar.dim.0, i64 %fusion.6.indvar.dim.1, i64 %fusion.6.indvar.dim.2, i64 %fusion.6.indvar.dim.3
  store float %458, float* %459
  %invar.inc92 = add nuw nsw i64 %fusion.6.indvar.dim.3, 1
  store i64 %invar.inc92, i64* %fusion.6.invar_address.dim.3
  br label %fusion.6.loop_header.dim.3

fusion.6.loop_exit.dim.3:                         ; preds = %fusion.6.loop_header.dim.3
  %invar.inc91 = add nuw nsw i64 %fusion.6.indvar.dim.2, 1
  store i64 %invar.inc91, i64* %fusion.6.invar_address.dim.2
  br label %fusion.6.loop_header.dim.2

fusion.6.loop_exit.dim.2:                         ; preds = %fusion.6.loop_header.dim.2
  %invar.inc90 = add nuw nsw i64 %fusion.6.indvar.dim.1, 1
  store i64 %invar.inc90, i64* %fusion.6.invar_address.dim.1
  br label %fusion.6.loop_header.dim.1

fusion.6.loop_exit.dim.1:                         ; preds = %fusion.6.loop_header.dim.1
  %invar.inc89 = add nuw nsw i64 %fusion.6.indvar.dim.0, 1
  store i64 %invar.inc89, i64* %fusion.6.invar_address.dim.0
  br label %fusion.6.loop_header.dim.0

fusion.6.loop_exit.dim.0:                         ; preds = %fusion.6.loop_header.dim.0
  %460 = getelementptr inbounds i8** %params, i64 2
  %arg2.untyped = load i8** %460, !dereferenceable !1, !align !2
  %461 = bitcast i8* %arg2.untyped to [3 x [3 x [192 x [256 x float]]]]*
  %462 = getelementptr inbounds i8** %temps, i64 25
  %463 = load i8** %462, !dereferenceable !13, !align !2
  %call = bitcast i8* %463 to [3 x [3 x [192 x [128 x float]]]]*
  %parallel_slice_parameter_0_address_as_i8ptr = bitcast [3 x [3 x [192 x [256 x float]]]]* %461 to i8*
  %464 = getelementptr inbounds i8** %parallel_slice_parameter_addresses, i64 0
  store i8* %parallel_slice_parameter_0_address_as_i8ptr, i8** %464
  %465 = bitcast [3 x [3 x [192 x [128 x float]]]]* %call to i8*
  call void @__xla_cpu_runtime_ParallelForkJoin(i8* %465, i8* %run_options, i8** %parallel_slice_parameter_addresses, i8** %temps, i64* %prof_counters, i32 2, i64* getelementptr inbounds ([4 x i64]* @parallel_slice_parallel_dimension_partitions, i32 0, i32 0), i32 1, i8* bitcast (void (i8*, i8*, i8**, i8**, i64*, i64*)* @parallel_slice to i8*))
  %466 = getelementptr inbounds i8** %temps, i64 25
  %467 = load i8** %466, !dereferenceable !13, !align !2
  %468 = getelementptr inbounds i8* %467, i64 2990592
  %convolution.6 = bitcast i8* %468 to [2 x [13 x [13 x [128 x float]]]]*
  store i64 0, i64* %convolution.6.invar_address.dim.0
  br label %convolution.6.loop_header.dim.0

convolution.6.loop_header.dim.0:                  ; preds = %convolution.6.loop_exit.dim.1, %fusion.6.loop_exit.dim.0
  %convolution.6.indvar.dim.0 = load i64* %convolution.6.invar_address.dim.0
  %469 = icmp uge i64 %convolution.6.indvar.dim.0, 2
  br i1 %469, label %convolution.6.loop_exit.dim.0, label %convolution.6.loop_body.dim.0

convolution.6.loop_body.dim.0:                    ; preds = %convolution.6.loop_header.dim.0
  store i64 0, i64* %convolution.6.invar_address.dim.1
  br label %convolution.6.loop_header.dim.1

convolution.6.loop_header.dim.1:                  ; preds = %convolution.6.loop_exit.dim.2, %convolution.6.loop_body.dim.0
  %convolution.6.indvar.dim.1 = load i64* %convolution.6.invar_address.dim.1
  %470 = icmp uge i64 %convolution.6.indvar.dim.1, 13
  br i1 %470, label %convolution.6.loop_exit.dim.1, label %convolution.6.loop_body.dim.1

convolution.6.loop_body.dim.1:                    ; preds = %convolution.6.loop_header.dim.1
  store i64 0, i64* %convolution.6.invar_address.dim.2
  br label %convolution.6.loop_header.dim.2

convolution.6.loop_header.dim.2:                  ; preds = %convolution.6.loop_exit.dim.3, %convolution.6.loop_body.dim.1
  %convolution.6.indvar.dim.2 = load i64* %convolution.6.invar_address.dim.2
  %471 = icmp uge i64 %convolution.6.indvar.dim.2, 13
  br i1 %471, label %convolution.6.loop_exit.dim.2, label %convolution.6.loop_body.dim.2

convolution.6.loop_body.dim.2:                    ; preds = %convolution.6.loop_header.dim.2
  store i64 0, i64* %convolution.6.invar_address.dim.3
  br label %convolution.6.loop_header.dim.3

convolution.6.loop_header.dim.3:                  ; preds = %convolution.6.inner.loop_exit.k0, %convolution.6.loop_body.dim.2
  %convolution.6.indvar.dim.3 = load i64* %convolution.6.invar_address.dim.3
  %472 = icmp uge i64 %convolution.6.indvar.dim.3, 128
  br i1 %472, label %convolution.6.loop_exit.dim.3, label %convolution.6.loop_body.dim.3

convolution.6.loop_body.dim.3:                    ; preds = %convolution.6.loop_header.dim.3
  store float 0.000000e+00, float* %convolution_sum_address97
  store i64 0, i64* %convolution.6.inner.invar_address.k0
  br label %convolution.6.inner.loop_header.k0

convolution.6.inner.loop_header.k0:               ; preds = %convolution.6.inner.loop_exit.k1, %convolution.6.loop_body.dim.3
  %convolution.6.inner.indvar.k0 = load i64* %convolution.6.inner.invar_address.k0
  %473 = icmp uge i64 %convolution.6.inner.indvar.k0, 3
  br i1 %473, label %convolution.6.inner.loop_exit.k0, label %convolution.6.inner.loop_body.k0

convolution.6.inner.loop_body.k0:                 ; preds = %convolution.6.inner.loop_header.k0
  store i64 0, i64* %convolution.6.inner.invar_address.k1
  br label %convolution.6.inner.loop_header.k1

convolution.6.inner.loop_header.k1:               ; preds = %convolution.6.inner.loop_exit.iz, %convolution.6.inner.loop_body.k0
  %convolution.6.inner.indvar.k1 = load i64* %convolution.6.inner.invar_address.k1
  %474 = icmp uge i64 %convolution.6.inner.indvar.k1, 3
  br i1 %474, label %convolution.6.inner.loop_exit.k1, label %convolution.6.inner.loop_body.k1

convolution.6.inner.loop_body.k1:                 ; preds = %convolution.6.inner.loop_header.k1
  store i64 0, i64* %convolution.6.inner.invar_address.iz
  br label %convolution.6.inner.loop_header.iz

convolution.6.inner.loop_header.iz:               ; preds = %in-bounds-after103, %convolution.6.inner.loop_body.k1
  %convolution.6.inner.indvar.iz = load i64* %convolution.6.inner.invar_address.iz
  %475 = icmp uge i64 %convolution.6.inner.indvar.iz, 192
  br i1 %475, label %convolution.6.inner.loop_exit.iz, label %convolution.6.inner.loop_body.iz

convolution.6.inner.loop_body.iz:                 ; preds = %convolution.6.inner.loop_header.iz
  %476 = mul nsw i64 %convolution.6.indvar.dim.1, 1
  %477 = mul nsw i64 %convolution.6.inner.indvar.k0, 1
  %478 = add nsw i64 %476, %477
  %479 = sub nsw i64 %478, 1
  %480 = mul nsw i64 %convolution.6.indvar.dim.2, 1
  %481 = mul nsw i64 %convolution.6.inner.indvar.k1, 1
  %482 = add nsw i64 %480, %481
  %483 = sub nsw i64 %482, 1
  %484 = icmp ult i64 %479, 13
  %485 = srem i64 %479, 1
  %486 = icmp eq i64 %485, 0
  %487 = and i1 %484, %486
  %488 = and i1 true, %487
  %489 = icmp ult i64 %483, 13
  %490 = srem i64 %483, 1
  %491 = icmp eq i64 %490, 0
  %492 = and i1 %489, %491
  %493 = and i1 %488, %492
  %494 = sdiv i64 %479, 1
  %495 = sdiv i64 %483, 1
  br i1 %493, label %in-bounds-true101, label %in-bounds-false102

in-bounds-after103:                               ; preds = %in-bounds-false102, %in-bounds-true101
  %invar.inc100 = add nuw nsw i64 %convolution.6.inner.indvar.iz, 1
  store i64 %invar.inc100, i64* %convolution.6.inner.invar_address.iz
  br label %convolution.6.inner.loop_header.iz

convolution.6.inner.loop_exit.iz:                 ; preds = %convolution.6.inner.loop_header.iz
  %invar.inc99 = add nuw nsw i64 %convolution.6.inner.indvar.k1, 1
  store i64 %invar.inc99, i64* %convolution.6.inner.invar_address.k1
  br label %convolution.6.inner.loop_header.k1

convolution.6.inner.loop_exit.k1:                 ; preds = %convolution.6.inner.loop_header.k1
  %invar.inc98 = add nuw nsw i64 %convolution.6.inner.indvar.k0, 1
  store i64 %invar.inc98, i64* %convolution.6.inner.invar_address.k0
  br label %convolution.6.inner.loop_header.k0

convolution.6.inner.loop_exit.k0:                 ; preds = %convolution.6.inner.loop_header.k0
  %496 = load float* %convolution_sum_address97
  %497 = getelementptr inbounds [2 x [13 x [13 x [128 x float]]]]* %convolution.6, i64 0, i64 %convolution.6.indvar.dim.0, i64 %convolution.6.indvar.dim.1, i64 %convolution.6.indvar.dim.2, i64 %convolution.6.indvar.dim.3
  store float %496, float* %497
  %invar.inc96 = add nuw nsw i64 %convolution.6.indvar.dim.3, 1
  store i64 %invar.inc96, i64* %convolution.6.invar_address.dim.3
  br label %convolution.6.loop_header.dim.3

convolution.6.loop_exit.dim.3:                    ; preds = %convolution.6.loop_header.dim.3
  %invar.inc95 = add nuw nsw i64 %convolution.6.indvar.dim.2, 1
  store i64 %invar.inc95, i64* %convolution.6.invar_address.dim.2
  br label %convolution.6.loop_header.dim.2

convolution.6.loop_exit.dim.2:                    ; preds = %convolution.6.loop_header.dim.2
  %invar.inc94 = add nuw nsw i64 %convolution.6.indvar.dim.1, 1
  store i64 %invar.inc94, i64* %convolution.6.invar_address.dim.1
  br label %convolution.6.loop_header.dim.1

convolution.6.loop_exit.dim.1:                    ; preds = %convolution.6.loop_header.dim.1
  %invar.inc93 = add nuw nsw i64 %convolution.6.indvar.dim.0, 1
  store i64 %invar.inc93, i64* %convolution.6.invar_address.dim.0
  br label %convolution.6.loop_header.dim.0

convolution.6.loop_exit.dim.0:                    ; preds = %convolution.6.loop_header.dim.0
  %498 = getelementptr inbounds i8** %temps, i64 25
  %499 = load i8** %498, !dereferenceable !13, !align !2
  %500 = getelementptr inbounds i8* %499, i64 2471424
  %fusion.7 = bitcast i8* %500 to [2 x [13 x [13 x [192 x float]]]]*
  store i64 0, i64* %fusion.7.invar_address.dim.0
  br label %fusion.7.loop_header.dim.0

in-bounds-true101:                                ; preds = %convolution.6.inner.loop_body.iz
  %501 = getelementptr inbounds [3 x [3 x [192 x [128 x float]]]]* %call, i64 0, i64 %convolution.6.inner.indvar.k0, i64 %convolution.6.inner.indvar.k1, i64 %convolution.6.inner.indvar.iz, i64 %convolution.6.indvar.dim.3
  %502 = load float* %501
  %503 = getelementptr inbounds [2 x [13 x [13 x [192 x float]]]]* %fusion.6, i64 0, i64 %convolution.6.indvar.dim.0, i64 %494, i64 %495, i64 %convolution.6.inner.indvar.iz
  %504 = load float* %503
  %505 = fmul float %504, %502
  %506 = load float* %convolution_sum_address97
  %507 = fadd float %506, %505
  store float %507, float* %convolution_sum_address97
  br label %in-bounds-after103

in-bounds-false102:                               ; preds = %convolution.6.inner.loop_body.iz
  br label %in-bounds-after103

fusion.7.loop_header.dim.0:                       ; preds = %fusion.7.loop_exit.dim.1, %convolution.6.loop_exit.dim.0
  %fusion.7.indvar.dim.0 = load i64* %fusion.7.invar_address.dim.0
  %508 = icmp uge i64 %fusion.7.indvar.dim.0, 2
  br i1 %508, label %fusion.7.loop_exit.dim.0, label %fusion.7.loop_body.dim.0

fusion.7.loop_body.dim.0:                         ; preds = %fusion.7.loop_header.dim.0
  store i64 0, i64* %fusion.7.invar_address.dim.1
  br label %fusion.7.loop_header.dim.1

fusion.7.loop_header.dim.1:                       ; preds = %fusion.7.loop_exit.dim.2, %fusion.7.loop_body.dim.0
  %fusion.7.indvar.dim.1 = load i64* %fusion.7.invar_address.dim.1
  %509 = icmp uge i64 %fusion.7.indvar.dim.1, 13
  br i1 %509, label %fusion.7.loop_exit.dim.1, label %fusion.7.loop_body.dim.1

fusion.7.loop_body.dim.1:                         ; preds = %fusion.7.loop_header.dim.1
  store i64 0, i64* %fusion.7.invar_address.dim.2
  br label %fusion.7.loop_header.dim.2

fusion.7.loop_header.dim.2:                       ; preds = %fusion.7.loop_exit.dim.3, %fusion.7.loop_body.dim.1
  %fusion.7.indvar.dim.2 = load i64* %fusion.7.invar_address.dim.2
  %510 = icmp uge i64 %fusion.7.indvar.dim.2, 13
  br i1 %510, label %fusion.7.loop_exit.dim.2, label %fusion.7.loop_body.dim.2

fusion.7.loop_body.dim.2:                         ; preds = %fusion.7.loop_header.dim.2
  store i64 0, i64* %fusion.7.invar_address.dim.3
  br label %fusion.7.loop_header.dim.3

fusion.7.loop_header.dim.3:                       ; preds = %concatenate.5.merge, %fusion.7.loop_body.dim.2
  %fusion.7.indvar.dim.3 = load i64* %fusion.7.invar_address.dim.3
  %511 = icmp uge i64 %fusion.7.indvar.dim.3, 192
  br i1 %511, label %fusion.7.loop_exit.dim.3, label %fusion.7.loop_body.dim.3

fusion.7.loop_body.dim.3:                         ; preds = %fusion.7.loop_header.dim.3
  %512 = add i64 %fusion.7.indvar.dim.0, 0
  %513 = add i64 %fusion.7.indvar.dim.1, 0
  %514 = add i64 %fusion.7.indvar.dim.2, 0
  %515 = add i64 %fusion.7.indvar.dim.3, 0
  %516 = load float* @0
  %517 = icmp ult i64 %515, 192
  br i1 %517, label %concat_index_from_operand0108, label %concat_index_not_from_operand0109

concat_index_from_operand0108:                    ; preds = %fusion.7.loop_body.dim.3
  %518 = getelementptr inbounds [2 x [13 x [13 x [192 x float]]]]* %convolution.5, i64 0, i64 %512, i64 %513, i64 %514, i64 %515
  %519 = load float* %518
  br label %concatenate.5.merge

concat_index_not_from_operand0109:                ; preds = %fusion.7.loop_body.dim.3
  %520 = sub i64 %515, 192
  %521 = icmp ult i64 %520, 192
  br i1 %521, label %concat_index_from_operand1110, label %concat_index_not_from_operand1111

concat_index_from_operand1110:                    ; preds = %concat_index_not_from_operand0109
  %522 = getelementptr inbounds [2 x [13 x [13 x [192 x float]]]]* %convolution.4, i64 0, i64 %512, i64 %513, i64 %514, i64 %520
  %523 = load float* %522
  br label %concatenate.5.merge

concat_index_not_from_operand1111:                ; preds = %concat_index_not_from_operand0109
  %524 = sub i64 %520, 192
  unreachable

concatenate.5.merge:                              ; preds = %concat_index_from_operand1110, %concat_index_from_operand0108
  %525 = phi float [ %519, %concat_index_from_operand0108 ], [ %523, %concat_index_from_operand1110 ]
  %526 = getelementptr inbounds [384 x float]* %423, i64 0, i64 %515
  %527 = load float* %526
  %528 = fadd float %525, %527
  %529 = fcmp oge float %516, %528
  %530 = fcmp une float %516, %516
  %531 = or i1 %529, %530
  %532 = select i1 %531, float %516, float %528
  %533 = getelementptr inbounds [2 x [13 x [13 x [192 x float]]]]* %fusion.7, i64 0, i64 %fusion.7.indvar.dim.0, i64 %fusion.7.indvar.dim.1, i64 %fusion.7.indvar.dim.2, i64 %fusion.7.indvar.dim.3
  store float %532, float* %533
  %invar.inc107 = add nuw nsw i64 %fusion.7.indvar.dim.3, 1
  store i64 %invar.inc107, i64* %fusion.7.invar_address.dim.3
  br label %fusion.7.loop_header.dim.3

fusion.7.loop_exit.dim.3:                         ; preds = %fusion.7.loop_header.dim.3
  %invar.inc106 = add nuw nsw i64 %fusion.7.indvar.dim.2, 1
  store i64 %invar.inc106, i64* %fusion.7.invar_address.dim.2
  br label %fusion.7.loop_header.dim.2

fusion.7.loop_exit.dim.2:                         ; preds = %fusion.7.loop_header.dim.2
  %invar.inc105 = add nuw nsw i64 %fusion.7.indvar.dim.1, 1
  store i64 %invar.inc105, i64* %fusion.7.invar_address.dim.1
  br label %fusion.7.loop_header.dim.1

fusion.7.loop_exit.dim.1:                         ; preds = %fusion.7.loop_header.dim.1
  %invar.inc104 = add nuw nsw i64 %fusion.7.indvar.dim.0, 1
  store i64 %invar.inc104, i64* %fusion.7.invar_address.dim.0
  br label %fusion.7.loop_header.dim.0

fusion.7.loop_exit.dim.0:                         ; preds = %fusion.7.loop_header.dim.0
  %534 = getelementptr inbounds i8** %temps, i64 25
  %535 = load i8** %534, !dereferenceable !13, !align !2
  %call.8 = bitcast i8* %535 to [3 x [3 x [192 x [128 x float]]]]*
  %parallel_slice.10_parameter_0_address_as_i8ptr = bitcast [3 x [3 x [192 x [256 x float]]]]* %461 to i8*
  %536 = getelementptr inbounds i8** %parallel_slice.10_parameter_addresses, i64 0
  store i8* %parallel_slice.10_parameter_0_address_as_i8ptr, i8** %536
  %537 = bitcast [3 x [3 x [192 x [128 x float]]]]* %call.8 to i8*
  call void @__xla_cpu_runtime_ParallelForkJoin(i8* %537, i8* %run_options, i8** %parallel_slice.10_parameter_addresses, i8** %temps, i64* %prof_counters, i32 2, i64* getelementptr inbounds ([4 x i64]* @parallel_slice.10_parallel_dimension_partitions, i32 0, i32 0), i32 1, i8* bitcast (void (i8*, i8*, i8**, i8**, i64*, i64*)* @parallel_slice.10 to i8*))
  %538 = getelementptr inbounds i8** %temps, i64 25
  %539 = load i8** %538, !dereferenceable !13, !align !2
  %540 = getelementptr inbounds i8* %539, i64 2211840
  %convolution.7 = bitcast i8* %540 to [2 x [13 x [13 x [128 x float]]]]*
  store i64 0, i64* %convolution.7.invar_address.dim.0
  br label %convolution.7.loop_header.dim.0

convolution.7.loop_header.dim.0:                  ; preds = %convolution.7.loop_exit.dim.1, %fusion.7.loop_exit.dim.0
  %convolution.7.indvar.dim.0 = load i64* %convolution.7.invar_address.dim.0
  %541 = icmp uge i64 %convolution.7.indvar.dim.0, 2
  br i1 %541, label %convolution.7.loop_exit.dim.0, label %convolution.7.loop_body.dim.0

convolution.7.loop_body.dim.0:                    ; preds = %convolution.7.loop_header.dim.0
  store i64 0, i64* %convolution.7.invar_address.dim.1
  br label %convolution.7.loop_header.dim.1

convolution.7.loop_header.dim.1:                  ; preds = %convolution.7.loop_exit.dim.2, %convolution.7.loop_body.dim.0
  %convolution.7.indvar.dim.1 = load i64* %convolution.7.invar_address.dim.1
  %542 = icmp uge i64 %convolution.7.indvar.dim.1, 13
  br i1 %542, label %convolution.7.loop_exit.dim.1, label %convolution.7.loop_body.dim.1

convolution.7.loop_body.dim.1:                    ; preds = %convolution.7.loop_header.dim.1
  store i64 0, i64* %convolution.7.invar_address.dim.2
  br label %convolution.7.loop_header.dim.2

convolution.7.loop_header.dim.2:                  ; preds = %convolution.7.loop_exit.dim.3, %convolution.7.loop_body.dim.1
  %convolution.7.indvar.dim.2 = load i64* %convolution.7.invar_address.dim.2
  %543 = icmp uge i64 %convolution.7.indvar.dim.2, 13
  br i1 %543, label %convolution.7.loop_exit.dim.2, label %convolution.7.loop_body.dim.2

convolution.7.loop_body.dim.2:                    ; preds = %convolution.7.loop_header.dim.2
  store i64 0, i64* %convolution.7.invar_address.dim.3
  br label %convolution.7.loop_header.dim.3

convolution.7.loop_header.dim.3:                  ; preds = %convolution.7.inner.loop_exit.k0, %convolution.7.loop_body.dim.2
  %convolution.7.indvar.dim.3 = load i64* %convolution.7.invar_address.dim.3
  %544 = icmp uge i64 %convolution.7.indvar.dim.3, 128
  br i1 %544, label %convolution.7.loop_exit.dim.3, label %convolution.7.loop_body.dim.3

convolution.7.loop_body.dim.3:                    ; preds = %convolution.7.loop_header.dim.3
  store float 0.000000e+00, float* %convolution_sum_address116
  store i64 0, i64* %convolution.7.inner.invar_address.k0
  br label %convolution.7.inner.loop_header.k0

convolution.7.inner.loop_header.k0:               ; preds = %convolution.7.inner.loop_exit.k1, %convolution.7.loop_body.dim.3
  %convolution.7.inner.indvar.k0 = load i64* %convolution.7.inner.invar_address.k0
  %545 = icmp uge i64 %convolution.7.inner.indvar.k0, 3
  br i1 %545, label %convolution.7.inner.loop_exit.k0, label %convolution.7.inner.loop_body.k0

convolution.7.inner.loop_body.k0:                 ; preds = %convolution.7.inner.loop_header.k0
  store i64 0, i64* %convolution.7.inner.invar_address.k1
  br label %convolution.7.inner.loop_header.k1

convolution.7.inner.loop_header.k1:               ; preds = %convolution.7.inner.loop_exit.iz, %convolution.7.inner.loop_body.k0
  %convolution.7.inner.indvar.k1 = load i64* %convolution.7.inner.invar_address.k1
  %546 = icmp uge i64 %convolution.7.inner.indvar.k1, 3
  br i1 %546, label %convolution.7.inner.loop_exit.k1, label %convolution.7.inner.loop_body.k1

convolution.7.inner.loop_body.k1:                 ; preds = %convolution.7.inner.loop_header.k1
  store i64 0, i64* %convolution.7.inner.invar_address.iz
  br label %convolution.7.inner.loop_header.iz

convolution.7.inner.loop_header.iz:               ; preds = %in-bounds-after122, %convolution.7.inner.loop_body.k1
  %convolution.7.inner.indvar.iz = load i64* %convolution.7.inner.invar_address.iz
  %547 = icmp uge i64 %convolution.7.inner.indvar.iz, 192
  br i1 %547, label %convolution.7.inner.loop_exit.iz, label %convolution.7.inner.loop_body.iz

convolution.7.inner.loop_body.iz:                 ; preds = %convolution.7.inner.loop_header.iz
  %548 = mul nsw i64 %convolution.7.indvar.dim.1, 1
  %549 = mul nsw i64 %convolution.7.inner.indvar.k0, 1
  %550 = add nsw i64 %548, %549
  %551 = sub nsw i64 %550, 1
  %552 = mul nsw i64 %convolution.7.indvar.dim.2, 1
  %553 = mul nsw i64 %convolution.7.inner.indvar.k1, 1
  %554 = add nsw i64 %552, %553
  %555 = sub nsw i64 %554, 1
  %556 = icmp ult i64 %551, 13
  %557 = srem i64 %551, 1
  %558 = icmp eq i64 %557, 0
  %559 = and i1 %556, %558
  %560 = and i1 true, %559
  %561 = icmp ult i64 %555, 13
  %562 = srem i64 %555, 1
  %563 = icmp eq i64 %562, 0
  %564 = and i1 %561, %563
  %565 = and i1 %560, %564
  %566 = sdiv i64 %551, 1
  %567 = sdiv i64 %555, 1
  br i1 %565, label %in-bounds-true120, label %in-bounds-false121

in-bounds-after122:                               ; preds = %in-bounds-false121, %in-bounds-true120
  %invar.inc119 = add nuw nsw i64 %convolution.7.inner.indvar.iz, 1
  store i64 %invar.inc119, i64* %convolution.7.inner.invar_address.iz
  br label %convolution.7.inner.loop_header.iz

convolution.7.inner.loop_exit.iz:                 ; preds = %convolution.7.inner.loop_header.iz
  %invar.inc118 = add nuw nsw i64 %convolution.7.inner.indvar.k1, 1
  store i64 %invar.inc118, i64* %convolution.7.inner.invar_address.k1
  br label %convolution.7.inner.loop_header.k1

convolution.7.inner.loop_exit.k1:                 ; preds = %convolution.7.inner.loop_header.k1
  %invar.inc117 = add nuw nsw i64 %convolution.7.inner.indvar.k0, 1
  store i64 %invar.inc117, i64* %convolution.7.inner.invar_address.k0
  br label %convolution.7.inner.loop_header.k0

convolution.7.inner.loop_exit.k0:                 ; preds = %convolution.7.inner.loop_header.k0
  %568 = load float* %convolution_sum_address116
  %569 = getelementptr inbounds [2 x [13 x [13 x [128 x float]]]]* %convolution.7, i64 0, i64 %convolution.7.indvar.dim.0, i64 %convolution.7.indvar.dim.1, i64 %convolution.7.indvar.dim.2, i64 %convolution.7.indvar.dim.3
  store float %568, float* %569
  %invar.inc115 = add nuw nsw i64 %convolution.7.indvar.dim.3, 1
  store i64 %invar.inc115, i64* %convolution.7.invar_address.dim.3
  br label %convolution.7.loop_header.dim.3

convolution.7.loop_exit.dim.3:                    ; preds = %convolution.7.loop_header.dim.3
  %invar.inc114 = add nuw nsw i64 %convolution.7.indvar.dim.2, 1
  store i64 %invar.inc114, i64* %convolution.7.invar_address.dim.2
  br label %convolution.7.loop_header.dim.2

convolution.7.loop_exit.dim.2:                    ; preds = %convolution.7.loop_header.dim.2
  %invar.inc113 = add nuw nsw i64 %convolution.7.indvar.dim.1, 1
  store i64 %invar.inc113, i64* %convolution.7.invar_address.dim.1
  br label %convolution.7.loop_header.dim.1

convolution.7.loop_exit.dim.1:                    ; preds = %convolution.7.loop_header.dim.1
  %invar.inc112 = add nuw nsw i64 %convolution.7.indvar.dim.0, 1
  store i64 %invar.inc112, i64* %convolution.7.invar_address.dim.0
  br label %convolution.7.loop_header.dim.0

convolution.7.loop_exit.dim.0:                    ; preds = %convolution.7.loop_header.dim.0
  %570 = getelementptr inbounds i8** %params, i64 9
  %arg9.untyped = load i8** %570, !dereferenceable !8, !align !2
  %571 = bitcast i8* %arg9.untyped to [256 x float]*
  %572 = getelementptr inbounds i8** %temps, i64 25
  %573 = load i8** %572, !dereferenceable !13, !align !2
  %574 = getelementptr inbounds i8* %573, i64 2384896
  %fusion.5 = bitcast i8* %574 to [2 x [13 x [13 x [256 x float]]]]*
  store i64 0, i64* %fusion.5.invar_address.dim.0
  br label %fusion.5.loop_header.dim.0

in-bounds-true120:                                ; preds = %convolution.7.inner.loop_body.iz
  %575 = getelementptr inbounds [3 x [3 x [192 x [128 x float]]]]* %call.8, i64 0, i64 %convolution.7.inner.indvar.k0, i64 %convolution.7.inner.indvar.k1, i64 %convolution.7.inner.indvar.iz, i64 %convolution.7.indvar.dim.3
  %576 = load float* %575
  %577 = getelementptr inbounds [2 x [13 x [13 x [192 x float]]]]* %fusion.7, i64 0, i64 %convolution.7.indvar.dim.0, i64 %566, i64 %567, i64 %convolution.7.inner.indvar.iz
  %578 = load float* %577
  %579 = fmul float %578, %576
  %580 = load float* %convolution_sum_address116
  %581 = fadd float %580, %579
  store float %581, float* %convolution_sum_address116
  br label %in-bounds-after122

in-bounds-false121:                               ; preds = %convolution.7.inner.loop_body.iz
  br label %in-bounds-after122

fusion.5.loop_header.dim.0:                       ; preds = %fusion.5.loop_exit.dim.1, %convolution.7.loop_exit.dim.0
  %fusion.5.indvar.dim.0 = load i64* %fusion.5.invar_address.dim.0
  %582 = icmp uge i64 %fusion.5.indvar.dim.0, 2
  br i1 %582, label %fusion.5.loop_exit.dim.0, label %fusion.5.loop_body.dim.0

fusion.5.loop_body.dim.0:                         ; preds = %fusion.5.loop_header.dim.0
  store i64 0, i64* %fusion.5.invar_address.dim.1
  br label %fusion.5.loop_header.dim.1

fusion.5.loop_header.dim.1:                       ; preds = %fusion.5.loop_exit.dim.2, %fusion.5.loop_body.dim.0
  %fusion.5.indvar.dim.1 = load i64* %fusion.5.invar_address.dim.1
  %583 = icmp uge i64 %fusion.5.indvar.dim.1, 13
  br i1 %583, label %fusion.5.loop_exit.dim.1, label %fusion.5.loop_body.dim.1

fusion.5.loop_body.dim.1:                         ; preds = %fusion.5.loop_header.dim.1
  store i64 0, i64* %fusion.5.invar_address.dim.2
  br label %fusion.5.loop_header.dim.2

fusion.5.loop_header.dim.2:                       ; preds = %fusion.5.loop_exit.dim.3, %fusion.5.loop_body.dim.1
  %fusion.5.indvar.dim.2 = load i64* %fusion.5.invar_address.dim.2
  %584 = icmp uge i64 %fusion.5.indvar.dim.2, 13
  br i1 %584, label %fusion.5.loop_exit.dim.2, label %fusion.5.loop_body.dim.2

fusion.5.loop_body.dim.2:                         ; preds = %fusion.5.loop_header.dim.2
  store i64 0, i64* %fusion.5.invar_address.dim.3
  br label %fusion.5.loop_header.dim.3

fusion.5.loop_header.dim.3:                       ; preds = %concatenate.3.merge, %fusion.5.loop_body.dim.2
  %fusion.5.indvar.dim.3 = load i64* %fusion.5.invar_address.dim.3
  %585 = icmp uge i64 %fusion.5.indvar.dim.3, 256
  br i1 %585, label %fusion.5.loop_exit.dim.3, label %fusion.5.loop_body.dim.3

fusion.5.loop_body.dim.3:                         ; preds = %fusion.5.loop_header.dim.3
  %586 = load float* @0
  %587 = icmp ult i64 %fusion.5.indvar.dim.3, 128
  br i1 %587, label %concat_index_from_operand0127, label %concat_index_not_from_operand0128

concat_index_from_operand0127:                    ; preds = %fusion.5.loop_body.dim.3
  %588 = getelementptr inbounds [2 x [13 x [13 x [128 x float]]]]* %convolution.7, i64 0, i64 %fusion.5.indvar.dim.0, i64 %fusion.5.indvar.dim.1, i64 %fusion.5.indvar.dim.2, i64 %fusion.5.indvar.dim.3
  %589 = load float* %588
  br label %concatenate.3.merge

concat_index_not_from_operand0128:                ; preds = %fusion.5.loop_body.dim.3
  %590 = sub i64 %fusion.5.indvar.dim.3, 128
  %591 = icmp ult i64 %590, 128
  br i1 %591, label %concat_index_from_operand1129, label %concat_index_not_from_operand1130

concat_index_from_operand1129:                    ; preds = %concat_index_not_from_operand0128
  %592 = getelementptr inbounds [2 x [13 x [13 x [128 x float]]]]* %convolution.6, i64 0, i64 %fusion.5.indvar.dim.0, i64 %fusion.5.indvar.dim.1, i64 %fusion.5.indvar.dim.2, i64 %590
  %593 = load float* %592
  br label %concatenate.3.merge

concat_index_not_from_operand1130:                ; preds = %concat_index_not_from_operand0128
  %594 = sub i64 %590, 128
  unreachable

concatenate.3.merge:                              ; preds = %concat_index_from_operand1129, %concat_index_from_operand0127
  %595 = phi float [ %589, %concat_index_from_operand0127 ], [ %593, %concat_index_from_operand1129 ]
  %596 = getelementptr inbounds [256 x float]* %571, i64 0, i64 %fusion.5.indvar.dim.3
  %597 = load float* %596
  %598 = fadd float %595, %597
  %599 = fcmp oge float %586, %598
  %600 = fcmp une float %586, %586
  %601 = or i1 %599, %600
  %602 = select i1 %601, float %586, float %598
  %603 = getelementptr inbounds [2 x [13 x [13 x [256 x float]]]]* %fusion.5, i64 0, i64 %fusion.5.indvar.dim.0, i64 %fusion.5.indvar.dim.1, i64 %fusion.5.indvar.dim.2, i64 %fusion.5.indvar.dim.3
  store float %602, float* %603
  %invar.inc126 = add nuw nsw i64 %fusion.5.indvar.dim.3, 1
  store i64 %invar.inc126, i64* %fusion.5.invar_address.dim.3
  br label %fusion.5.loop_header.dim.3

fusion.5.loop_exit.dim.3:                         ; preds = %fusion.5.loop_header.dim.3
  %invar.inc125 = add nuw nsw i64 %fusion.5.indvar.dim.2, 1
  store i64 %invar.inc125, i64* %fusion.5.invar_address.dim.2
  br label %fusion.5.loop_header.dim.2

fusion.5.loop_exit.dim.2:                         ; preds = %fusion.5.loop_header.dim.2
  %invar.inc124 = add nuw nsw i64 %fusion.5.indvar.dim.1, 1
  store i64 %invar.inc124, i64* %fusion.5.invar_address.dim.1
  br label %fusion.5.loop_header.dim.1

fusion.5.loop_exit.dim.1:                         ; preds = %fusion.5.loop_header.dim.1
  %invar.inc123 = add nuw nsw i64 %fusion.5.indvar.dim.0, 1
  store i64 %invar.inc123, i64* %fusion.5.invar_address.dim.0
  br label %fusion.5.loop_header.dim.0

fusion.5.loop_exit.dim.0:                         ; preds = %fusion.5.loop_header.dim.0
  %604 = getelementptr inbounds i8** %temps, i64 25
  %605 = load i8** %604, !dereferenceable !13, !align !2
  %606 = getelementptr inbounds i8* %605, i64 2211840
  %reduce-window.4 = bitcast i8* %606 to [2 x [6 x [6 x [256 x float]]]]*
  store i64 0, i64* %reduce-window.4.invar_address.dim.0
  br label %reduce-window.4.loop_header.dim.0

reduce-window.4.loop_header.dim.0:                ; preds = %reduce-window.4.loop_exit.dim.1, %fusion.5.loop_exit.dim.0
  %reduce-window.4.indvar.dim.0 = load i64* %reduce-window.4.invar_address.dim.0
  %607 = icmp uge i64 %reduce-window.4.indvar.dim.0, 2
  br i1 %607, label %reduce-window.4.loop_exit.dim.0, label %reduce-window.4.loop_body.dim.0

reduce-window.4.loop_body.dim.0:                  ; preds = %reduce-window.4.loop_header.dim.0
  store i64 0, i64* %reduce-window.4.invar_address.dim.1
  br label %reduce-window.4.loop_header.dim.1

reduce-window.4.loop_header.dim.1:                ; preds = %reduce-window.4.loop_exit.dim.2, %reduce-window.4.loop_body.dim.0
  %reduce-window.4.indvar.dim.1 = load i64* %reduce-window.4.invar_address.dim.1
  %608 = icmp uge i64 %reduce-window.4.indvar.dim.1, 6
  br i1 %608, label %reduce-window.4.loop_exit.dim.1, label %reduce-window.4.loop_body.dim.1

reduce-window.4.loop_body.dim.1:                  ; preds = %reduce-window.4.loop_header.dim.1
  store i64 0, i64* %reduce-window.4.invar_address.dim.2
  br label %reduce-window.4.loop_header.dim.2

reduce-window.4.loop_header.dim.2:                ; preds = %reduce-window.4.loop_exit.dim.3, %reduce-window.4.loop_body.dim.1
  %reduce-window.4.indvar.dim.2 = load i64* %reduce-window.4.invar_address.dim.2
  %609 = icmp uge i64 %reduce-window.4.indvar.dim.2, 6
  br i1 %609, label %reduce-window.4.loop_exit.dim.2, label %reduce-window.4.loop_body.dim.2

reduce-window.4.loop_body.dim.2:                  ; preds = %reduce-window.4.loop_header.dim.2
  store i64 0, i64* %reduce-window.4.invar_address.dim.3
  br label %reduce-window.4.loop_header.dim.3

reduce-window.4.loop_header.dim.3:                ; preds = %reduce-window.4.inner.loop_exit.window.0, %reduce-window.4.loop_body.dim.2
  %reduce-window.4.indvar.dim.3 = load i64* %reduce-window.4.invar_address.dim.3
  %610 = icmp uge i64 %reduce-window.4.indvar.dim.3, 256
  br i1 %610, label %reduce-window.4.loop_exit.dim.3, label %reduce-window.4.loop_body.dim.3

reduce-window.4.loop_body.dim.3:                  ; preds = %reduce-window.4.loop_header.dim.3
  %611 = load float* @4
  store float %611, float* %reduce_window_accumulator_address135
  store i64 0, i64* %reduce-window.4.inner.invar_address.window.0
  br label %reduce-window.4.inner.loop_header.window.0

reduce-window.4.inner.loop_header.window.0:       ; preds = %reduce-window.4.inner.loop_exit.window.1, %reduce-window.4.loop_body.dim.3
  %reduce-window.4.inner.indvar.window.0 = load i64* %reduce-window.4.inner.invar_address.window.0
  %612 = icmp uge i64 %reduce-window.4.inner.indvar.window.0, 1
  br i1 %612, label %reduce-window.4.inner.loop_exit.window.0, label %reduce-window.4.inner.loop_body.window.0

reduce-window.4.inner.loop_body.window.0:         ; preds = %reduce-window.4.inner.loop_header.window.0
  store i64 0, i64* %reduce-window.4.inner.invar_address.window.1
  br label %reduce-window.4.inner.loop_header.window.1

reduce-window.4.inner.loop_header.window.1:       ; preds = %reduce-window.4.inner.loop_exit.window.2, %reduce-window.4.inner.loop_body.window.0
  %reduce-window.4.inner.indvar.window.1 = load i64* %reduce-window.4.inner.invar_address.window.1
  %613 = icmp uge i64 %reduce-window.4.inner.indvar.window.1, 3
  br i1 %613, label %reduce-window.4.inner.loop_exit.window.1, label %reduce-window.4.inner.loop_body.window.1

reduce-window.4.inner.loop_body.window.1:         ; preds = %reduce-window.4.inner.loop_header.window.1
  store i64 0, i64* %reduce-window.4.inner.invar_address.window.2
  br label %reduce-window.4.inner.loop_header.window.2

reduce-window.4.inner.loop_header.window.2:       ; preds = %reduce-window.4.inner.loop_exit.window.3, %reduce-window.4.inner.loop_body.window.1
  %reduce-window.4.inner.indvar.window.2 = load i64* %reduce-window.4.inner.invar_address.window.2
  %614 = icmp uge i64 %reduce-window.4.inner.indvar.window.2, 3
  br i1 %614, label %reduce-window.4.inner.loop_exit.window.2, label %reduce-window.4.inner.loop_body.window.2

reduce-window.4.inner.loop_body.window.2:         ; preds = %reduce-window.4.inner.loop_header.window.2
  store i64 0, i64* %reduce-window.4.inner.invar_address.window.3
  br label %reduce-window.4.inner.loop_header.window.3

reduce-window.4.inner.loop_header.window.3:       ; preds = %in-bounds-after142, %reduce-window.4.inner.loop_body.window.2
  %reduce-window.4.inner.indvar.window.3 = load i64* %reduce-window.4.inner.invar_address.window.3
  %615 = icmp uge i64 %reduce-window.4.inner.indvar.window.3, 1
  br i1 %615, label %reduce-window.4.inner.loop_exit.window.3, label %reduce-window.4.inner.loop_body.window.3

reduce-window.4.inner.loop_body.window.3:         ; preds = %reduce-window.4.inner.loop_header.window.3
  %616 = mul nsw i64 %reduce-window.4.indvar.dim.0, 1
  %617 = add nsw i64 %616, %reduce-window.4.inner.indvar.window.0
  %618 = sub nsw i64 %617, 0
  %619 = icmp ult i64 %618, 2
  %620 = mul nsw i64 %reduce-window.4.indvar.dim.1, 2
  %621 = add nsw i64 %620, %reduce-window.4.inner.indvar.window.1
  %622 = sub nsw i64 %621, 0
  %623 = icmp ult i64 %622, 13
  %624 = and i1 %619, %623
  %625 = mul nsw i64 %reduce-window.4.indvar.dim.2, 2
  %626 = add nsw i64 %625, %reduce-window.4.inner.indvar.window.2
  %627 = sub nsw i64 %626, 0
  %628 = icmp ult i64 %627, 13
  %629 = and i1 %624, %628
  %630 = mul nsw i64 %reduce-window.4.indvar.dim.3, 1
  %631 = add nsw i64 %630, %reduce-window.4.inner.indvar.window.3
  %632 = sub nsw i64 %631, 0
  %633 = icmp ult i64 %632, 256
  %634 = and i1 %629, %633
  br i1 %634, label %in-bounds-true140, label %in-bounds-false141

in-bounds-after142:                               ; preds = %in-bounds-false141, %in-bounds-true140
  %invar.inc139 = add nuw nsw i64 %reduce-window.4.inner.indvar.window.3, 1
  store i64 %invar.inc139, i64* %reduce-window.4.inner.invar_address.window.3
  br label %reduce-window.4.inner.loop_header.window.3

reduce-window.4.inner.loop_exit.window.3:         ; preds = %reduce-window.4.inner.loop_header.window.3
  %invar.inc138 = add nuw nsw i64 %reduce-window.4.inner.indvar.window.2, 1
  store i64 %invar.inc138, i64* %reduce-window.4.inner.invar_address.window.2
  br label %reduce-window.4.inner.loop_header.window.2

reduce-window.4.inner.loop_exit.window.2:         ; preds = %reduce-window.4.inner.loop_header.window.2
  %invar.inc137 = add nuw nsw i64 %reduce-window.4.inner.indvar.window.1, 1
  store i64 %invar.inc137, i64* %reduce-window.4.inner.invar_address.window.1
  br label %reduce-window.4.inner.loop_header.window.1

reduce-window.4.inner.loop_exit.window.1:         ; preds = %reduce-window.4.inner.loop_header.window.1
  %invar.inc136 = add nuw nsw i64 %reduce-window.4.inner.indvar.window.0, 1
  store i64 %invar.inc136, i64* %reduce-window.4.inner.invar_address.window.0
  br label %reduce-window.4.inner.loop_header.window.0

reduce-window.4.inner.loop_exit.window.0:         ; preds = %reduce-window.4.inner.loop_header.window.0
  %635 = load float* %reduce_window_accumulator_address135
  %636 = getelementptr inbounds [2 x [6 x [6 x [256 x float]]]]* %reduce-window.4, i64 0, i64 %reduce-window.4.indvar.dim.0, i64 %reduce-window.4.indvar.dim.1, i64 %reduce-window.4.indvar.dim.2, i64 %reduce-window.4.indvar.dim.3
  store float %635, float* %636
  %invar.inc134 = add nuw nsw i64 %reduce-window.4.indvar.dim.3, 1
  store i64 %invar.inc134, i64* %reduce-window.4.invar_address.dim.3
  br label %reduce-window.4.loop_header.dim.3

reduce-window.4.loop_exit.dim.3:                  ; preds = %reduce-window.4.loop_header.dim.3
  %invar.inc133 = add nuw nsw i64 %reduce-window.4.indvar.dim.2, 1
  store i64 %invar.inc133, i64* %reduce-window.4.invar_address.dim.2
  br label %reduce-window.4.loop_header.dim.2

reduce-window.4.loop_exit.dim.2:                  ; preds = %reduce-window.4.loop_header.dim.2
  %invar.inc132 = add nuw nsw i64 %reduce-window.4.indvar.dim.1, 1
  store i64 %invar.inc132, i64* %reduce-window.4.invar_address.dim.1
  br label %reduce-window.4.loop_header.dim.1

reduce-window.4.loop_exit.dim.1:                  ; preds = %reduce-window.4.loop_header.dim.1
  %invar.inc131 = add nuw nsw i64 %reduce-window.4.indvar.dim.0, 1
  store i64 %invar.inc131, i64* %reduce-window.4.invar_address.dim.0
  br label %reduce-window.4.loop_header.dim.0

reduce-window.4.loop_exit.dim.0:                  ; preds = %reduce-window.4.loop_header.dim.0
  %bitcast = bitcast [2 x [6 x [6 x [256 x float]]]]* %reduce-window.4 to [2 x [9216 x float]]*
  %637 = getelementptr inbounds i8** %params, i64 10
  %arg10.untyped = load i8** %637, !dereferenceable !16, !align !2
  %638 = bitcast i8* %arg10.untyped to [9216 x [4096 x float]]*
  %639 = getelementptr inbounds i8** %temps, i64 25
  %640 = load i8** %639, !dereferenceable !13, !align !2
  %641 = getelementptr inbounds i8* %640, i64 2285568
  %dot = bitcast i8* %641 to [2 x [4096 x float]]*
  store i64 0, i64* %dot.invar_address.lhs.0
  br label %dot.loop_header.lhs.0

in-bounds-true140:                                ; preds = %reduce-window.4.inner.loop_body.window.3
  %642 = getelementptr inbounds [2 x [13 x [13 x [256 x float]]]]* %fusion.5, i64 0, i64 %618, i64 %622, i64 %627, i64 %632
  %reducer_function_parameter_0_address_as_i8ptr145 = bitcast float* %reduce_window_accumulator_address135 to i8*
  %643 = getelementptr inbounds i8** %reducer_function_parameter_addresses144, i64 0
  store i8* %reducer_function_parameter_0_address_as_i8ptr145, i8** %643
  %reducer_function_parameter_1_address_as_i8ptr146 = bitcast float* %642 to i8*
  %644 = getelementptr inbounds i8** %reducer_function_parameter_addresses144, i64 1
  store i8* %reducer_function_parameter_1_address_as_i8ptr146, i8** %644
  %645 = bitcast float* %reducer_function_return_value_address143 to i8*
  call void @max_float_.v3(i8* %645, i8* %run_options, i8** %reducer_function_parameter_addresses144, i8** %temps, i64* %prof_counters)
  %reducer_function_return_value147 = load float* %reducer_function_return_value_address143
  store float %reducer_function_return_value147, float* %reduce_window_accumulator_address135
  br label %in-bounds-after142

in-bounds-false141:                               ; preds = %reduce-window.4.inner.loop_body.window.3
  br label %in-bounds-after142

dot.loop_header.lhs.0:                            ; preds = %dot.loop_exit.rhs.1, %reduce-window.4.loop_exit.dim.0
  %dot.indvar.lhs.0 = load i64* %dot.invar_address.lhs.0
  %646 = icmp uge i64 %dot.indvar.lhs.0, 2
  br i1 %646, label %dot.loop_exit.lhs.0, label %dot.loop_body.lhs.0

dot.loop_body.lhs.0:                              ; preds = %dot.loop_header.lhs.0
  store i64 0, i64* %dot.invar_address.rhs.1
  br label %dot.loop_header.rhs.1

dot.loop_header.rhs.1:                            ; preds = %dot.loop_exit.reduction, %dot.loop_body.lhs.0
  %dot.indvar.rhs.1 = load i64* %dot.invar_address.rhs.1
  %647 = icmp uge i64 %dot.indvar.rhs.1, 4096
  br i1 %647, label %dot.loop_exit.rhs.1, label %dot.loop_body.rhs.1

dot.loop_body.rhs.1:                              ; preds = %dot.loop_header.rhs.1
  store i64 0, i64* %dot.invar_address.reduction
  store float 0.000000e+00, float* %accum_address
  br label %dot.loop_header.reduction

dot.loop_header.reduction:                        ; preds = %dot.loop_body.reduction, %dot.loop_body.rhs.1
  %dot.indvar.reduction = load i64* %dot.invar_address.reduction
  %648 = icmp uge i64 %dot.indvar.reduction, 9216
  br i1 %648, label %dot.loop_exit.reduction, label %dot.loop_body.reduction

dot.loop_body.reduction:                          ; preds = %dot.loop_header.reduction
  %649 = getelementptr inbounds [2 x [9216 x float]]* %bitcast, i64 0, i64 %dot.indvar.lhs.0, i64 %dot.indvar.reduction
  %650 = load float* %649
  %651 = getelementptr inbounds [9216 x [4096 x float]]* %638, i64 0, i64 %dot.indvar.reduction, i64 %dot.indvar.rhs.1
  %652 = load float* %651
  %653 = load float* %accum_address
  %654 = fmul float %650, %652
  %655 = fadd float %653, %654
  store float %655, float* %accum_address
  %invar.inc150 = add nuw nsw i64 %dot.indvar.reduction, 1
  store i64 %invar.inc150, i64* %dot.invar_address.reduction
  br label %dot.loop_header.reduction

dot.loop_exit.reduction:                          ; preds = %dot.loop_header.reduction
  %656 = load float* %accum_address
  %657 = getelementptr inbounds [2 x [4096 x float]]* %dot, i64 0, i64 %dot.indvar.lhs.0, i64 %dot.indvar.rhs.1
  store float %656, float* %657
  %invar.inc149 = add nuw nsw i64 %dot.indvar.rhs.1, 1
  store i64 %invar.inc149, i64* %dot.invar_address.rhs.1
  br label %dot.loop_header.rhs.1

dot.loop_exit.rhs.1:                              ; preds = %dot.loop_header.rhs.1
  %invar.inc148 = add nuw nsw i64 %dot.indvar.lhs.0, 1
  store i64 %invar.inc148, i64* %dot.invar_address.lhs.0
  br label %dot.loop_header.lhs.0

dot.loop_exit.lhs.0:                              ; preds = %dot.loop_header.lhs.0
  %658 = getelementptr inbounds i8** %params, i64 11
  %arg11.untyped = load i8** %658, !dereferenceable !17, !align !2
  %659 = bitcast i8* %arg11.untyped to [4096 x float]*
  %660 = getelementptr inbounds i8** %temps, i64 25
  %661 = load i8** %660, !dereferenceable !13, !align !2
  %662 = getelementptr inbounds i8* %661, i64 2211840
  %fusion.4 = bitcast i8* %662 to [2 x [4096 x float]]*
  store i64 0, i64* %fusion.4.invar_address.dim.0
  br label %fusion.4.loop_header.dim.0

fusion.4.loop_header.dim.0:                       ; preds = %fusion.4.loop_exit.dim.1, %dot.loop_exit.lhs.0
  %fusion.4.indvar.dim.0 = load i64* %fusion.4.invar_address.dim.0
  %663 = icmp uge i64 %fusion.4.indvar.dim.0, 2
  br i1 %663, label %fusion.4.loop_exit.dim.0, label %fusion.4.loop_body.dim.0

fusion.4.loop_body.dim.0:                         ; preds = %fusion.4.loop_header.dim.0
  store i64 0, i64* %fusion.4.invar_address.dim.1
  br label %fusion.4.loop_header.dim.1

fusion.4.loop_header.dim.1:                       ; preds = %fusion.4.loop_body.dim.1, %fusion.4.loop_body.dim.0
  %fusion.4.indvar.dim.1 = load i64* %fusion.4.invar_address.dim.1
  %664 = icmp uge i64 %fusion.4.indvar.dim.1, 4096
  br i1 %664, label %fusion.4.loop_exit.dim.1, label %fusion.4.loop_body.dim.1

fusion.4.loop_body.dim.1:                         ; preds = %fusion.4.loop_header.dim.1
  %665 = load float* @0
  %666 = getelementptr inbounds [2 x [4096 x float]]* %dot, i64 0, i64 %fusion.4.indvar.dim.0, i64 %fusion.4.indvar.dim.1
  %667 = load float* %666
  %668 = getelementptr inbounds [4096 x float]* %659, i64 0, i64 %fusion.4.indvar.dim.1
  %669 = load float* %668
  %670 = fadd float %667, %669
  %671 = fcmp oge float %665, %670
  %672 = fcmp une float %665, %665
  %673 = or i1 %671, %672
  %674 = select i1 %673, float %665, float %670
  %675 = getelementptr inbounds [2 x [4096 x float]]* %fusion.4, i64 0, i64 %fusion.4.indvar.dim.0, i64 %fusion.4.indvar.dim.1
  store float %674, float* %675
  %invar.inc152 = add nuw nsw i64 %fusion.4.indvar.dim.1, 1
  store i64 %invar.inc152, i64* %fusion.4.invar_address.dim.1
  br label %fusion.4.loop_header.dim.1

fusion.4.loop_exit.dim.1:                         ; preds = %fusion.4.loop_header.dim.1
  %invar.inc151 = add nuw nsw i64 %fusion.4.indvar.dim.0, 1
  store i64 %invar.inc151, i64* %fusion.4.invar_address.dim.0
  br label %fusion.4.loop_header.dim.0

fusion.4.loop_exit.dim.0:                         ; preds = %fusion.4.loop_header.dim.0
  %676 = getelementptr inbounds i8** %params, i64 12
  %arg12.untyped = load i8** %676, !dereferenceable !18, !align !2
  %677 = bitcast i8* %arg12.untyped to [4096 x [4096 x float]]*
  %678 = getelementptr inbounds i8** %temps, i64 25
  %679 = load i8** %678, !dereferenceable !13, !align !2
  %680 = getelementptr inbounds i8* %679, i64 2244608
  %dot.1 = bitcast i8* %680 to [2 x [4096 x float]]*
  store i64 0, i64* %dot.1.invar_address.lhs.0
  br label %dot.1.loop_header.lhs.0

dot.1.loop_header.lhs.0:                          ; preds = %dot.1.loop_exit.rhs.1, %fusion.4.loop_exit.dim.0
  %dot.1.indvar.lhs.0 = load i64* %dot.1.invar_address.lhs.0
  %681 = icmp uge i64 %dot.1.indvar.lhs.0, 2
  br i1 %681, label %dot.1.loop_exit.lhs.0, label %dot.1.loop_body.lhs.0

dot.1.loop_body.lhs.0:                            ; preds = %dot.1.loop_header.lhs.0
  store i64 0, i64* %dot.1.invar_address.rhs.1
  br label %dot.1.loop_header.rhs.1

dot.1.loop_header.rhs.1:                          ; preds = %dot.1.loop_exit.reduction, %dot.1.loop_body.lhs.0
  %dot.1.indvar.rhs.1 = load i64* %dot.1.invar_address.rhs.1
  %682 = icmp uge i64 %dot.1.indvar.rhs.1, 4096
  br i1 %682, label %dot.1.loop_exit.rhs.1, label %dot.1.loop_body.rhs.1

dot.1.loop_body.rhs.1:                            ; preds = %dot.1.loop_header.rhs.1
  store i64 0, i64* %dot.1.invar_address.reduction
  store float 0.000000e+00, float* %accum_address156
  br label %dot.1.loop_header.reduction

dot.1.loop_header.reduction:                      ; preds = %dot.1.loop_body.reduction, %dot.1.loop_body.rhs.1
  %dot.1.indvar.reduction = load i64* %dot.1.invar_address.reduction
  %683 = icmp uge i64 %dot.1.indvar.reduction, 4096
  br i1 %683, label %dot.1.loop_exit.reduction, label %dot.1.loop_body.reduction

dot.1.loop_body.reduction:                        ; preds = %dot.1.loop_header.reduction
  %684 = getelementptr inbounds [2 x [4096 x float]]* %fusion.4, i64 0, i64 %dot.1.indvar.lhs.0, i64 %dot.1.indvar.reduction
  %685 = load float* %684
  %686 = getelementptr inbounds [4096 x [4096 x float]]* %677, i64 0, i64 %dot.1.indvar.reduction, i64 %dot.1.indvar.rhs.1
  %687 = load float* %686
  %688 = load float* %accum_address156
  %689 = fmul float %685, %687
  %690 = fadd float %688, %689
  store float %690, float* %accum_address156
  %invar.inc155 = add nuw nsw i64 %dot.1.indvar.reduction, 1
  store i64 %invar.inc155, i64* %dot.1.invar_address.reduction
  br label %dot.1.loop_header.reduction

dot.1.loop_exit.reduction:                        ; preds = %dot.1.loop_header.reduction
  %691 = load float* %accum_address156
  %692 = getelementptr inbounds [2 x [4096 x float]]* %dot.1, i64 0, i64 %dot.1.indvar.lhs.0, i64 %dot.1.indvar.rhs.1
  store float %691, float* %692
  %invar.inc154 = add nuw nsw i64 %dot.1.indvar.rhs.1, 1
  store i64 %invar.inc154, i64* %dot.1.invar_address.rhs.1
  br label %dot.1.loop_header.rhs.1

dot.1.loop_exit.rhs.1:                            ; preds = %dot.1.loop_header.rhs.1
  %invar.inc153 = add nuw nsw i64 %dot.1.indvar.lhs.0, 1
  store i64 %invar.inc153, i64* %dot.1.invar_address.lhs.0
  br label %dot.1.loop_header.lhs.0

dot.1.loop_exit.lhs.0:                            ; preds = %dot.1.loop_header.lhs.0
  %693 = getelementptr inbounds i8** %params, i64 13
  %arg13.untyped = load i8** %693, !dereferenceable !17, !align !2
  %694 = bitcast i8* %arg13.untyped to [4096 x float]*
  %695 = getelementptr inbounds i8** %temps, i64 25
  %696 = load i8** %695, !dereferenceable !13, !align !2
  %697 = getelementptr inbounds i8* %696, i64 2211840
  %fusion.3 = bitcast i8* %697 to [2 x [4096 x float]]*
  store i64 0, i64* %fusion.3.invar_address.dim.0
  br label %fusion.3.loop_header.dim.0

fusion.3.loop_header.dim.0:                       ; preds = %fusion.3.loop_exit.dim.1, %dot.1.loop_exit.lhs.0
  %fusion.3.indvar.dim.0 = load i64* %fusion.3.invar_address.dim.0
  %698 = icmp uge i64 %fusion.3.indvar.dim.0, 2
  br i1 %698, label %fusion.3.loop_exit.dim.0, label %fusion.3.loop_body.dim.0

fusion.3.loop_body.dim.0:                         ; preds = %fusion.3.loop_header.dim.0
  store i64 0, i64* %fusion.3.invar_address.dim.1
  br label %fusion.3.loop_header.dim.1

fusion.3.loop_header.dim.1:                       ; preds = %fusion.3.loop_body.dim.1, %fusion.3.loop_body.dim.0
  %fusion.3.indvar.dim.1 = load i64* %fusion.3.invar_address.dim.1
  %699 = icmp uge i64 %fusion.3.indvar.dim.1, 4096
  br i1 %699, label %fusion.3.loop_exit.dim.1, label %fusion.3.loop_body.dim.1

fusion.3.loop_body.dim.1:                         ; preds = %fusion.3.loop_header.dim.1
  %700 = load float* @0
  %701 = getelementptr inbounds [2 x [4096 x float]]* %dot.1, i64 0, i64 %fusion.3.indvar.dim.0, i64 %fusion.3.indvar.dim.1
  %702 = load float* %701
  %703 = getelementptr inbounds [4096 x float]* %694, i64 0, i64 %fusion.3.indvar.dim.1
  %704 = load float* %703
  %705 = fadd float %702, %704
  %706 = fcmp oge float %700, %705
  %707 = fcmp une float %700, %700
  %708 = or i1 %706, %707
  %709 = select i1 %708, float %700, float %705
  %710 = getelementptr inbounds [2 x [4096 x float]]* %fusion.3, i64 0, i64 %fusion.3.indvar.dim.0, i64 %fusion.3.indvar.dim.1
  store float %709, float* %710
  %invar.inc158 = add nuw nsw i64 %fusion.3.indvar.dim.1, 1
  store i64 %invar.inc158, i64* %fusion.3.invar_address.dim.1
  br label %fusion.3.loop_header.dim.1

fusion.3.loop_exit.dim.1:                         ; preds = %fusion.3.loop_header.dim.1
  %invar.inc157 = add nuw nsw i64 %fusion.3.indvar.dim.0, 1
  store i64 %invar.inc157, i64* %fusion.3.invar_address.dim.0
  br label %fusion.3.loop_header.dim.0

fusion.3.loop_exit.dim.0:                         ; preds = %fusion.3.loop_header.dim.0
  %711 = getelementptr inbounds i8** %params, i64 14
  %arg14.untyped = load i8** %711, !dereferenceable !19, !align !2
  %712 = bitcast i8* %arg14.untyped to [4096 x [1000 x float]]*
  %713 = getelementptr inbounds i8** %temps, i64 19
  %714 = load i8** %713, !dereferenceable !20, !align !2
  %dot.2 = bitcast i8* %714 to [2 x [1000 x float]]*
  store i64 0, i64* %dot.2.invar_address.lhs.0
  br label %dot.2.loop_header.lhs.0

dot.2.loop_header.lhs.0:                          ; preds = %dot.2.loop_exit.rhs.1, %fusion.3.loop_exit.dim.0
  %dot.2.indvar.lhs.0 = load i64* %dot.2.invar_address.lhs.0
  %715 = icmp uge i64 %dot.2.indvar.lhs.0, 2
  br i1 %715, label %dot.2.loop_exit.lhs.0, label %dot.2.loop_body.lhs.0

dot.2.loop_body.lhs.0:                            ; preds = %dot.2.loop_header.lhs.0
  store i64 0, i64* %dot.2.invar_address.rhs.1
  br label %dot.2.loop_header.rhs.1

dot.2.loop_header.rhs.1:                          ; preds = %dot.2.loop_exit.reduction, %dot.2.loop_body.lhs.0
  %dot.2.indvar.rhs.1 = load i64* %dot.2.invar_address.rhs.1
  %716 = icmp uge i64 %dot.2.indvar.rhs.1, 1000
  br i1 %716, label %dot.2.loop_exit.rhs.1, label %dot.2.loop_body.rhs.1

dot.2.loop_body.rhs.1:                            ; preds = %dot.2.loop_header.rhs.1
  store i64 0, i64* %dot.2.invar_address.reduction
  store float 0.000000e+00, float* %accum_address162
  br label %dot.2.loop_header.reduction

dot.2.loop_header.reduction:                      ; preds = %dot.2.loop_body.reduction, %dot.2.loop_body.rhs.1
  %dot.2.indvar.reduction = load i64* %dot.2.invar_address.reduction
  %717 = icmp uge i64 %dot.2.indvar.reduction, 4096
  br i1 %717, label %dot.2.loop_exit.reduction, label %dot.2.loop_body.reduction

dot.2.loop_body.reduction:                        ; preds = %dot.2.loop_header.reduction
  %718 = getelementptr inbounds [2 x [4096 x float]]* %fusion.3, i64 0, i64 %dot.2.indvar.lhs.0, i64 %dot.2.indvar.reduction
  %719 = load float* %718
  %720 = getelementptr inbounds [4096 x [1000 x float]]* %712, i64 0, i64 %dot.2.indvar.reduction, i64 %dot.2.indvar.rhs.1
  %721 = load float* %720
  %722 = load float* %accum_address162
  %723 = fmul float %719, %721
  %724 = fadd float %722, %723
  store float %724, float* %accum_address162
  %invar.inc161 = add nuw nsw i64 %dot.2.indvar.reduction, 1
  store i64 %invar.inc161, i64* %dot.2.invar_address.reduction
  br label %dot.2.loop_header.reduction

dot.2.loop_exit.reduction:                        ; preds = %dot.2.loop_header.reduction
  %725 = load float* %accum_address162
  %726 = getelementptr inbounds [2 x [1000 x float]]* %dot.2, i64 0, i64 %dot.2.indvar.lhs.0, i64 %dot.2.indvar.rhs.1
  store float %725, float* %726
  %invar.inc160 = add nuw nsw i64 %dot.2.indvar.rhs.1, 1
  store i64 %invar.inc160, i64* %dot.2.invar_address.rhs.1
  br label %dot.2.loop_header.rhs.1

dot.2.loop_exit.rhs.1:                            ; preds = %dot.2.loop_header.rhs.1
  %invar.inc159 = add nuw nsw i64 %dot.2.indvar.lhs.0, 1
  store i64 %invar.inc159, i64* %dot.2.invar_address.lhs.0
  br label %dot.2.loop_header.lhs.0

dot.2.loop_exit.lhs.0:                            ; preds = %dot.2.loop_header.lhs.0
  %727 = getelementptr inbounds i8** %params, i64 15
  %arg15.untyped = load i8** %727, !dereferenceable !21, !align !2
  %728 = bitcast i8* %arg15.untyped to [1000 x float]*
  %729 = getelementptr inbounds i8** %temps, i64 25
  %730 = load i8** %729, !dereferenceable !13, !align !2
  %731 = getelementptr inbounds i8* %730, i64 2211840
  %fusion.2 = bitcast i8* %731 to [2 x [1000 x float]]*
  store i64 0, i64* %fusion.2.invar_address.dim.0
  br label %fusion.2.loop_header.dim.0

fusion.2.loop_header.dim.0:                       ; preds = %fusion.2.loop_exit.dim.1, %dot.2.loop_exit.lhs.0
  %fusion.2.indvar.dim.0 = load i64* %fusion.2.invar_address.dim.0
  %732 = icmp uge i64 %fusion.2.indvar.dim.0, 2
  br i1 %732, label %fusion.2.loop_exit.dim.0, label %fusion.2.loop_body.dim.0

fusion.2.loop_body.dim.0:                         ; preds = %fusion.2.loop_header.dim.0
  store i64 0, i64* %fusion.2.invar_address.dim.1
  br label %fusion.2.loop_header.dim.1

fusion.2.loop_header.dim.1:                       ; preds = %fusion.2.loop_body.dim.1, %fusion.2.loop_body.dim.0
  %fusion.2.indvar.dim.1 = load i64* %fusion.2.invar_address.dim.1
  %733 = icmp uge i64 %fusion.2.indvar.dim.1, 1000
  br i1 %733, label %fusion.2.loop_exit.dim.1, label %fusion.2.loop_body.dim.1

fusion.2.loop_body.dim.1:                         ; preds = %fusion.2.loop_header.dim.1
  %734 = getelementptr inbounds [2 x [1000 x float]]* %dot.2, i64 0, i64 %fusion.2.indvar.dim.0, i64 %fusion.2.indvar.dim.1
  %735 = load float* %734
  %736 = getelementptr inbounds [1000 x float]* %728, i64 0, i64 %fusion.2.indvar.dim.1
  %737 = load float* %736
  %738 = fadd float %735, %737
  %739 = getelementptr inbounds [2 x [1000 x float]]* %fusion.2, i64 0, i64 %fusion.2.indvar.dim.0, i64 %fusion.2.indvar.dim.1
  store float %738, float* %739
  %invar.inc164 = add nuw nsw i64 %fusion.2.indvar.dim.1, 1
  store i64 %invar.inc164, i64* %fusion.2.invar_address.dim.1
  br label %fusion.2.loop_header.dim.1

fusion.2.loop_exit.dim.1:                         ; preds = %fusion.2.loop_header.dim.1
  %invar.inc163 = add nuw nsw i64 %fusion.2.indvar.dim.0, 1
  store i64 %invar.inc163, i64* %fusion.2.invar_address.dim.0
  br label %fusion.2.loop_header.dim.0

fusion.2.loop_exit.dim.0:                         ; preds = %fusion.2.loop_header.dim.0
  %740 = getelementptr inbounds i8** %temps, i64 25
  %741 = load i8** %740, !dereferenceable !13, !align !2
  %742 = getelementptr inbounds i8* %741, i64 2219840
  %reduce = bitcast i8* %742 to [2 x float]*
  store i64 0, i64* %reduce.invar_address.dim.0
  br label %reduce.loop_header.dim.0

reduce.loop_header.dim.0:                         ; preds = %reduce.inner.loop_exit.reduction_dim.1, %fusion.2.loop_exit.dim.0
  %reduce.indvar.dim.0 = load i64* %reduce.invar_address.dim.0
  %743 = icmp uge i64 %reduce.indvar.dim.0, 2
  br i1 %743, label %reduce.loop_exit.dim.0, label %reduce.loop_body.dim.0

reduce.loop_body.dim.0:                           ; preds = %reduce.loop_header.dim.0
  %744 = load float* @4
  store float %744, float* %accumulator
  store i64 0, i64* %reduce.inner.invar_address.reduction_dim.1
  br label %reduce.inner.loop_header.reduction_dim.1

reduce.inner.loop_header.reduction_dim.1:         ; preds = %reduce.inner.loop_body.reduction_dim.1, %reduce.loop_body.dim.0
  %reduce.inner.indvar.reduction_dim.1 = load i64* %reduce.inner.invar_address.reduction_dim.1
  %745 = icmp uge i64 %reduce.inner.indvar.reduction_dim.1, 1000
  br i1 %745, label %reduce.inner.loop_exit.reduction_dim.1, label %reduce.inner.loop_body.reduction_dim.1

reduce.inner.loop_body.reduction_dim.1:           ; preds = %reduce.inner.loop_header.reduction_dim.1
  %746 = getelementptr inbounds [2 x [1000 x float]]* %fusion.2, i64 0, i64 %reduce.indvar.dim.0, i64 %reduce.inner.indvar.reduction_dim.1
  %reduce_function_parameter_0_address_as_i8ptr = bitcast float* %accumulator to i8*
  %747 = getelementptr inbounds i8** %reduce_function_parameter_addresses, i64 0
  store i8* %reduce_function_parameter_0_address_as_i8ptr, i8** %747
  %reduce_function_parameter_1_address_as_i8ptr = bitcast float* %746 to i8*
  %748 = getelementptr inbounds i8** %reduce_function_parameter_addresses, i64 1
  store i8* %reduce_function_parameter_1_address_as_i8ptr, i8** %748
  %749 = bitcast float* %reduce_function_return_value_address to i8*
  call void @max_float_.v3(i8* %749, i8* %run_options, i8** %reduce_function_parameter_addresses, i8** %temps, i64* %prof_counters)
  %reduce_function_return_value = load float* %reduce_function_return_value_address
  store float %reduce_function_return_value, float* %accumulator
  %invar.inc166 = add nuw nsw i64 %reduce.inner.indvar.reduction_dim.1, 1
  store i64 %invar.inc166, i64* %reduce.inner.invar_address.reduction_dim.1
  br label %reduce.inner.loop_header.reduction_dim.1

reduce.inner.loop_exit.reduction_dim.1:           ; preds = %reduce.inner.loop_header.reduction_dim.1
  %750 = load float* %accumulator
  %751 = getelementptr inbounds [2 x float]* %reduce, i64 0, i64 %reduce.indvar.dim.0
  store float %750, float* %751
  %invar.inc165 = add nuw nsw i64 %reduce.indvar.dim.0, 1
  store i64 %invar.inc165, i64* %reduce.invar_address.dim.0
  br label %reduce.loop_header.dim.0

reduce.loop_exit.dim.0:                           ; preds = %reduce.loop_header.dim.0
  %752 = getelementptr inbounds i8** %temps, i64 25
  %753 = load i8** %752, !dereferenceable !13, !align !2
  %754 = getelementptr inbounds i8* %753, i64 2211840
  %fusion.1 = bitcast i8* %754 to [2 x [1000 x float]]*
  store i64 0, i64* %fusion.1.invar_address.dim.0
  br label %fusion.1.loop_header.dim.0

fusion.1.loop_header.dim.0:                       ; preds = %fusion.1.loop_exit.dim.1, %reduce.loop_exit.dim.0
  %fusion.1.indvar.dim.0 = load i64* %fusion.1.invar_address.dim.0
  %755 = icmp uge i64 %fusion.1.indvar.dim.0, 2
  br i1 %755, label %fusion.1.loop_exit.dim.0, label %fusion.1.loop_body.dim.0

fusion.1.loop_body.dim.0:                         ; preds = %fusion.1.loop_header.dim.0
  store i64 0, i64* %fusion.1.invar_address.dim.1
  br label %fusion.1.loop_header.dim.1

fusion.1.loop_header.dim.1:                       ; preds = %fusion.1.loop_body.dim.1, %fusion.1.loop_body.dim.0
  %fusion.1.indvar.dim.1 = load i64* %fusion.1.invar_address.dim.1
  %756 = icmp uge i64 %fusion.1.indvar.dim.1, 1000
  br i1 %756, label %fusion.1.loop_exit.dim.1, label %fusion.1.loop_body.dim.1

fusion.1.loop_body.dim.1:                         ; preds = %fusion.1.loop_header.dim.1
  %757 = getelementptr inbounds [2 x [1000 x float]]* %dot.2, i64 0, i64 %fusion.1.indvar.dim.0, i64 %fusion.1.indvar.dim.1
  %758 = load float* %757
  %759 = getelementptr inbounds [1000 x float]* %728, i64 0, i64 %fusion.1.indvar.dim.1
  %760 = load float* %759
  %761 = fadd float %758, %760
  %762 = getelementptr inbounds [2 x float]* %reduce, i64 0, i64 %fusion.1.indvar.dim.0
  %763 = load float* %762
  %764 = fsub float %761, %763
  %765 = call float @llvm.exp.f32(float %764)
  %766 = getelementptr inbounds [2 x [1000 x float]]* %fusion.1, i64 0, i64 %fusion.1.indvar.dim.0, i64 %fusion.1.indvar.dim.1
  store float %765, float* %766
  %invar.inc168 = add nuw nsw i64 %fusion.1.indvar.dim.1, 1
  store i64 %invar.inc168, i64* %fusion.1.invar_address.dim.1
  br label %fusion.1.loop_header.dim.1

fusion.1.loop_exit.dim.1:                         ; preds = %fusion.1.loop_header.dim.1
  %invar.inc167 = add nuw nsw i64 %fusion.1.indvar.dim.0, 1
  store i64 %invar.inc167, i64* %fusion.1.invar_address.dim.0
  br label %fusion.1.loop_header.dim.0

fusion.1.loop_exit.dim.0:                         ; preds = %fusion.1.loop_header.dim.0
  %767 = getelementptr inbounds i8** %temps, i64 25
  %768 = load i8** %767, !dereferenceable !13, !align !2
  %769 = getelementptr inbounds i8* %768, i64 2219840
  %reduce.1 = bitcast i8* %769 to [2 x float]*
  store i64 0, i64* %reduce.1.invar_address.dim.0
  br label %reduce.1.loop_header.dim.0

reduce.1.loop_header.dim.0:                       ; preds = %reduce.1.inner.loop_exit.reduction_dim.1, %fusion.1.loop_exit.dim.0
  %reduce.1.indvar.dim.0 = load i64* %reduce.1.invar_address.dim.0
  %770 = icmp uge i64 %reduce.1.indvar.dim.0, 2
  br i1 %770, label %reduce.1.loop_exit.dim.0, label %reduce.1.loop_body.dim.0

reduce.1.loop_body.dim.0:                         ; preds = %reduce.1.loop_header.dim.0
  %771 = load float* @0
  store float %771, float* %accumulator170
  store i64 0, i64* %reduce.1.inner.invar_address.reduction_dim.1
  br label %reduce.1.inner.loop_header.reduction_dim.1

reduce.1.inner.loop_header.reduction_dim.1:       ; preds = %reduce.1.inner.loop_body.reduction_dim.1, %reduce.1.loop_body.dim.0
  %reduce.1.inner.indvar.reduction_dim.1 = load i64* %reduce.1.inner.invar_address.reduction_dim.1
  %772 = icmp uge i64 %reduce.1.inner.indvar.reduction_dim.1, 1000
  br i1 %772, label %reduce.1.inner.loop_exit.reduction_dim.1, label %reduce.1.inner.loop_body.reduction_dim.1

reduce.1.inner.loop_body.reduction_dim.1:         ; preds = %reduce.1.inner.loop_header.reduction_dim.1
  %773 = getelementptr inbounds [2 x [1000 x float]]* %fusion.1, i64 0, i64 %reduce.1.indvar.dim.0, i64 %reduce.1.inner.indvar.reduction_dim.1
  %reduce_function_parameter_0_address_as_i8ptr174 = bitcast float* %accumulator170 to i8*
  %774 = getelementptr inbounds i8** %reduce_function_parameter_addresses173, i64 0
  store i8* %reduce_function_parameter_0_address_as_i8ptr174, i8** %774
  %reduce_function_parameter_1_address_as_i8ptr175 = bitcast float* %773 to i8*
  %775 = getelementptr inbounds i8** %reduce_function_parameter_addresses173, i64 1
  store i8* %reduce_function_parameter_1_address_as_i8ptr175, i8** %775
  %776 = bitcast float* %reduce_function_return_value_address172 to i8*
  call void @add_float_.v3(i8* %776, i8* %run_options, i8** %reduce_function_parameter_addresses173, i8** %temps, i64* %prof_counters)
  %reduce_function_return_value176 = load float* %reduce_function_return_value_address172
  store float %reduce_function_return_value176, float* %accumulator170
  %invar.inc171 = add nuw nsw i64 %reduce.1.inner.indvar.reduction_dim.1, 1
  store i64 %invar.inc171, i64* %reduce.1.inner.invar_address.reduction_dim.1
  br label %reduce.1.inner.loop_header.reduction_dim.1

reduce.1.inner.loop_exit.reduction_dim.1:         ; preds = %reduce.1.inner.loop_header.reduction_dim.1
  %777 = load float* %accumulator170
  %778 = getelementptr inbounds [2 x float]* %reduce.1, i64 0, i64 %reduce.1.indvar.dim.0
  store float %777, float* %778
  %invar.inc169 = add nuw nsw i64 %reduce.1.indvar.dim.0, 1
  store i64 %invar.inc169, i64* %reduce.1.invar_address.dim.0
  br label %reduce.1.loop_header.dim.0

reduce.1.loop_exit.dim.0:                         ; preds = %reduce.1.loop_header.dim.0
  %779 = getelementptr inbounds i8** %temps, i64 19
  %780 = load i8** %779, !dereferenceable !20, !align !2
  %fusion = bitcast i8* %780 to [2 x [1000 x float]]*
  store i64 0, i64* %fusion.invar_address.dim.0
  br label %fusion.loop_header.dim.0

fusion.loop_header.dim.0:                         ; preds = %fusion.loop_exit.dim.1, %reduce.1.loop_exit.dim.0
  %fusion.indvar.dim.0 = load i64* %fusion.invar_address.dim.0
  %781 = icmp uge i64 %fusion.indvar.dim.0, 2
  br i1 %781, label %fusion.loop_exit.dim.0, label %fusion.loop_body.dim.0

fusion.loop_body.dim.0:                           ; preds = %fusion.loop_header.dim.0
  store i64 0, i64* %fusion.invar_address.dim.1
  br label %fusion.loop_header.dim.1

fusion.loop_header.dim.1:                         ; preds = %fusion.loop_body.dim.1, %fusion.loop_body.dim.0
  %fusion.indvar.dim.1 = load i64* %fusion.invar_address.dim.1
  %782 = icmp uge i64 %fusion.indvar.dim.1, 1000
  br i1 %782, label %fusion.loop_exit.dim.1, label %fusion.loop_body.dim.1

fusion.loop_body.dim.1:                           ; preds = %fusion.loop_header.dim.1
  %783 = getelementptr inbounds [2 x [1000 x float]]* %fusion.1, i64 0, i64 %fusion.indvar.dim.0, i64 %fusion.indvar.dim.1
  %784 = load float* %783
  %785 = getelementptr inbounds [2 x float]* %reduce.1, i64 0, i64 %fusion.indvar.dim.0
  %786 = load float* %785
  %787 = fdiv float %784, %786
  %788 = getelementptr inbounds [2 x [1000 x float]]* %fusion, i64 0, i64 %fusion.indvar.dim.0, i64 %fusion.indvar.dim.1
  store float %787, float* %788
  %invar.inc178 = add nuw nsw i64 %fusion.indvar.dim.1, 1
  store i64 %invar.inc178, i64* %fusion.invar_address.dim.1
  br label %fusion.loop_header.dim.1

fusion.loop_exit.dim.1:                           ; preds = %fusion.loop_header.dim.1
  %invar.inc177 = add nuw nsw i64 %fusion.indvar.dim.0, 1
  store i64 %invar.inc177, i64* %fusion.invar_address.dim.0
  br label %fusion.loop_header.dim.0

fusion.loop_exit.dim.0:                           ; preds = %fusion.loop_header.dim.0
  %tuple.1 = bitcast i8* %retval to [1 x i8*]*
  %789 = getelementptr inbounds [1 x i8*]* %tuple.1, i64 0, i64 0
  %790 = bitcast [2 x [1000 x float]]* %fusion to i8*
  store i8* %790, i8** %789
  ret void
}

; Function Attrs: nounwind
declare void @__xla_cpu_runtime_ParallelForkJoin(i8*, i8*, i8**, i8**, i64*, i32, i64*, i32, i8*) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: nounwind readnone speculatable
declare float @llvm.exp.f32(float) #1

attributes #0 = { "no-frame-pointer-elim"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { nounwind }

!0 = metadata !{i64 4}
!1 = metadata !{i64 1769472}
!2 = metadata !{i64 16}
!3 = metadata !{i64 2654208}
!4 = metadata !{i64 1228800}
!5 = metadata !{i64 2495232}
!6 = metadata !{i64 1605632}
!7 = metadata !{i64 802816}
!8 = metadata !{i64 1024}
!9 = metadata !{i64 384}
!10 = metadata !{i64 8}
!11 = metadata !{i64 139392}
!12 = metadata !{i64 1236696}
!13 = metadata !{i64 19116224}
!14 = metadata !{i64 3538944}
!15 = metadata !{i64 1536}
!16 = metadata !{i64 150994944}
!17 = metadata !{i64 16384}
!18 = metadata !{i64 67108864}
!19 = metadata !{i64 16384000}
!20 = metadata !{i64 8000}
!21 = metadata !{i64 4000}
