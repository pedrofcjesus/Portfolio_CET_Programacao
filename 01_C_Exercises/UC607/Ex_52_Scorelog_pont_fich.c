#include <stdio.h>
#include <string.h>

int main()
{

    char game[25];
    char line[100];
    int count = 0;

    printf("\nIntroduza o nome do jogo:");
    fgets(game, sizeof(game), stdin);
    game[strcspn(game, "\n")] = '\0';

    FILE *fps;
    fps = fopen("scorelog.txt", "r");
    if (fps == NULL)
    {
        printf("\nErro ao abrir o ficheiro.\n");
        return 1;
    }

    FILE *fpsearch;
    fpsearch = fopen("search.txt", "w");
    if (fpsearch == NULL)
    {
        printf("\nErro ao abrir o ficheiro.\n");
        fclose(fps);
        return 1;
    }

    while (fgets(line, sizeof(line), fps) != NULL)
    {
        if (strstr(line, game) != NULL)
        {
            fprintf(fpsearch, "%s", line);
            count++;
        }
    }

    printf("\nForam encontrados %d registos e guardados em \"search.txt\".", count);

    fclose(fps);
    fclose(fpsearch);

    return 0;
}
