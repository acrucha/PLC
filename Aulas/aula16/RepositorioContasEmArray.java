package aula16;

import java.util.ArrayList;
import java.util.List;

public class RepositorioContasEmArray implements RepositorioContas {
	
	private List<ContaAbstrata> contas = new ArrayList<>();

	@Override
	public void inserir(int indice, ContaAbstrata conta) {
		if(!contas.contains(conta)) {
			contas.add(indice, conta);
		}else {
			System.out.println("Conta " + conta.getNumero() + " já existe no sistema!");
		}
	}

	@Override
	public ContaAbstrata procurar(String numero) {
		for(ContaAbstrata c : contas) {
			if(c.getNumero() == numero) {
				System.out.println("Conta " + c.getNumero() + " encontrada!");
				return c;
			}
		}		
		
		System.out.println("Conta " + numero + " não encontrada!");
		
		return null;
	}

	@Override
	public void remover(String numero) {
		if(contas.removeIf(conta -> conta.getNumero() == numero)) {
			System.out.println("Conta " + numero + " removida com sucesso!");
		}else {
			System.out.println("Conta " + numero + " não existe no sistema!");
		}		
	}

	@Override
	public void atualizarSaldo(ContaAbstrata conta) {
		ContaAbstrata c = this.procurar(conta.getNumero());
		if(c != null) {
			if(c.getSaldo() != conta.getSaldo()) {
				System.out.println("Saldo foi atualizado com sucesso! Saldo foi alterado de " + c.getSaldo() + " para " + conta.getSaldo());
				c.setSaldo(conta.getSaldo());
			}
		}else {
			System.out.println("Conta " + conta.getNumero() + " não existe no sistema!");
		}
	}
	
}
