package aula17;

import java.util.ArrayList;
import java.util.List;

public class RepositorioProdutosArray {
	private List<Produto> produtos = new ArrayList<>();
	
	public RepositorioProdutosArray(List<Produto> p){
		this.setProdutos(p);
	}
	
	public String toString() {
		String saida = "";
		for(Produto p : produtos) {
			saida = saida + "\n-----------------" + p;
		}
		return saida;
	}
	
	public void inserir(Produto produto) {
		produtos.add(produto);
	}
	
	public Produto procurar(String codigoProduto) {
		
		for(Produto p : produtos) {
			if(p.getCod() == codigoProduto) {
				System.out.println("\nBusca de produto:\n" + p);
				return p;
			}
		}
		
		System.out.println("\nNão encontrei um produto com código " + codigoProduto);
		return null;
	}
	
	public void remover(String codigoProduto) {
		if(produtos.removeIf(p -> p.getCod() == codigoProduto)) {
			System.out.println("Produto " + codigoProduto + " removido.");
		}else {
			System.out.println("Produto " + codigoProduto + " não encontrado.");	
		}
	}
	
	public void atualizar(Produto produto) {
		for(Produto p : produtos) {
			if(p.getCod() == produto.getCod()) {
				int index = produtos.indexOf(p);
				produtos.set(index, produto);
				System.out.println(produto);
			}
		}
	}

	public List<Produto> getProdutos() {
		return produtos;
	}

	public void setProdutos(List<Produto> produtos) {
		this.produtos = produtos;
	};
}
