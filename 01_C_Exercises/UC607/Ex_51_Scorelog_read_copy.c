#include <stdio.h>
#include <string.h>

int main()
{

    char line[100];

    FILE *fp;
    fp = fopen("scorelog.txt", "r");
    if (fp == NULL)
    {
        printf("\nErro ao abrir o ficheiro.\n");
        return 1;
    }

    FILE *fpc;
    fpc = fopen("copy.txt", "w");
    if (fpc == NULL)
    {
        printf("\nErro ao abrir o ficheiro.\n");
        fclose(fp);
        return 1;
    }

    while (fgets(line, sizeof(line), fp) != NULL)
    {
        if (line[0] != '\n' && line[0] != '\0')
        {
            fprintf(fpc, "%s", line);
        }
    }

    printf("\nDados copiados com sucesso!\n");

    fclose(fp);
    fclose(fpc);

    return 0;
}

// Objetivo: Criar um programa que lê o teu ficheiro scorelog.txt e

// cria um novo ficheiro chamado copia.txt, mas apenas com as linhas que contêm texto, ignorando linhas em branco se existirem.

// O que o programa deve fazer:

// Abre o scorelog.txt em modo de leitura ("r").

// Abre um ficheiro novo chamado copia.txt em modo de escrita ("w").

// Faz a validação de segurança para ambos os ponteiros (FILE *fp_leitura e FILE *fp_escrita).

// Se algum for NULL, fecha o que estiver aberto e aborta.

// Usa o ciclo while com fgets para ler do primeiro ficheiro.

// Dentro do ciclo, antes de escrever, faz uma pequena validação:

// se a linha lida não estiver vazia (ou seja, se o primeiro caractere da linha não for um \n ou um \0),

// escreve essa linha no ficheiro de cópia usando fprintf.

// Fecha os dois ficheiros no final.