package q4;

public class Main {

	public static void main(String[] args) {
		
		RuntimeException insertAnimalErr = new RuntimeException("O animal não pode ser adicionado");
		RuntimeException insertRobotErr = new RuntimeException("O robot não pode ser adicionado");
		
		Zoo zoologico = new Zoo();
		
		Position lionPosition = new Position(1,2);
		Lion lion = new Lion("Mufasa", lionPosition);
		
		Position snakePosition = new Position(3,1);
		Snake snake = new Snake("Orochimaru", snakePosition);
		
		if(!zoologico.insertAnimal(lion)) {
			throw insertAnimalErr;
		}
		if(!zoologico.insertAnimal(snake)) {
			throw insertAnimalErr;
		}
		
		Position f1Position = new Position(1,1);
		Robot f1 = new Robot("12d2", f1Position);
		
		if(!zoologico.insertRobot(f1)){
			throw insertRobotErr;
		}	
		Position f2Position = new Position(1,0);
		Robot f2 = new Robot("23s", f2Position);
		
		if(!zoologico.insertRobot(f2)){
			throw insertRobotErr;
		}	
		
		System.out.println("\n---------------ZOO---------------");
		lion.print();
		snake.print();
		System.out.println(f1 + "\n" + f2);
		
		zoologico.checkNeighbor(f1.getId(), lion.getName());	
		
		System.out.println("\n----Após verificar vizinho:");
		lion.print();
		System.out.println(f1);
		
	}

}
