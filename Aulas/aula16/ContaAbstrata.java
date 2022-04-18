package aula16;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

//Classes Abstratas
//Possibilita herança de código preservando comportamento (semântica)
//Não do método debitar, que ainda não possui comportamento
//Métodos abstratos: geralmente, existe pelo menos um são implementados nas subclasses
//Não se cria objetos (NUNCA) -> mas devem ter construtores para reuso; se necessário, métodos protected para serem acessados nas subclasses 

public class ContaAbstrata {
	private String numero, titular, tipo, agencia;
	private double saldo;
	private List<String> extrato;
    
    public ContaAbstrata(String titular, String tipo){
    	this.setTitular(titular);
    	this.setTipo(tipo);
    	
        Random rand = new Random();
        this.setNumero(rand.nextInt(1000, 9999) + "-" + rand.nextInt(9));
        this.setAgencia(rand.nextInt(1000, 9999) + "");
        
        this.setSaldo(0);
        this.setExtrato(new ArrayList<>());
        
        System.out.println("Conta "+ this.getNumero() + " criada!");
    }

	public double getSaldo(){
        return this.saldo;
    }
	
	protected void setSaldo(double saldo){
		this.saldo = saldo;
    }
	
	public String getTipo(){
        return this.tipo;
    }
	
	protected void setTipo(String tipo){
		this.tipo = tipo;
    }
    
    public String getAgencia(){
    	return this.agencia;
    }
    
    private void setAgencia(String agencia) {
		this.agencia = agencia;		
	}
    
    public String getNumero(){
        return this.numero;
    }

	public void setNumero(String numero) {
		this.numero = numero;
	}
    
    public void printSaldo() {
    	String formatado = String.format("%.2f", this.getSaldo());
    	System.out.print("Saldo: R$" + formatado);
    }

    public void creditar(double valor) {}
    
    public void debitar(double valor) {}

	public String getTitular() {
		return titular;
	}

	public void setTitular(String titular) {
		this.titular = titular;
	}
	

	public String toString() {
		String separa = "-------------------------------";
		String conta = "\n" + separa + "\nConta #" + this.getNumero() 
						+ "\nAgência: " + this.getAgencia() 
						+ "\nNome do titular: " + this.getTitular() 
						+ "\nTipo: " + this.getTipo() + "\n"
						+ separa + "\n";
		
		return conta;
	}
	

	public String getExtrato() {
		
		return extrato.toString();
	}
	
	public void printExtrato() {
		System.out.println("Extrato da Conta #" + this.getNumero() + "\n" + this.getExtrato());
	}

	public void setExtrato(List<String> extrato) {
		this.extrato = extrato;
	}
	
	public void addMovimentacao(String movimentacao) {
		this.extrato.add(movimentacao);
	}

	public void printMovimentacao(String movimentacao) {
		System.out.println(movimentacao);		
	}

}
