#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main()
{

    struct dadosAnimal
    {
        char tipoAnim;
        char nomeAnim[20];
        int idade;
        float peso;
        char nomeDono[20];
    };

    char fich[10];
    long int t, tam;
    int opt, i, contaG = 0, contaC = 0, fileHasData = 0, dataInserted = 0, anoNasc;

    struct dadosAnimal animal[3], Anim, *ficheiro;

    FILE *ptr_f;

    strcpy(fich, "Anim.dat");

    do
    {
        do
        {

            printf("----------- Registo de Animais -----------\n");
            printf("\nEscolha a opção que pretende:\n");
            printf("*** 1- Inserir dados                  ***\n");
            printf("*** 2- Contagem de tipos de animais   ***\n");
            printf("*** 3- Calcular Idade                 ***\n");
            printf("*** 4- Gravar dados no ficheiro       ***\n");
            printf("*** 5- Ler dados do ficheiro          ***\n");
            printf("*** 6- Listar                         ***\n");
            printf("*** 0- Sair                           ***\n");

            scanf("%d", &opt);

            if (opt < 0 || opt > 6)
                printf("Opcao invalida\n");
        } while (opt < 0 || opt > 6);

        switch (opt)
        {
        case 1:

            for (i = 0; i < 3; i++)
            {
                fflush(stdin);
                do
                {
                    printf("%dº animal - Gato(G) Ou Cão(C)?\n", i + 1);
                    fflush(stdin);
                    scanf(" %c", &animal[i].tipoAnim);

                    if ((animal[i].tipoAnim != 'c') &&
                        (animal[i].tipoAnim != 'C') &&
                        (animal[i].tipoAnim != 'g') &&
                        (animal[i].tipoAnim != 'G'))
                        printf("Caractere Invalido\n");
                } while (
                    (animal[i].tipoAnim != 'c') &&
                    (animal[i].tipoAnim != 'C') &&
                    (animal[i].tipoAnim != 'g') &&
                    (animal[i].tipoAnim != 'G'));

                printf("%dº animal - Nome?\n", i + 1);
                fflush(stdin);
                scanf("%s", &animal[i].nomeAnim);

                printf("%dº animal - Ano de nascimento?\n", i + 1);
                scanf("%d", &anoNasc);
                animal[i].idade = (2026 - anoNasc);

                printf("%dº animal - Peso?\n", i + 1);
                scanf("%f", &animal[i].peso);

                printf("%dº animal - Nome do Dono?\n", i + 1);
                fflush(stdin);
                scanf("%s", &animal[i].nomeDono);
            }
            dataInserted = 1;
            break;

        case 2:

            if (dataInserted == 0)
                printf("\nAinda não há dados inseridos em memória!\n\n");
            else
            {

                for (i = 0; i < 3; i++)
                {
                    if ((animal[i].tipoAnim == 'g') || (animal[i].tipoAnim == 'G'))
                        contaG++;
                    if ((animal[i].tipoAnim == 'c') || (animal[i].tipoAnim == 'C'))
                        contaC++;
                }
                printf("\nExistem %d Gatos e %d Cães\n\n", contaG, contaC);
            }
            break;

        case 3:

            if (dataInserted == 0)
            {
                printf("\nAinda não há dados inseridos em memória!\n\n");
            }
            else
            {

                for (i = 0; i < 3; i++)
                {

                    printf("O %d animal, %s, tem %d anos!\n", i + 1, animal[i].nomeAnim, animal[i].idade);
                }
            }
            break;

        case 4:

            if (dataInserted == 0)
            {
                printf("\nAinda não há dados inseridos em memória!\n\n");
            }
            else
            {

                if ((ptr_f = fopen(fich, "ab")) == NULL)
                {
                    printf("Erro ao abrir o ficheiro\n");
                    return 0;
                }
                else
                {
                    // podia-se colocar um ciclo for e escrever o vetor 1 posição de cada vez
                    fwrite(&animal[0], sizeof(Anim), 3, ptr_f);
                    printf("Informação guardada com sucesso\n");
                    fclose(ptr_f);
                }
            }
            break;

        case 5:

            if ((ptr_f = fopen(fich, "rb")) == NULL)
            {
                printf("Erro ao abrir o ficheiro\n");
                break;
            }
            else
            {

                fseek(ptr_f, 0L, SEEK_END);
                tam = ftell(ptr_f);
                t = tam / sizeof(Anim);
                rewind(ptr_f);
                ficheiro = (struct dadosAnimal *)malloc(t * sizeof(Anim));
                fread(ficheiro, sizeof(Anim), t, ptr_f);
                printf("Informação lida com sucesso. Foram lidos %d registos\n", t);
                fclose(ptr_f);
                fileHasData = 1;
            }
            break;

        case 6:

            if (dataInserted == 0)
                printf("\nAinda não há dados inseridos em memória!\n\n");
            else
            {
                printf("\nDados em Memória:\nTipo:\t Nome:\t Idade:\t Peso:\t Dono:\n");
                for (i = 0; i < 3; i++)
                {
                    printf("%c \t", animal[i].tipoAnim);
                    printf(" %s \t", animal[i].nomeAnim);
                    printf(" %d \t", animal[i].idade);
                    printf(" %3.1f \t", animal[i].peso);
                    printf(" %s\n", animal[i].nomeDono);
                }
            }
            if (fileHasData == 0)
                printf("Não há dados lidos do ficheiro\n");
            else
            {
                printf("\nDados do ficheiro:\nTipo:\t Nome:\t Idade:\t Peso:\t Dono:\n");
                for (i = 0; i < t; i++)
                {
                    printf("%c \t", ficheiro[i].tipoAnim);
                    printf(" %s \t", ficheiro[i].nomeAnim);
                    printf(" %02d \t", ficheiro[i].idade);
                    printf(" %04.1f \t", ficheiro[i].peso);
                    printf(" %s\n", ficheiro[i].nomeDono);
                }
            }
            break;

        case 0:
            printf("\n*** Obrigado por usar este programa! ***");

            break;
        }
    } while (opt != 0);

    free(ficheiro);
    return 0;
}