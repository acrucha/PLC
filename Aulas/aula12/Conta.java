package aula12;

import java.util.Random;

public class Conta {
	private String numero;
    private double saldo;

    public Conta(){
        Random rand = new Random();
        numero = rand.nextInt(10, 99) + "." + rand.nextInt(999) + "-" + rand.nextInt(9);
        saldo = 0;
        System.out.println("Conta "+ numero + " criada!");
    }

    public double getSaldo(){
        return this.saldo;
    }
    
    public String printSaldo() {
    	String formatado = String.format("%.2f", this.saldo);
    	return "Saldo: R$" + formatado;
    }

    public String getNumero(){
        return this.numero;
    }

    public void creditar(double valor) {
        //System.out.println("Creditando R$ " + valor + "...");
        saldo = saldo + valor;
        // printSaldo();
    }
    
    public void debitar(double valor) {
    	saldo = saldo - valor;
    }
    
    public void renderJuros(){}
}
