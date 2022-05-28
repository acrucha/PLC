package q4;

public class Robot {
	private String id;
	private Position position;
	
	public Robot(String id, Position position) {
		this.setId(id);
		this.setPosition(position);
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		if(id.length() > 5) {
			throw new RuntimeException("O id do Robot só pode ter no máximo 5 caracteres.");
		}
		this.id = id;
	}

	public Position getPosition() {
		return position;
	}

	public void setPosition(Position pos) {
		this.position = pos;
	}
	
	public String toString() {
		return "\nID: " + this.getId() 
				+ "\nPosition: " + this.getPosition() 
				+ "\nTipo: Robot";
	}

}
