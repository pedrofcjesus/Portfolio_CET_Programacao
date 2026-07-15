#include <stdio.h>
#include <string.h>

int main()
{
    char sent[50], new[4];
    int i, len;

    do
    {
        printf("Insira uma frase:\n");
        fgets(sent, 50, stdin);
        len = strlen(sent) - 1;

    } while (len == 0);

    printf("A frase tem %d caracteres.\n", len);
    printf("A nova string com o primeiro, o do meio e o último é assim:\n");

    new[0] = sent[0];
    new[1] = sent[len / 2];
    new[2] = sent[len - 1];

    printf("%s", new);

    return 0;
}
