#include <stdio.h>

/*
 * Scopo: somma due interi
 *
 * Tasks:
 *  * Uso di un kernel
 *  * allocazione delle memoria GPU
 *  * Trasferimento di un intero dalla GPU al processore
 */

// Attenzione a questa parola chiave. Definisce un kernel, ovvero un processo che avviene
// sulla GPU
__global__ void dark(void)
{
	// Oggi non mi va di fare nulla. E in effetti non faccio niente.
}

// Come sopra, ma questa volta il kernel è estremamente complesso ;)
__global__ void add(int a, int b, int *c)
{
	*c = a + b;
}

int main(void)
{
	int c;
	int *dev_c;

	// Devo allocare la memoria
	cudaMalloc( (void**)&dev_c, sizeof(int) );

	// lancio il kernel
	add<<<1,1>>>(2,4, dev_c);

	// Il numerello sta ancora sulla GPU. Me lo devo copiare sulla mamoria del processore
	// prima di poterlo usare
	cudaMemcpy(&c, dev_c, sizeof(int), cudaMemcpyDeviceToHost );

	//printf("Benvenuto nel magico mondo delle GPU. Guarda il file 'somma.cu' per capire di cosa si tratta.\n");
	printf("2 + 4 = %d\n", c);

	// E' sempre una buona abitudine liberare la memoria dopo averla usata
	cudaFree( dev_c );

	return 0;
}
