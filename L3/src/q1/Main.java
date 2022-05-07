package q1;


public class Main {

	public static void main(String[] args) {

		String input = "cla ejfibhoijevb loj CLa fewoiboijenoofh 22664 CLA cla !!!!!";
        
        Text text = new Text(input.toString());
        
		System.out.println("Qtd de palavras do texto: " + text.getSize());
		
		System.out.println("Frequencia de cla no texto: " + text.findFreq("cla"));
		
		text.replaceWords("cla");
		
		System.out.println("O texto após trocar cla por REPLACED: " + text.getTextContent());		

	}

}
