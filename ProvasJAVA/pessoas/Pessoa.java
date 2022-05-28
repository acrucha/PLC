package pessoas;

public class Pessoa {
	private String name, cpf;
	private Address address;
	
	public Pessoa(String name, String cpf, Address address){
		this.name = name;
		this.cpf = cpf;
		this.address = address;
	}
	
	public String toString() {
		return "Nome: " + this.name + "\nCPF: " + this.cpf + this.address;
	}
	
	public Address getAddress() {
		return address;
	}
	
	public void setAddress(Address address) {
		this.address = address;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getCpf() {
		return cpf;
	}
	
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
}
