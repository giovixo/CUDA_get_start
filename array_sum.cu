/*
 * sarray.cu
 *
 *  Created on: 18/apr/2014
 *      Author: Giovanni De Cesare
 *
 *      Scopo: somma due vettori
 */

#include <stdio.h>

#define N 10

// Attenzione a questa parola chiave. Definisce un kernel, ovvero un processo che avviene
// sulla GPU
__global__ void dark(void)
{
	// Oggi non mi va di fare nulla. E in effetti non faccio niente.
}

// Questo kernel calcola la somma di due vettori "a[N]" e "b[N]"
// I cores della GPU che vanno da 0 a N fanno una somma.
__global__ void add(int *a, int *b, int *c)
{
	int id = blockIdx.x; 
	if (id < N)
	{
		c[id]= a[id] + b[id];
	}
}

int main(void)
{
	int a[N], b[N], c[N]; // tre vettori a, b, c allocati sulla CPU
	int *dev_a, *dev_b, *dev_c; // tre vettori dev_[a,b,c] da allocare sulla GPU

	// Devo allocare la memoria della GPU per i tre vettori a, b, c
	cudaMalloc( (void**)&dev_a, N * sizeof(int) );
	cudaMalloc( (void**)&dev_b, N * sizeof(int) );
	cudaMalloc( (void**)&dev_c, N * sizeof(int) );

	// Assegno ai vettori a, b dei valori (arbitrari)
	for (int i=0; i < N; i++)
	{
		a[i] = i;
		b[i] = i;
	}
	// Quindi copio a, b nella GPU
	cudaMemcpy(dev_a, a, N * sizeof(int), cudaMemcpyHostToDevice );
	cudaMemcpy(dev_b, b, N * sizeof(int), cudaMemcpyHostToDevice );

	// lancio il kernel
	add<<<N,1>>>(dev_a, dev_b, dev_c);

	// L'array somma c sta ancora sulla GPU. Lo devo copiare sulla mamoria del processore
	// prima di poterlo usare
	cudaMemcpy(c, dev_c, N * sizeof(int), cudaMemcpyDeviceToHost );

	// Finalmente scrivo il risultato della somma
	for (int i=0; i<N; i++)
	{
		printf("%d + %d = %d\n", a[i], b[i], c[i]);
	}

	// E' sempre una buona abitudine liberare la memoria dopo averla usata
	cudaFree( dev_a );
	cudaFree( dev_b );
	cudaFree( dev_c );

	printf("Bye.\n");

	return 0;
}

