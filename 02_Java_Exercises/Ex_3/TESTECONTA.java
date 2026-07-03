public class TESTECONTA {
    public static void main(String[] args) {

        CONTA Conta1 = new CONTA();
        AGENCIA A1 = new AGENCIA();

        Conta1.agencia = A1;
        Conta1.agencia.numero = 1;

        System.out.println(Conta1.Deposita(2900));
        System.out.println(Conta1.Levanta(1000));
        Conta1.ImprimeExtrato();

    }

}
