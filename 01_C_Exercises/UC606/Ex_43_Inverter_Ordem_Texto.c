#include <stdio.h>
#include <string.h>

int main()
{

    char text[50];
    int i, cont = 0;

    printf("Insira uma frase:\n");
    fgets(text, 50, stdin);

    printf("A frase inserida foi:\n%s", text);

    printf("\nA ordem inversa é:\n");

    cont = strlen(text) - 1;

    for (i = cont; i >= 0; i--)
        printf("%c", text[i]);

    return 0;
}

/*2. Um programa que inverta a ordem de uma cadeia de texto inserida.*/