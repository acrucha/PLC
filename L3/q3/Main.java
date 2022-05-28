package q3;

public class Main {

	public static void main(String[] args) {
		
		Password password = new Password("ncyt453", "1358");
		
		SavingAccount contaPoupanca1 = new SavingAccount("355fewf", "Agencia 15", (float) 750, password);
		
		System.out.println("Dados da contaPoupanca1:");
		System.out.println(contaPoupanca1);
		
		System.out.println("Movimentações na contaPoupanca1:\n-------------------------------");
		contaPoupanca1.credit(200);
		System.out.println("  - Creditar 200: Saldo => "+ contaPoupanca1.getSaldo());		
		
		contaPoupanca1.debit(630);
		System.out.println("  - Debitar 630: Saldo => " + contaPoupanca1.getSaldo());	
		
		contaPoupanca1.renderJuros((float) 0.05);
		System.out.println("  - Render juros de 5%: Saldo => " + contaPoupanca1.getSaldo());
		
		contaPoupanca1.renderJuros();
		System.out.println("  - Render juros padrão (3%): Saldo => " + contaPoupanca1.getSaldo());		
		
	}

}
