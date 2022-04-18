package aula16;

import aula12.Conta;

public class MainClass {

	public static void main(String[] args) {
		
		Conta c = new Conta("Clara");
		ContaImposto c1 = new ContaImposto("Clara");
		
		c1.creditar(500);
		c1.debitar(200);
		c1.printSaldo();
		
		c.creditar(1200);
		
		c.printSaldo();

	}

}
