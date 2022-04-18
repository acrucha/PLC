package aula12;

import aula16.ContaAbstrata;

public class Conta extends ContaAbstrata {

    public Conta(String titular) {
		super(titular, "F�cil");
	}

	public void creditar(double valor) {
        setSaldo(super.getSaldo() + valor);
    }
    
    public void debitar(double valor) {
    	setSaldo(super.getSaldo() - valor);
    }
    
    public void renderJuros(){}
}
