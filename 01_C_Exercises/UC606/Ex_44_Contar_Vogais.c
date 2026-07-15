#include <stdio.h>
#include <string.h>

int main()
{

    char sent[50];
    int i, vow = 0;

    printf("Escreva a frase:\n");
    fgets(sent, 50, stdin);

    for (i = 0; sent[i] != '\n'; i++)
    {
        if (sent[i] == 'a' || sent[i] == 'e' || sent[i] == 'i' || sent[i] == 'o' || sent[i] == 'u' || sent[i] == 'A' || sent[i] == 'E' || sent[i] == 'I' || sent[i] == 'O' || sent[i] == 'U')
        {
            vow += 1;
        }
    }

    printf("A frase inserida tem %d vogais.\n", vow);

    return 0;
}

/*3. Escreva um programa que leia uma frase do utilizador e conte o número de
vogais (a, e, i, o, u, maiúsculas ou minúsculas) existentes na frase.*/