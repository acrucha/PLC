package q4;

public abstract class Animals {
	private String name;
	private Position position;
	
	public abstract String talk();
	
	public String toString() {
		return "\nName: " + this.getName() + "\nPosition: " + this.getPosition();
	}

	public Position getPosition() {
		return position;
	}

	public void setPosition(Position pos) {
		this.position = pos;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
