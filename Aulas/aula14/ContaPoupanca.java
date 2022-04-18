package aula14;
import aula12.Conta;

public class ContaPoupanca extends Conta {
	public ContaPoupanca(String titular) {
		super(titular);
		super.setTipo("Poupança");
	}

	private double taxa = 0.02;
	
	public void jurosAnuais() {
		for(int i = 0; i < 12; i++) {
			this.renderJuros();
		}
	}
	
	public void renderJuros() {
		double juros = this.getSaldo() * this.taxa;
		this.creditar(juros);
	}
}