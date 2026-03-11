# Exercises - Day 2

## Single-Core performance optimization

### `1_perf_optimization` <small>(definitely do this one)</small>

Given an examplatory code snippet, your task will be to optimize it (as much as you can/want to) by utilizing parts of what you've learned in the morning.

### `2_cache_bandwidths` <small>(at least look at the result plots)</small>

By means of a Schoenauer triad kernel, you'll try to measure the effect of the memory hierarchy (i.e. caches) on performance for a CPU-core in a cluster compute node.

### `3_dense_matmul` <small>(maybe skip)</small>

Here, we'll consider a seemingly simple computation: (dense) matrix-matrix multiplication. You will see that different implementations (e.g. naive vs cache blocking) have vastly different performance.

### `4_SIMD_datadep` <small>(do this one)</small>

In this exercise, you'll be given a for loop with a data dependency that isn't readily vectorizable. You'll learn how you can rewrite the loop to facilitate SIMD and improve the performance.

## Want more?

### 2D Difussion <small>(preparing for tomorrow)</small>

Look at `exercises/Day3/multithreading/2_diffusion_2d_multithreading` and make yourself familiar with the serial implementation.

### `5_likwid` <small>(need to install LIKWID + only works on Linux)</small>

In this exercise you will reproduce the "counting flops" demonstration from the kickoff presentation. We will use Jupyter instead of Pluto though.

