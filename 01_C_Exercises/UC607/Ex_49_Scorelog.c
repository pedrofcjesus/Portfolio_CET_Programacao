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

// Objetivo : Criar um gerador de log de pontuações de jogos.

// O que o programa deve fazer :

// Pede ao utilizador o nome do jogo(usa fgets e limpa o \n com a técnica do strcspn).

// Pede a pontuação máxima atingida(um número inteiro, validado com o if do scanf).

// Abre um ficheiro chamado historico.txt em modo Append.

// Valida se o ficheiro abriu corretamente.

// Escreve a informação numa linha compacta usando fprintf. Exemplo : Jogo : Tetris | Score : 1500

// (lembra - te de meter o \n no final do fprintf para que o próximo registo mude de linha).

// Fecha o ficheiro e avisa o utilizador.