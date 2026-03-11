# Exercise: LIKWID

**Note: This exercise only works on Linux. And you need to install LIKWID first.**

To install LIKWID run `orga/likwid_local_install/install_likwid.sh`.

In this exercise you will use **LIKWID.jl** to
A) count the number of floating point operations performed by a CPU core, and
B) perform a "simple" memory-transfer analysis of a "**Schönauer Triad**" kernel (i.e. `a[i] = b[i] + c[i] * d[i]`).

See the files `countflops.ipynb` (A) and `writealloc.ipynb` (B) respectively.