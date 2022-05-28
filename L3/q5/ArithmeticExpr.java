package q5;

import java.util.HashMap;
import java.util.Map;
import java.util.Stack;

public class ArithmeticExpr implements Expression {
	
	private String all; 
	private String formattedExpr;
	private double first;
	private double second;
	private char op;
	private Map<Character, Integer> priority;
	private Stack<HalfExp> stack = new Stack<HalfExp>();
	
	public ArithmeticExpr(String exp) {
		this.all = exp; 
		this.priority = new HashMap<Character, Integer>();
		priority.put('+', 1);
		priority.put('-', 2);
		priority.put('*', 3);
		priority.put('/', 4);
		this.second = -1;
		this.first = -1;
		this.formattedExpr = "";
	}

	@Override
	public double solve() {
		int secondIndex = -1;
		double ans = 0;
		
		for(int i = 0; i < this.all.length()+1; i++) {
			char operator;                                                    // operador que sera lido
			if(i == this.all.length()) {                                      // se chegou ao final => nao tem mais operador pra ler porque o ultimo caractere == digito
				operator = '!';                       
			}else {
				operator = this.all.toCharArray()[i];	                      // se ainda nao chegou ao final => leio o operador e coloco em uma variavel
			}
			if(!Character.isDigit(operator)) {                                // se o char nao for um digito => entao == um operador
				if(this.first == -1) {                                        // se o primeiro operando da expressao ainda nao foi lido
					this.first = Integer.parseInt(this.all.substring(0, i));  // transforma em int a string lida ate o indice do operador 
					secondIndex = i+1;                                        // seta a partir de onde tenho que ler o proximo operando => exatamente depois do operador
					this.op = operator;                                       // guardo o operador atual para eu poder checar a prioridade com o proximo
				}else {
					this.second = Integer.parseInt(this.all.substring(secondIndex, i));                 // caso eu ja tenha setado o primeiro operando, devo ler o primeiro
					if(operator == '!' || this.priority.get(operator) <= this.priority.get(this.op)) {  // so entra aqui se ou a string acabou ou operador atual nao tem uma prioridade maior que o anterior
						this.formattedExpr = this.formattedExpr + this.format(this.first, this.op, this.second);
						ans = this.calc(this.first, this.op, this.second);                              // faz o calculo da expressao
						while(!stack.empty()) {                                                         // calcula tudo que esta pendente ate a pilha ficar vazia 
							HalfExp e = stack.pop();
							this.formattedExpr = "(" + e.getValue() + e.getOp() + "(" + this.formattedExpr + "))";
							ans = this.calc(e.getValue(), e.getOp(), ans);
						}
						
						String restOfStr = this.all.substring(i, this.all.length()); // pego todo o resto da string pra tratar da mesma forma        
						if(restOfStr.length()==0) {                                  // se tiver vazia, retorno a resposta
							this.formattedExpr = "(" + this.formattedExpr + ")";
							return ans;
						}else {
							restOfStr = restOfStr.substring(1, restOfStr.length());  // se nao => preciso tirar o operando
						}
						
						ArithmeticExpr exp = new ArithmeticExpr(restOfStr);
						exp.setFormattedExpr(this.formattedExpr);
						exp.addToStack(new HalfExp(operator, ans));               // aqui eu guardo na pilha o operador junto com a resposta obtida pela expressao atual lida
						return exp.solve();                                       // devo continuar fazendo a mesma coisa ate o final da string, mas salvando sempre a resposta na pilha
					}
					else {
						HalfExp expr = new HalfExp(this.op, this.first);          // caso o operador atual tenha mais prioridade que o operador anterior
						this.stack.push(expr);                                    // guardo na pilha o operador anterior e o primeiro operando
						this.first = this.second;                                 // passo o segundo operando como o primeiro operando da proxima expressao
						this.op = operator;                                       // o operador anterior vira o operador atual
						secondIndex = i+1;                                        // atualizo o indice do segundo operando
					}
				}
			}
		}
		return ans;
	}
	
	private void setFormattedExpr(String formattedExpr2) {
		this.formattedExpr = formattedExpr2;
	}

	private String format(double f, char o, double s) {
		System.out.println("entrei format");
		return "(" + f + ")" + o + "(" + s + ")";
	}
	
	private double calc(double first, char op, double second) {
		if(op == '+') {
			return first + second;
		}else if(op == '-') {
			return first - second;
		}else if(op == '*') {
			return first * second;
		}else{
			return first / second;
		}
	}

	@Override
	public String show() {
		if(this.formattedExpr == "") {
			double ans = this.solve();
		}
		return this.formattedExpr;
	}

	public void addToStack(HalfExp x){
		this.stack.push(x);
	}
}
