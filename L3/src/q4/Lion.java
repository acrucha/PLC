package q4;

public class Lion extends Animals {

	public Lion(String name, Position position) {
		this.setName(name);
		this.setPosition(position);
	}
	
	@Override
	public String talk() {
		return "rooaaaaaar";
	}
	
	public void print() {
		System.out.println(this.toString() + "\nTipo: Lion");
	}

}
