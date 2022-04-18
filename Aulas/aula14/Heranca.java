package aula14;

public class Heranca {

	public static void main(String[] args) {
		ContaPoupanca c = new ContaPoupanca("Clara");
		
		c.creditar(1450.5);
		System.out.println("------Antes:");
		c.printSaldo();

		c.jurosAnuais();
		
		System.out.println("------Depois de 1 ano na poupança:");
		c.printSaldo();
		
		Banco banco = new Banco(10);
		
		banco.cadastrar(c);
		banco.creditar(c.getNumero(), 220.6);
		
		System.out.println("-------Depois de creditar:");
		c.printSaldo();
	}

}
