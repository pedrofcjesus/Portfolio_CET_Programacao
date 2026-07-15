#include <stdio.h>
#include <string.h>

int main()
{
    char sent[50], new[50], curr;
    int i, j = 0, len, pal = 1;

    printf("Insira uma palavra ou frase, contendo algumas maiúculas e espaços:\n");
    fgets(sent, 50, stdin);

    len = strlen(sent);

    for (i = 0; sent[i] != '\n'; i++)
    {
        if (sent[i] != ' ')
        {
            curr = sent[i];
            if (curr >= 'A' && curr <= 'Z')
                curr = curr + 32;

            new[j] = curr;
            j++;
        }
    }
    len = strlen(new) - 1;

    printf("Sem espaços e em minúsculas:\n%s\n", new);

    for (i = 0; new[i] != '\0'; i++)
    {
        if (new[i] != new[len])
        {
            pal = 0;
            break;
        }
        len -= 1;
    }
    if (pal == 1)
        printf("A expressão que escreveu é um palíndromo!\n");
    else
        printf("A expressão que escreveu não é um palíndromo!\n");

    return 0;
}
