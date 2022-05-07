package q3;

public class SavingAccount extends Account {
	
	private final float TAXA = (float) 0.03;
	
	public SavingAccount(String id, String agencia, float saldo, Password senha){
		super(id, agencia, saldo, senha);
	}
	
	public void renderJuros(float taxa) {
		float juros = this.getSaldo() * taxa;
		this.credit(juros);
	}
	
	public void renderJuros() {
		float juros = this.getSaldo() * this.TAXA;
		this.credit(juros);
	}
}
