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
