public class TESTECLIENTE {
    public static void main(String[] args) {
        CLIENTE CL1 = new CLIENTE();
        CL1.nome = "Rafael Consentino";
        CL1.codigo = 1;

        CLIENTE CL2 = new CLIENTE();
        CL2.nome = "Jonas Hirata";
        CL2.codigo = 2;

        System.out.println(CL1.codigo + " " + CL1.nome);
        System.out.println(CL1.codigo + " " + CL1.nome);
    }

}
