package aula12;

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
