package aula16;

public class ContaImposto extends ContaAbstrata {
	public ContaImposto(String titular) {
		super(titular, "Imposto");
	}

	private static final double CPMF = 0.001;  // quando é declarado como "final" é constante!
	
    public void creditar(double valor) {
        setSaldo(super.getSaldo() + valor);
    }
	
	public void debitar(double valor) {
		double imposto = valor * CPMF;
		double total = valor + imposto;
		
		super.setSaldo(super.getSaldo() - total);
	}

}
