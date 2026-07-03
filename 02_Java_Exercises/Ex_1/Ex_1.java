import java.util.Scanner;

public class Ex_1 {
    public static void main(String[] args) {

        // 01. Faz um programa que diga se um determinado numero é positivo ou negativo.

        /*
         * int n = 2;
         * 
         * if (n>=0) {
         * System.out.println("O número "+ n + " é positivo");
         * 
         * }else
         * {System.out.println("O número "+ n + " é negativo");
         * 
         * }
         */

        // 02. Faz um programa que mostra números de 10 a 25, fazer com ciclo For, e com
        // ciclo While

        // 02.1. Ciclo For

        /*
         * for (int i = 10 ; i < 26; i++) {
         * System.out.println (i);
         * }
         */

        // 02.2. Ciclo While

        /*
         * int i = 10;
         * while (i < 26) {
         * System.out.println(i);
         * i++;
         * }
         */

        // 03. Faz um programa que conta os números de 1 a 20, se for par diz “ x – par”
        // se não “x – impar” * ” %2 == 0” – é par

        /*
         * for (int i = 1 ; i < 21; i++) {
         * 
         * if (i%2==0)
         * System.out.println (i + " é par");
         * 
         * else
         * System.out.println (i + " é ímpar");
         * }
         */

        // 04. Faz um programa que diga se um determinado numero é positivo ou negativo,
        // com input do user

        Scanner read = new Scanner(System.in);

        int n;

        System.out.println("Insira um número: ");
        n = read.nextInt();

        if (n >= 0) {
            System.out.println("O número " + n + " é positivo");
        } else {
            System.out.println("O número " + n + " é negativo");
        }

        read.close();

    }
}
