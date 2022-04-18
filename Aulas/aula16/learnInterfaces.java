package aula16;

//import java.util.Scanner;

import aula12.Conta;
import aula14.Banco;

//INTERFACES
//Atrav�s do encapsulamento, os atributos e a implementa��o dos m�todos de uma certa classe n�o s�o vis�veis ao usu�rio da classe
//Conhecendo-se apenas a interface de uma classe, podemos utilizar seus objetos sem conhecer detalhes de implementa��o -> podemos ter mais de uma interface em um arquivo
//Uma interface inclui os m�todos dispon�veis e suas respectivas assinaturas
//Al�m disto, existem casos onde existe a necessidade de se ter uma classe mas n�o queremos implement�-la pode-se terceirizar a implementa��o, fornecendo como especifica��o a interface desejada

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
