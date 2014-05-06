This repository contains some basic example of CUDA C programs

References:
 * The book: CUDA BY EXAMPLE
 * nVidia on-line documentation

To compile from the command line, type:

nvcc -o filename filename.cu

To run:

./filename

Where filename is the name of the file.

Files:
 * hello_kernel.cu : Just call an empty kernel 
 * simple_sum.cu   : Simple sum
 * array_sum.cu    : Sum two arrays
 * thrust_sum.cu   : Simple sum example with thrust C++ template library
 * gpu_info.cu     : Print the GPU infos

Tested on:

 * nvcc: NVIDIA (R) Cuda compiler driver
   Copyright (c) 2005-2013 NVIDIA Corporation
   Built on Tue_Apr__1_01:38:47_PDT_2014
   Cuda compilation tools, release 6.0, V6.0.1

 * Device name: GeForce GT 750M
  Memory Clock Rate (KHz): 2508000
  Memory Bus Width (bits): 128
  Peak Memory Bandwidth (GB/s): 80.256000
  Device capability 3.0

