package pessoas;

public interface RepositorioPessoas {
	public void inserir(Pessoa p);
	public void atualizar(Pessoa p) throws PessoaNaoEncontradaException;
	public void remover(Pessoa p) throws PessoaNaoEncontradaException;
	public Pessoa procurar(Pessoa p) throws PessoaNaoEncontradaException;
	public boolean existe(Pessoa p);
}
