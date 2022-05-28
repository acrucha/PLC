package q2;

public class Password {
	private String alfaNumerica;
	private String numerica;
	
	public Password(String alfa, String n){
		setAlfaNumerica(alfa);
		setNumerica(n);
	}
	
	public Password(){
		setAlfaNumerica("123abc");
		setNumerica("123");
	}
	
	public String toString() {
		return "\n  - Alfanumerica: " + this.getAlfaNumerica() + "\n  - Numerica: " + this.getNumerica();
	}

	public String getAlfaNumerica() {
		return alfaNumerica;
	}

	public void setAlfaNumerica(String alfanumerica) {
		if(!checkPassword("Alfanumerica", alfanumerica)) {
			throw new RuntimeException("A senha alfanumérica deve ser formada apenas por letras e números");
		}else {
			this.alfaNumerica = alfanumerica;
		}
		
	}

	public String getNumerica() {
		return numerica;
	}

	public void setNumerica(String numerica) {
		if(!checkPassword("Numerica", numerica)) {
			throw new RuntimeException("A senha numérica deve ser formada apenas por números");
		}else {
			this.numerica = numerica;
		}
		
		
	}
	
	private boolean checkPassword(String tipoSenha, String senha) {
		if(senha != "") {
			if(tipoSenha == "Numerica") {
				for(char c : senha.toCharArray()) {                       
					if(!Character.isDigit(c)) {  
						return false;                    
					}
				}
			}else if(tipoSenha == "Alfanumerica"){
				for(char c : senha.toCharArray()) {                       
					if(!Character.isLetterOrDigit(c)) {  
						return false;                    
					}
				}
			}
			return true;
		}else {
			return false;
		}
	}

}
