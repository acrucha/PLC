package aula17;

public class Produto {
	private String cod, desc;
	private int estoque;
	
	public Produto(String cod, String desc, int estoque) {
		this.setCod(cod);
		this.setDesc(desc);
		this.setEstoque(estoque);
	}
	
	public String toString() {
		String produtoFormatado;
		
		produtoFormatado = "\n** Informações do Produto **\nCódigo: " + this.getCod()
						   + "\nDescrição: " + this.getDesc()
						   + "\nQuantidade no Estoque: " + this.getEstoque();
		return produtoFormatado;
	}
	
	public String getCod() {
		return cod;
	}
	public void setCod(String cod) {
		this.cod = cod;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public int getEstoque() {
		return estoque;
	}
	public void setEstoque(int estoque) {
		this.estoque = estoque;
	}	
	
}
