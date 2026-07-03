public class CONTA {
    double saldo = 100.00;
    AGENCIA agencia;

    String Deposita(double valor) {
        if (valor > 0) {
            this.saldo += valor;
            return "O depósito foi efetuado.";
        } else {
            return "O depósito não foi efetuado.";

        }

    }

    String Levanta(double valor) {
        if (valor > this.saldo) {
            return "Saldo insuficiente.";
        } else if (valor > 0) {
            this.saldo -= valor;
            return "Levantamento efetuado";
        } else {
            return "Valor inválido.";
        }
    }

    void ImprimeExtrato() {
        System.out.println(" O seu saldo é: " + saldo);
    }

}
