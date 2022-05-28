package pessoas;

public class PessoaNaoEncontradaException extends RuntimeException {

	private static final long serialVersionUID = 8393378859584262704L;

	public PessoaNaoEncontradaException(){
		super("Pessoa não encontrada");
	}
}
