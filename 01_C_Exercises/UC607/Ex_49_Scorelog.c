#include <stdio.h>
#include <string.h>

int main()
{

    char game[25];
    int score;

    // Pedir dados:
    printf("\nNome do jogo:");
    // fgets para ler a string, sizeof para tamanho:
    fgets(game, sizeof(game), stdin);
    // retirar o \n:
    game[strcspn(game, "\n")] = '\0';

    printf("\nScore:");
    if (scanf("%d", &score) != 1)
    {
        printf("\nErro. Valor inválido.");
        return 1;
    }

    FILE *fp;
    fp = fopen("scorelog.txt", "a");

    if (fp == NULL)
    {
        printf("\nErro ao abrir o ficheiro");
        return 1;
    }

    fprintf(fp, "Game: %s | Score: %d\n\n", game, score);

    fclose(fp);

    printf("\nDados guardados com sucesso!");

    return 0;
}
