#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int totalWeight(int *x, int s);

int main()
{
    int amount, weight, totalw, i;

    printf("\nQuantidade de produtos a inserir:");
    if (scanf("%d", &amount) != 1)
    {
        printf("\nErro, número inválido.");
        return 1;
    }

    int *ptr_entry = (int *)malloc(amount * sizeof(int));
    if (ptr_entry == NULL)
    {
        printf("\nErro ao criar o ficheiro.\n");
        return 1;
    }

    for (i = 0; i < amount; i++)
    {
        printf("\nInsira o peso do %dº produto:", i + 1);
        if (scanf("%d", ptr_entry + i) != 1)
        {
            printf("\nErro, número inválido.");
            free(ptr_entry);
            return 1;
        }
    }

    totalw = totalWeight(ptr_entry, amount);

    printf("\nPeso Total: %d", totalw);

    FILE *fp;

    fp = fopen("inventory.txt", "w");

    if (fp == NULL)
    {
        printf("\nMemória Insuficiente.\n");
        free(ptr_entry);
        return 1;
    }

    for (i = 0; i < amount; i++)
    {
        fprintf(fp, "Peso do %dº produto: %d\n", i + 1, *(ptr_entry + i));
    }

    fprintf(fp, "\nPeso Total: %d", totalw);

    printf("\nDados guardados com sucesso em \"inventory.txt\"");

    fclose(fp);
    free(ptr_entry);

    return 0;
}

int totalWeight(int *x, int s)
{
    int i, result = 0;

    for (i = 0; i < s; i++)
    {
        result += *(x + i);
    }
    return result;
}
