 
import java.util.Scanner;
class Car{
	int speed;
	double regularPrice;
	String color;
	public Scanner sc;
	
	public Car(){
		sc = new Scanner(System.in);
		System.out.print("Speed: ");
		speed = sc.nextInt();
		System.out.print("Price: ");
		regularPrice = sc.nextDouble();
		System.out.print("Color: ");
		color = sc.next();
	}

  	public double getSalePrice(){return regularPrice;}
}

class Truck extends Car{
	int weight;

	public Truck(){
		super();
		System.out.print("Weight: ");
		weight = sc.nextInt();
	}

	public double getSalePrice(){
		return super.getSalePrice() - ((weight>2000)? super.getSalePrice() * 0.1 : super.getSalePrice() * 0.2 );
	}
}

class Ford extends Car{
	int year;
	int manufactureDiscount;

	public Ford(){
		super();
		System.out.print("Year: ");
		year = sc.nextInt();
		System.out.print("Manufacture Discount: ");
		manufactureDiscount = sc.nextInt();
	}

	public double getSalePrice(){
		return super.getSalePrice() - manufactureDiscount;
	}
}

class Sedan extends Car{
	int length;

	public Sedan(){
		super();
		System.out.print("Length: ");
		length = sc.nextInt();
	}

	public double getSalePrice(){
		return super.getSalePrice() - ((length>20)? super.getSalePrice() * 0.05 : super.getSalePrice() * 0.1);
	}
}

public class MyOwnAutoShop{
	public static void main(String argv[]){
		
		System.out.println("Sedan");	
		Car s = new Sedan();
		System.out.println("Ford");
		Car f = new Ford();
		System.out.println("Car");
		Car c = new Car();

		System.out.println("Seden Sale Price: " + s.getSalePrice());
		System.out.println(" Ford Sale Price: " + f.getSalePrice());
		System.out.println("  Car Sale Price: " + c.getSalePrice());

	}
}