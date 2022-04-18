package aula16;

public interface RepositorioContas {
	ContaAbstrata procurar(String numero);
	void remover(String numero);
	void atualizarSaldo(ContaAbstrata conta);
	void inserir(int indice, ContaAbstrata conta);
}