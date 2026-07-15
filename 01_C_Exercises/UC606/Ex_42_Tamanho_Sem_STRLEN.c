#include <stdio.h>
#include <string.h>

int main()
{
    char text[50];
    int cont = 0, i;

    printf("Insira o texto:");
    fgets(text, 50, stdin);

    for (i = 0; text[i] != '\0'; i++)
    {
        if (text[i] != '\0')
            cont++;
    }

    printf("O texto que inseriu foi:\n%s", text);
    printf("\nTem %d caracteres", cont);
    return 0;
}

/*1. Elabore um programa que permita saber o tamanho de uma cadeia de texto
introduzida sem usar a função strlen.*/