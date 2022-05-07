package q2;

public class Main {

	public static void main(String[] args) {
		
		Password passwordConta1 = new Password("87nek1", "3235");
		Password passwordConta2 = new Password();
		
		Account conta1 = new Account("123adf3", "Agencia 1", (float) 124.3, passwordConta1);
		Account conta2 = new Account("0837hjk", "Agencia 2", (float) 10.9, passwordConta2);
		
		System.out.println("--------- Senhas atuais:\n");
		printSenhas(conta1, conta2);
		
		passwordConta1.setAlfaNumerica("vj9083j");
		passwordConta2.setNumerica("213457");
		
		conta1.setSenha(passwordConta1);
		conta2.setSenha(passwordConta2);
		
		System.out.println("--------- Após modificação:\n");
		printSenhas(conta1, conta2);	
		printDados(conta1, "conta1");
		
		System.out.println("--------- Atuais ID e Agencia da conta2:\n");
		printDados(conta2, "conta2");
		
		conta2.setId("215fefj");
		conta2.setAgencia("Agencia 4");
		
		System.out.println("--------- Após modificação do ID e Agencia da conta2:\n");
		printDados(conta2, "conta2");
		
	}

	private static void printDados(Account conta1, String conta) {
		System.out.println("ID da " + conta + ": " + conta1.getId());
		System.out.println("Agencia da " + conta + ": " + conta1.getAgencia() + "\n");
	}

	private static void printSenhas(Account conta1, Account conta2) {
		System.out.println("Senhas da conta1: " + conta1.getSenha() + "\n");
		System.out.println("Senhas da conta2: " + conta2.getSenha() + "\n");
	}

}
