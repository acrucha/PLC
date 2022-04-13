package aula14;

import aula12.Conta;

public class Banco {
	private Conta[] contas;
	private int indice;
	
	public Banco() {
		this.indice = 0;
		this.contas = new Conta[100];
	}
	
	public void incrementaIndice() {
		this.indice = this.indice + 1;
	}
	
	public void cadastrar(Conta conta) {
		if(indice < 100) {
			contas[indice] = conta;
			this.incrementaIndice();			
		}else{
			System.out.println("Sistema lotado! N�o foi poss�vel cadastrar conta!");
		}
	}
	
	public Conta achaConta(String numeroConta) {
		for(Conta c : contas) {
			if(c.getNumero() == numeroConta) {
				System.out.println("Valor creditado com sucesso!");
				return c;
			}
		}		
		System.out.println("Conta n�o encontrada!");
		
		return null;
	}
	
	public void creditar(String numeroConta, double valor) {
		Conta conta = achaConta(numeroConta);
		
		if(conta != null) {
			conta.creditar(valor);
		}

	};
	
	public void debitar(String numeroConta, double valor) {
		Conta conta = achaConta(numeroConta);
		
		if(conta != null) {
			conta.debitar(valor);
		}
	};
	
	public double getSaldo(String numeroConta) {
		Conta conta = achaConta(numeroConta);
		
		if(conta != null) {
			return conta.getSaldo();
		}
		
		return 0;
	};
}
