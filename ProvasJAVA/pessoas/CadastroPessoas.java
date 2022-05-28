package pessoas;

import java.util.ArrayList;
import java.util.List;

public class CadastroPessoas implements RepositorioPessoas {
	
	private List<Pessoa> pessoas = new ArrayList<>();
	
	public CadastroPessoas(){
		
	}

	@Override
	public void inserir(Pessoa p) {
		if(pessoas.indexOf(p) != -1) {
			throw new RuntimeException("Não é possível cadastrar duas pessoas com o mesmo CPF");
		}
		
		pessoas.add(p);
		System.out.println("Pessoa adicionada");
	}

	@Override
	public void atualizar(Pessoa p) throws PessoaNaoEncontradaException {
		int index = -1;
		for(Pessoa pessoa : pessoas) {
			if(p.getCpf() == pessoa.getCpf()) {
				index = pessoas.indexOf(p);
				pessoas.set(index, p);
				System.out.println("Pessoa atualizada");
				break;
			}
		}
		if(index == -1) throw new PessoaNaoEncontradaException();
	}

	@Override
	public void remover(Pessoa p) throws PessoaNaoEncontradaException {
		if(pessoas.remove(p)) {
			System.out.println("Pessoa removida");
		}else {
			throw new PessoaNaoEncontradaException();
		}
	}

	@Override
	public Pessoa procurar(Pessoa p) throws PessoaNaoEncontradaException {
		
		for(Pessoa pessoa : pessoas) {
			if(pessoa == p) {
				return pessoa;
			}
		}
		
		throw new PessoaNaoEncontradaException();
	}

	@Override
	public boolean existe(Pessoa p) {

		if(pessoas.indexOf(p) == -1) {
			throw new PessoaNaoEncontradaException();
		}
		
		return true;
	}
	
	public List<Pessoa> getBd() {
		return this.pessoas;
	}
	
}
