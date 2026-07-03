public class PESSOA {
    String nome;

    void MostrarNome ( int nChar, char ch) {
        for (int i=0 ; i < nChar ; i++){
            System.out.print(ch);
        }
        System.out.println("\nNome: " + nome + "\n");
    }

}
