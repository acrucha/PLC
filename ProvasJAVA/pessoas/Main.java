package pessoas;

public class Main {

	public static void main(String[] args) {
		CadastroPessoas pessoas = new CadastroPessoas();
		Pessoa p = new Pessoa("Clara", "45456641144", new Address("Rua Acrucha", "483", "APT 401", "Candeias", "25551455", "Jaboatão", "PE"));
		
		System.out.println(p);
		
		pessoas.inserir(p);
		
		p.setName("Acrucha");
		pessoas.atualizar(p);

		if(pessoas.existe(p)) {
			System.out.println("Pessoa de CPF = " + p.getCpf() + " existe");
		}
		
		System.out.println(p);
		
		pessoas.remover(p); 
		pessoas.existe(p);
	}

}
