public class TESTALIGACAO {
    public static void main(String[] args) {
        
        PESSOA PrimeiraPessoa = new PESSOA() ;
        PrimeiraPessoa.nome = "Manel";

        PESSOA SegundaPessoa = new PESSOA();
        SegundaPessoa.nome = "António";

        HOMEM PrimeiroHomem = new HOMEM();
        PrimeiroHomem.nome = "Zé";
        PrimeiroHomem.nif = 256738465;

        HOMEM SegundoHomem = new HOMEM();
        SegundoHomem.nome = "Carlos";
        SegundoHomem.nif = 234526736;


            PrimeiraPessoa.MostrarNome(40,'*');
            SegundaPessoa.MostrarNome(40,'*');

            PrimeiroHomem.MostrarNome(40,'*');
            PrimeiroHomem.MostrarNif();
            SegundoHomem.MostrarNome(40,'*');
            SegundoHomem.MostrarNif();

}
    

    



}
