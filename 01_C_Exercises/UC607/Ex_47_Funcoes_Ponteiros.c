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