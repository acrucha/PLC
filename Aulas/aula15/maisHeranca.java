package aula15;

import aula12.Conta;
import aula14.Banco;
import aula14.ContaPoupanca;

public class maisHeranca {
	
	public static void tentaRenderJuros(Conta c) {
		if (c instanceof ContaPoupanca) {
			c.renderJuros();
			System.out.println("Conta " + c.getNumero() + " é conta poupança! Juros aplicados.");
		}else {
			throw new RuntimeException("Conta " + c.getNumero() + " não é conta poupança!");
		}
	}

	public static void main(String[] args) {
		
		Banco bradesco = new Banco();
		
		
		Conta c = new Conta();
		ContaPoupanca c1 = new ContaPoupanca();
		ContaEspecial c2 = new ContaEspecial();
		
		bradesco.cadastrar(c);
		bradesco.cadastrar(c1);
		bradesco.cadastrar(c2);
		
		c1.creditar(50);
		c2.creditar(100);
		c2.renderBonus();
		System.out.println("Saldo de c2: " + c2.getSaldo());
		
		tentaRenderJuros(c1);
		// tentaRenderJuros(c);
		
		bradesco.tranfere(c1.getNumero(), c2.getNumero(), 10);

	}

}
