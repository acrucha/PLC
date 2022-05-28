package q4;

public class Snake extends Animals {


	public Snake(String name, Position position) {
		this.setName(name);
		this.setPosition(position);
	}

	@Override
	public String talk() {
		return "shshshsh";
	}
	
	public void print() {
		System.out.println(this.toString() + "\nTipo: Snake");
	}

}
