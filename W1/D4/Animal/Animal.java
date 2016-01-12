import java.util.*;

interface CanFly{}

interface Herbivore{}

abstract class Mammal extends Animal{}

abstract class Bird extends Animal{}

class Bat extends Bird implements CanFly{
	@Override
	public void locomotive(){
		System.out.println("Bat Can Fly");
	}
}

class Cow extends Mammal implements Herbivore{
	@Override
	public void locomotive(){
		System.out.println("Cow Can Walk");
	}
}

class Parrot extends Bird implements CanFly{
	@Override
	public void locomotive(){
		System.out.println("Parrot Can Fly");
	}
}

class Dog extends Mammal implements Herbivore{
	@Override
	public void locomotive(){
		System.out.println("Dog Can Walk");
	}
}

public abstract class Animal{

	public abstract void locomotive();

	public static void displayAll(List<Animal> animals){
		for(Animal animal : animals){
			animal.locomotive();
		}
	}

	public static void displayBirds(List<Animal> animals){
		for(Animal animal : animals){
			if(animal instanceof CanFly)
				animal.locomotive();
		}
	}

	public static void displayHerbivores(List<Animal> animals){
		for(Animal animal : animals){
			if(animal instanceof Herbivore)
				animal.locomotive();
		}
	}

	public static void main(String argv[]){
		
		Scanner sc = new Scanner(System.in);
		List<Animal> animals = new ArrayList<>();

		int opt;
		do{
			System.out.println("\n1)Add Bat 2)Add Dog 3)Add Cow 4)Add Parrot 5)Display All 6)Display Bird 7)Display Herbivores 0)Exit");
			System.out.print("Option: ");
			opt = sc.nextInt();

			switch(opt){
				case 0:
					break;
				case 1:
					animals.add(new Bat());
					break;
				case 2:
					animals.add(new Dog());
					break;
				case 3:
					animals.add(new Cow());
					break;
				case 4:
					animals.add(new Parrot());
					break;
				case 5:
					displayAll(animals);
					break;
				case 6:
					displayBirds(animals);
					break;
				case 7:
					displayHerbivores(animals);
					break;
				default:
					System.out.println("Invalid Choice !!!");
			}


		}while(opt!=0);


	}
}