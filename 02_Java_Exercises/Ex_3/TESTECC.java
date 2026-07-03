public class TESTECC {
    public static void main(String[] args) {
        // CARTAODECREDITO CC1 = new CARTAODECREDITO();
        // CLIENTE C1 = new CLIENTE();
        FATURA F1 = new FATURA();
        F1.AdicionaFatura(100.00);
        F1.PagarTaxa();
        F1.VerValorTotal();

        /*
         * CC1.numero = 3124;
         * CC1.validade = "20-07-2026";
         * CC1.cliente = C1;
         * CC1.cliente.nome = "Manel";
         * 
         * CARTAODECREDITO CC2 = new CARTAODECREDITO();
         * CLIENTE C2 = new CLIENTE();
         * 
         * CC2.numero = 3125;
         * CC2.validade = "30-08-2027";
         * CC2.cliente = C2;
         * CC2.cliente.nome = "Antonio";
         */

        // System.out.println(CC1.numero + " " + CC1.validade + " " + CC1.cliente.nome);
        // System.out.println(CC2.numero + " " + CC2.validade + " " + CC2.cliente.nome);

    }

}
