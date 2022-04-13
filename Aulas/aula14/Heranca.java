package aula14;

public class Heranca {

	public static void main(String[] args) {
		ContaPoupanca c = new ContaPoupanca();
		
		c.creditar(1450.5);
		System.out.println("Saldo Antes: " + c.printSaldo());

		c.jurosAnuais();
		
		System.out.println("Saldo Depois de 1 ano: " + c.printSaldo());
		
		Banco banco = new Banco();
		
		banco.cadastrar(c);
		banco.creditar(c.getNumero(), 220.6);
		
		System.out.println("Saldo Depois de creditar " + c.printSaldo());
	}

}
