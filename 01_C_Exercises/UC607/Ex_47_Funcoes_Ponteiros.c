#include <stdio.h>
#include <stdlib.h>

float avg_calc(int *ptr, int missions);

void invert_xp(int *ptr, int missions);

int main()
{

    int missions, i;
    float avg_xp;

    printf("\nNúmero de missões:");
    if (scanf("%d", &missions) != 1)
    {
        printf("\nErro. Caractere inválido.\n");
        return 1;
    }

    int *ptr_xp = (int *)malloc(missions * sizeof(int));

    if (ptr_xp == NULL)
    {
        printf("\nErro. Memória Insuficiente.\n");
        return 1;
    }

    for (i = 0; i < missions; i++)
    {
        printf("\nInsira o valor de XP para a missão nº %d:", i + 1);
        scanf("%d", ptr_xp + i);
    }

    // Valores por ordem de inserção
    printf("\nOs valores de XP inseridos foram:\n");
    for (i = 0; i < missions; i++)
        printf("%d ", *(ptr_xp + i));

    // Média de XP
    avg_xp = avg_calc(ptr_xp, missions);
    printf("\nA média de XP é %.2f\n", avg_xp);

    // Valores com ordem invertida

    invert_xp(ptr_xp, missions);

    printf("\nOs valores de XP invertidos são:\n");
    for (i = 0; i < missions; i++)
        printf("%d ", *(ptr_xp + i));

    free(ptr_xp);
    return 0;
}

float avg_calc(int *ptr, int missions)
{
    int i;
    int sum = 0;
    float avg;

    for (i = 0; i < missions; i++)
    {
        sum += *(ptr + i);
    }
    avg = (float)sum / missions;

    return avg;
}

void invert_xp(int *ptr, int missions)
{

    int *ptr_start = ptr;
    int *ptr_end = ptr + (missions - 1);
    int hold;

    while (ptr_start < ptr_end)
    {
        hold = *ptr_start;
        *ptr_start = *ptr_end;
        *ptr_end = hold;

        ptr_start++;
        ptr_end--;
    }
}

// Exercício 23 : Registo de Missões e Manipulação de Memória

// Objetivo : Criar um programa que regista os Pontos de Experiência(XP)

// ganhos numa série de missões, calcula a média de XP obtida e

// inverte fisicamente a ordem desse registo na memória RAM.

// Requisitos do Programa :

// No main : Pergunta ao utilizador quantas missões foram completadas.

// Aloca dinamicamente o espaço na memória para guardar os valores de XP.

// Preenche o registo pedindo os valores de cada missão ao utilizador.

// Cria uma função : float calcula_media(int *ptr, int tamanho);

// Deve calcular e devolver a média matemática dos pontos de XP.

// Cria uma função : void inverte_registo(int *ptr, int tamanho);

// Esta função não imprime nada.O seu único trabalho é trocar as

// posições dos valores dentro da memória.O primeiro valor troca com o último,

// o segundo troca com o penúltimo, etc.(Dica : Vais precisar de uma variável temporária para ajudar nas trocas).

// De volta ao main :

// Imprime a média calculada.

// Chama a função inverte_registo.

// Usa um ciclo para imprimir o array invertido e provar que a memória foi alterada com sucesso.

// Termina com as boas práticas habituais.

// Restrições Absolutas :

// Proibido usar parênteses retos[] em todo o código.

// Validação obrigatória do scanf e do malloc.

// return 1;

// em caso de erro.