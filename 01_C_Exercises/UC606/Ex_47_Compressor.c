#include <stdio.h>
#include <string.h>

int main()
{
    char senIn[50];

    printf("Bem-Vindo ao Compressor Automático.\n");
    printf("Funciona da seguinte forma:\n");
    printf("Pode inserir letras maiúsculas, tal como no seguinte exemplo:\n");
    printf("AAAABBBABCCDDDEEFFFFF\n");
    printf("O compressor irá reduzir para:\n");
    printf("A4B3A1B1C2D3E2F5\n");
    printf("Só mostra se o resultado for mais curto.\n");

    printf("Insira os seus caracteres a comprimir:\n");
    scanf("%s", senIn);

    return 0;
}