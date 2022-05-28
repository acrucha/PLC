package q4;

public class Zoo {
	private int[][] zoologico;
	private Animals[] animals;
	private Robot[] robots;
	private int qtdAnimals;
	private int qtdRobots;
	
	public Zoo(){
		this.setZoologico(new int[4][3]);
		this.setAnimals(new Animals[12]);
		this.setRobots(new Robot[12]);
		this.setQtdAnimals(0);
		this.setQtdRobots(0);
	}
		
	// MÉTODOS OBRIGATÓRIOS DA QUESTÃO
	
	public boolean insertAnimal(Animals animal) {
		if((this.getQtdAnimals() + this.getQtdRobots()) == 0) {
			addAnimalToArray(animal);		
		} else {
			Position position = animal.getPosition();
			String name = animal.getName();
			if(isNotAValidPosition(position) || isFull("Animals") 
			   || searchRobot(position, name, false) 
			   || searchAnimal(position, name, true)) {
				return false;
			}else {
				addAnimalToArray(animal);
			}
		}
		return true;
	}
	
	public boolean insertRobot(Robot robot) {
		
		if((this.getQtdAnimals() + this.getQtdRobots()) == 0) {
			addRobotToArray(robot);
		} else {
			Position position = robot.getPosition();
			String id = robot.getId();
			if(isNotAValidPosition(position) || isFull("Robots") 
					|| searchRobot(position, id, true) 
					|| searchAnimal(position, id, false)) {
				return false;
			}else {
				addRobotToArray(robot);
			}
		}
		
		return true;
	}	
	
	public void checkNeighbor(String id, String name) {
		int robotIndex = this.getRobotIndex(id);
		int animalIndex = this.getAnimalIndex(name);
		
		Robot robot = this.robots[robotIndex];
		Position robotPosition = robot.getPosition();
		
		Animals animal = this.animals[animalIndex];
		Position animalPosition = animal.getPosition();
		
		if(isOnTheSides(robotPosition, animalPosition) || isInFrontOrBehind(robotPosition, animalPosition)) {
			System.out.println("\nAnimal diz: " + animal.talk());
			robot.setPosition(animalPosition);
			animal.setPosition(robotPosition);
		}else {
			System.out.println("Não são vizinhos");
		}
			
	}
	
	// MÉTODOS AUXILIARES

	private boolean isInFrontOrBehind(Position robotPosition, Position animalPosition) { // o animal está na frente ou atrás do robot
		return (robotPosition.getY()+1 == animalPosition.getY() || robotPosition.getY()-1 == animalPosition.getY()) && robotPosition.getX() == animalPosition.getX();
	}
	
	private boolean isOnTheSides(Position robotPosition, Position animalPosition) {      // o animal está à esquerda ou à direita do robot
		return (robotPosition.getX()+1 == animalPosition.getX() || robotPosition.getX()-1 == animalPosition.getX()) && robotPosition.getY() == animalPosition.getY();
	}
	
	private int getAnimalIndex(String name) {

		for(int i=0; i<this.getQtdAnimals(); i++) {
			Animals a = this.animals[i];
			if(a.getName() == name) {
				return i;
			}
		}
		
		throw new RuntimeException("Esse Animal não existe no zoologico");
	}

	private int getRobotIndex(String id) {

		for(int i=0; i<this.getQtdRobots(); i++) {
			Robot r = this.robots[i];
			if(r.getId() == id) {
				return i;
			}
		}
		
		throw new RuntimeException("Esse Robot não existe no zoologico");
	}

	private boolean searchAnimal(Position p, String name, boolean sameType) {
		
		for(int i=0; i<this.getQtdAnimals(); i++) {
			String animalName = this.animals[i].getName();
			Position animalPosition = this.animals[i].getPosition();
			if(isNotAbleToInsert(p, name, sameType, animalName, animalPosition)) { // verifica se já tem um animal naquela posição 
				return true;												       // ou caso o objeto a ser inserido seja do tipo Animals, verifica se já existe um animal com aquele nome
			}
		}
	
		return false;
	}

	private boolean searchRobot(Position p, String id, boolean sameType) {
		
		for(int i=0; i<this.getQtdRobots(); i++) {
			String robotName = this.robots[i].getId();
			Position robotPosition = this.robots[i].getPosition();
			if(isNotAbleToInsert(p, id, sameType, robotName, robotPosition)) { // verifica se já tem um animal naquela posição 
				return true;												   // ou caso o objeto a ser inserido seja do tipo Robot, verifica se já existe um robo com aquele id
			}
		}
		
		return false;
	}
	
	private boolean isNotAbleToInsert(Position p, String str, boolean sameType, String other, Position otherPosition) {
		if(otherPosition.getX() == p.getX() && otherPosition.getY() == p.getY()) {
			return true;
		}else if(sameType && other == str) {
			return true;
		}
		return false;
		
	}

	private void addAnimalToArray(Animals animal) {
		Animals[] copyAnimals = this.getAnimals();
		int qtd = this.getQtdAnimals();
		
		copyAnimals[qtd] = animal;
		
		this.setAnimals(copyAnimals);
		this.setQtdAnimals(qtd+1);
	}
	
	private void addRobotToArray(Robot robot) {
		Robot[] copyRobots = this.getRobots();
		int qtd = this.getQtdRobots();
		
		copyRobots[qtd] = robot;
		
		this.setRobots(copyRobots);
		this.setQtdRobots(qtd+1);
	}
	
	public boolean isFull(String type) {
		if(type == "Animals") {
			if(this.getQtdAnimals() == 12) {
				return true;
			}
		}else if(type == "Robots") {
			if(this.getQtdRobots() == 12) {
				return true;
			}
		}
		return false;
	}
	
	private boolean isNotAValidPosition(Position position) {
		
		if(position.getX() > this.getZoologico().length 
		   || position.getX() < 0 || position.getY() < 0
		   || position.getY() > this.getZoologico()[0].length) {
			return true;
		}
		
		return false;
	}
	
	// GETTERS E SETTERS

	public Animals[] getAnimals() {
		return animals;
	}

	public void setAnimals(Animals[] animals) {
		this.animals = animals;
	}

	public Robot[] getRobots() {
		return robots;
	}

	public void setRobots(Robot[] robots) {
		this.robots = robots;
	}

	public int getQtdAnimals() {
		return qtdAnimals;
	}

	public void setQtdAnimals(int qtdAnimals) {
		this.qtdAnimals = qtdAnimals;
	}

	public int getQtdRobots() {
		return qtdRobots;
	}

	public void setQtdRobots(int qtdRobots) {
		this.qtdRobots = qtdRobots;
	}

	public int[][] getZoologico() {
		return zoologico;
	}

	public void setZoologico(int[][] zoologico) {
		this.zoologico = zoologico;
	}
}
