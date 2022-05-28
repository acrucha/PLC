package pessoas;

public class Address {
	private String rua, numero, compl, bairro, cep, cidade, estado;
	
	public Address(String rua, String numero, String compl, String bairro, String cep, String cidade, String estado){
		this.rua = rua;
		this.numero = numero;
		this.compl = compl;
		this.bairro = bairro;
		this.cep = cep;
		this.cidade = cidade;
		this.estado = estado;
	}
	
	public String toString() {
		return "\nEndereço: " + this.rua + ", " + this.numero + ", " + this.compl + ", " + this.bairro + ", " + this.cidade + ", " + this.estado + " - CEP: " + this.cep;
	}

	public String getRua() {
		return rua;
	}

	public String getNumero() {
		return numero;
	}

	public String getCompl() {
		return compl;
	}


	public String getBairro() {
		return bairro;
	}

	public String getCidade() {
		return cidade;
	}


	public String getCep() {
		return cep;
	}


	public String getEstado() {
		return estado;
	}

}
