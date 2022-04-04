// * Aula 12 - Anotações - PLC

// ! Java é tipificada => é necessário dizer os tipos das variáveis como em C/C++
// programação orientada a objetos está em todo canto => grande parte do que é manipulado em java são objetos e tudo que é definido em termos de classes
// tem que definir uma classe e uma função main!

// ? Classes e Objetos
// objetos são agrupamentos de dados e informações que representam um conceito
// classes são agrupamentos de objetos que tem as mesmas propriedades, com os mesmos métodos e atributos compartilhados (todos ou alguns)
// o objeto é uma instância de uma classe -> múltiplos objetos podem ser criados a partir de uma classe
// a classe é um conceito -> são ponteiros -> mas não teremos ponteiros explícitos em Java

// ? a palavra reservada private indica que os atributos só podem ser acessados (lidos ou modificados) pelas operações da classe onde ela foi criada
// a recomendação é sempre criar um método que altere os atributos da classe e não mudá-los diretamente usando public

import java.util.Random;
import java.util.Scanner;

public class ClassePrincipal {

    public static void printTeste() {
        System.out.println("Hello World");
        
        String str = "Clara";
        String str2 = new String("123"); // outra forma de criar string

        System.out.println(str2);
        System.out.println(str);

        int[] array = {10, 20, 30, 40};

        // testando equals
        if(str.equals(str2)){
            System.out.println(str + " e " + str2 + " são iguais.");
        }else{
            System.out.println(str + " e " + str2 + " não são iguais.");
        }

        for (var a : array) {
            System.out.println(a);
        }

        Conta c = new Conta();
    
        c.printSaldo();
        c.creditar(15.66);

        Exercicio1 e = new Exercicio1();
        
        e.retornaPrimeiroeUltimaStr();
    }

    public static void main(String args[]) {
        printTeste();        
    }

}

class Conta {
    private int numero;
    private double saldo;

    Conta(){
        Random rand = new Random();
        numero = rand.nextInt(255);
        saldo = 0;
        System.out.println("Conta "+ numero + " criada!");
    }

    public void printSaldo(){
        System.out.println("Saldo: R$ " + saldo);
    }

    public double getSaldo(){
        return saldo;
    }

    public int getNumero(){
        return numero;
    }

    public void creditar(double valor) {
        System.out.println("Creditando R$ " + valor + "...");
        saldo = saldo + valor;
        printSaldo();
    }

}

class Exercicio1 {

    private String eu = "Maria Clara Alves Acruchi";

    public void retornaPrimeiroeUltimaStr() {
        // Scanner sc1 = new Scanner(System.in); 
        
        System.out.println(eu);
        String[] novo = eu.split(" ");
        System.out.println(novo[0] + " " + novo[novo.length-1]); 
    }
}