#include <stdio.h>

/*
 * Questo è il programma più semplice che si può immaginare scritto con CUDA C
 *
 * Cosa fa? Di pratico nulla. Chiama però il kernel "dark", dimostrando che qualcosa
 * di oscuro è accaduto sulla scheda grafica. Molte domande restano ancora in sospeso,
 * ma il modello di programmazione host-kernel dovrebbe a questo punto essere chiaro.
 *
 */

// Attenzione a questa parola chiave. Definisce un kernel, ovvero un processo che avviene
// sulla GPU
__global__ void dark(void)
{
	// Questo è un kernel vuoto. Può comunque essere invocato dal main.
}

int main(void)
{
	// Lancio il kernel "dark"
	dark<<<1,1>>>();
	printf("Benvenuto nel magico mondo delle GPU. Guarda il file 'hello_kernel.cu' per capire di cosa si tratta.\n");
	return 0;
}

