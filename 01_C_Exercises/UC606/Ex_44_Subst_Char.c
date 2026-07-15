#include <stdio.h>
#include <string.h>

int main()
{
    char sent[50], charOut, charIn;
    int i;

    printf("Escreva a frase:\n");
    fgets(sent, 50, stdin);

    printf("Insira o caractere que sai:\n");
    scanf(" %c", &charOut);

    printf("Insira o caractere que entra:\n");
    scanf(" %c", &charIn);

    for (i = 0; sent[i] != '\n'; i++)
    {
        if (sent[i] == charOut)
            sent[i] = charIn;
    }

    printf("%s", sent);

    return 0;
}

/*4. Um programa que substitua um caractere por outro numa cadeia de texto.*/