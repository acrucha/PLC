package q1;

public class Text {
	private String textContent;
	
	public Text(String textContent){
		this.setTextContent(textContent);
	}

	public String getTextContent() {
		return textContent;
	}

	public void setTextContent(String textContent) {
		this.textContent = textContent;
	}

	public int getSize() {
		int size = 0;
				
		String[] textContent = this.getTextContent().split(" "); // transformando em um array de strings
		
		for(String str : textContent) {
			if(isWord(str)){               // se a string for uma palavra válida, a quantidade de palavras é atualizada 
				size++;
			}
		}	
		
		return size;
	}

	private boolean isWord(String word) {
		if(word != "") {
			for(char c : word.toCharArray()) {                       
				if(!Character.isLetterOrDigit(c)) {  // caso o caractere da string não seja alfanumérico, não é uma palavra válida
					return false;                    // exemplo: clara -> é palavra / 3324 -> é palavra / !@#cjeclara -> não é palavra
				}
			}
			return true;
		}else {
			return false;
		}
	}
	
	public int findFreq(String substr){
		int freq = 0;
		String textContent = this.getTextContent();

		int end = textContent.length() - substr.length() + 1;  // loop vai até onde é possível caber a substring
		
		for(int i=0; i < end; i++) {
			String str = textContent.substring(i, i + substr.length());  // testar se a próxima substring é igual à substr 
			if(isEqual(str, substr)) {              // verifica igualdade sem case sensitive, ignorando maiúsculas e minúsculas
				freq++;
			}
		}
		
		return freq;
	}
	
	private String replace(String newText, String str, int i) {
		String s1 = newText.substring(0, i);
		String s2 = newText.substring(i+str.length(), newText.length());
		return s1 + "REPLACED" + s2;
	}
	
	public void replaceWords(String str) {
		String newText = textContent;
		int end = newText.length() - str.length();
		
		for(int i=0; i < end; i++) {
			String substr = newText.substring(i, i + str.length());  // testar se a próxima substring é igual à substr 
			if(isEqual(str, substr)) {                               // verifica igualdade sem case sensitive, ignorando maiúsculas e minúsculas
				newText = this.replace(newText, str, i);
				end = newText.length() - str.length();
			}
		}
		this.setTextContent(newText);
	}

	private boolean isEqual(String str, String substr) {
		str = str.toLowerCase();
		substr = substr.toLowerCase();
		
		return str.equals(substr);
	}


}
