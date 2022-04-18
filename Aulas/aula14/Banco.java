package aula14;

import java.util.Random;

import aula16.ContaAbstrata;
import aula16.RepositorioContas;
import aula16.RepositorioContasEmArray;

public class Banco {
	// private Conta[] contas; -> ao inv�s de usar um array podemos utilizar uma interface, porque podemos usar diversos tipos de armazenamento sem precisar mudar a classe banco
	private RepositorioContas contas;
	private int indice;
	private int maxContas;
	
	public Banco(int max) {
		this.indice = 0;
		this.maxContas = max;
		this.contas = new RepositorioContasEmArray();
	}
	
	public void incrementaIndice() {
		this.indice = this.indice + 1;
	}
	
	public void cadastrar(ContaAbstrata conta) {
		if(indice < this.maxContas) {
			contas.inserir(indice, conta);
			System.out.println("Conta " + conta.getNumero() + " cadastrada com sucesso!");
			this.incrementaIndice();			
		}else{
			System.out.println("Sistema lotado! N�o foi poss�vel cadastrar conta!");
		}
	}

	
	public void creditar(String numeroConta, double valor) {
		ContaAbstrata conta = contas.procurar(numeroConta);
		
		if(conta != null) {
			conta.creditar(valor);
			
			createMovimentacao(valor, "Dep�sito", conta, conta);
		}

	}

	private void createMovimentacao(double valor, String tipo, ContaAbstrata c1, ContaAbstrata c2) {
		Random rand = new Random();
		int id = rand.hashCode();  // cria um c�digo aleat�rio para ser o ID da transa��o 
		String separa = "\n-------------------------------";
		String movimentacao = separa + "\n*** Comprovante ***" + separa 
							+ "\nID da Transa��o: " + id
							+ "\nValor: " + valor 
							+ "\nTipo: " + tipo
							+ "\n\n--Conta Creditada--" + c2 
							+ "\n--Conta Debitada--" + c1;
		
		c1.addMovimentacao(movimentacao);	
		if(tipo == "Transfer�ncia") {
			c2.addMovimentacao(movimentacao);	
		}

		c1.printMovimentacao(movimentacao);
	};
	
	public void debitar(String numeroConta, double valor) {
		ContaAbstrata conta = contas.procurar(numeroConta);
		
		if(conta != null) {
			conta.debitar(valor);
			createMovimentacao(valor, "Saque", conta, conta);
		}
	};
	
	public double getSaldo(String numeroConta) {
		ContaAbstrata conta = contas.procurar(numeroConta);
		
		if(conta != null) {
			return conta.getSaldo();
		}
		
		return 0;
	};
	
	public void tranfere(String numeroC1, String numeroC2, double valor) {
		ContaAbstrata c1 = contas.procurar(numeroC1);
		if(c1 == null) {
			throw new RuntimeException("N�o existe uma conta cadastrada com o n�mero " + numeroC1);
		}
		ContaAbstrata c2 = contas.procurar(numeroC2);
		if(c2 == null) {
			throw new RuntimeException("N�o existe uma conta cadastrada com o n�mero " + numeroC2);
		}
		if(c1.getSaldo() < valor) {
			throw new RuntimeException("Foi mal tas pobre!");
		}
		c1.debitar(valor);
		c2.creditar(valor);
		
		System.out.println("Transfer�ncia realizada com sucesso!");
		
		createMovimentacao(valor, "Transfer�ncia", c1, c2);
		
	}
	
	public void printDadosConta(String numeroConta) {
		ContaAbstrata c = contas.procurar(numeroConta);
		System.out.print(c);
		c.printSaldo();
	}
}
