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
  
