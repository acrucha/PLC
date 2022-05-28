package q3;

public class Account {
	private String id;
	private String agencia;
	private float saldo;
	private Password senha;
	
	Account(String id, String agencia, float saldo, Password senha){
		setId(id);
		setAgencia(agencia);
		setSaldo(saldo);
		setSenha(senha);
	}
	
	public String toString() {
		String separa = "-------------------------------";
		String conta = separa + "\n  - ID: " + this.getId() 
						      + "\n  - Agência: " + this.getAgencia() 
						      + "\n  - Saldo: " + this.getSaldo() + "\n";
		return conta;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		if(id.length() > 10) {
			throw new RuntimeException("O id só pode ter no máximo 10 caracteres");
		}
		this.id = id;
	}

	public String getAgencia() {
		return agencia;
	}

	public void setAgencia(String agencia) {
		this.agencia = agencia;
	}

	public float getSaldo() {
		return saldo;
	}

	public void setSaldo(float saldo) {
		this.saldo = saldo;
	}

	public Password getSenha() {
		return senha;
	}

	public void setSenha(Password senha) {
		this.senha = senha;
	}
	
	public void debit(float value){
		this.setSaldo(this.getSaldo() - value);
	}
	
	public void credit(float value){
		this.setSaldo(this.getSaldo() + value);
	}
}
