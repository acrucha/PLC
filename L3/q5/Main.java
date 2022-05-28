package q5;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String first = "2*3+4/6";
		String second = "2*3+4/6*5/3+3*7/2";
		
		ArithmeticExpr exp1 = new ArithmeticExpr(first);
		System.out.println("Entrada: " + first + "\nsolve: " + exp1.solve() + "\nshow: " + exp1.show());

		exp1 = new ArithmeticExpr(second);
		System.out.println("Entrada: " + second + "\nsolve: " + exp1.solve() + "\nshow: " + exp1.show());
	}

}
