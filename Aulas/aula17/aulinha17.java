package aula17;

import java.util.ArrayList;
import java.util.List;

/*
 * PROJETOS
 * 
 * separar preocupa��es -> focar em cada parte do problema de maneira individual
 * trabalhar com a modularidade efetivamente -> cada parte tem suas caracter�sticas
 * os m�dulos do sistema s�o como camadas -> dividir para conquistar, reusabilidade, extensibilidade
 * 										  -> mudan�as em uma camada n�o afetam outras 
 * 										  -> a mesma vers�o de uma camada pode trabalhar com diferentes vers�es de outras camadas
 * 											 ex: diferentes GUI para uma mesma aplica��o
 * */

public class aulinha17 {

	public static void main(String[] args) {
		List<Produto> ps = new ArrayList<>();
		
		Produto p1 = new Produto("1", "Mequi Fritas", 5);
		Produto p2 = new Produto("2", "Mequi Duplo", 2);
		Produto p3 = new Produto("3", "Mequi Cheddar", 4);
		Produto p4 = new Produto("4", "Big Mequi", 6);
		
		ps.add(p1);
		ps.add(p2);
		ps.add(p3);
		
		RepositorioProdutosArray produtos = new RepositorioProdutosArray(ps);
		System.out.println(produtos);
		
		produtos.inserir(p4);
		System.out.println("\nApos inserir:\n" + produtos);
		
		Produto newP1 = new Produto("1", "Mequi Mega Fritas", 3);
		
		produtos.atualizar(newP1);
		System.out.println("\nApos atualizar:\n" + produtos);
		
		produtos.remover(p2.getCod());
		System.out.println("\nApos remover:\n" + produtos);
		
		Produto p = produtos.procurar(p2.getCod());
		
		p = produtos.procurar(p1.getCod());
		System.out.print(p);
	}

}
