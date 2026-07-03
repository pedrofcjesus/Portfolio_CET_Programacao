public class FATURA {
    double plafond = 1000;

    void AdicionaFatura(double valorF) {
        this.plafond -= valorF;
        System.out.printf("Valor da fatura é %.2f\n", valorF);
        System.out.printf("O valor após fatura é %.2f\n", this.plafond);
    }

    void PagarTaxa() {
        double taxa = (1000 - this.plafond) * 0.15;
        this.plafond -= taxa;
    }

    void VerValorTotal() {
        System.out.printf("O plafond disponível após taxas é: %.2f", this.plafond);
    }

}
