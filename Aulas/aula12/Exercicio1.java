package aula12;

public class Exercicio1 {
    private String eu = "Maria Clara Alves Acruchi";

    public void retornaPrimeiroeUltimaStr() {
        // Scanner sc1 = new Scanner(System.in); 
        
        System.out.println(eu);
        String[] novo = eu.split(" ");
        System.out.println(novo[0] + " " + novo[novo.length-1]); 
    }
}
