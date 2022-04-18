package aula16;

//import java.util.Scanner;

import aula12.Conta;
import aula14.Banco;

//INTERFACES
//Através do encapsulamento, os atributos e a implementação dos métodos de uma certa classe não são visíveis ao usuário da classe
//Conhecendo-se apenas a interface de uma classe, podemos utilizar seus objetos sem conhecer detalhes de implementação -> podemos ter mais de uma interface em um arquivo
//Uma interface inclui os métodos disponíveis e suas respectivas assinaturas
//Além disto, existem casos onde existe a necessidade de se ter uma classe mas não queremos implementá-la pode-se terceirizar a implementação, fornecendo como especificação a interface desejada

public class learnInterfaces {

	public static void main(String[] args) {
		
		Banco b = new Banco(10);
		
// 		Recebendo entradas do terminal
//		System.out.print("Insira seu nome: ");
//		@SuppressWarnings("resource")
//		Scanner sc = new Scanner(System.in);
//		String titular = sc.next(); -> para poder printar precisa transformar pra string => titular.toString()

		Conta c = new Conta("Clara");
		Conta c1 = new Conta("Mileto");
		
		c.creditar(200);
		c1.creditar(100);
		
		b.cadastrar(c);
		b.cadastrar(c1);
		
		b.tranfere(c.getNumero(), c1.getNumero(), 20);
		
		c.printExtrato();	
		
				
		b.printDadosConta(c.getNumero());

	}

}
