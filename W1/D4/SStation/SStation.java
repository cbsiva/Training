import java.util.Scanner;

class Person{
	String name, contact, address;

	public Person(){
		Scanner sc = new Scanner(System.in);
		System.out.print("Name: ");
		name = sc.nextLine();
		System.out.print("Address: ");
		address = sc.nextLine();
		System.out.print("Contact: ");
		contact = sc.next();
	}
}

class Employee extends Person{
	String eid;
	Double salary;

	public Employee(){
		Scanner sc = new Scanner(System.in);
		System.out.print("EID: ");
		eid = sc.next();
		super();
		System.out.print("Salary: ");
		salary = sc.nextDouble();
	}

}

class Customer extends Person{
	String cid;
	boolean isEmp;

	public Customer(){
		Scanner sc = new Scanner(System.in);
		System.out.print("CID: ");
		cid = sc.next();
		super();
		System.out.print("is he/she Employee of this station : ");
		isEmp = sc.nextBoolean();
	}
}


class Vehicle{
	String brand, color;
	Double service_charge;

	public Vehicle(){
		Scanner sc = new Scanner(System.in);
		System.out.print("Brand: ");
		brand = sc.next();
		System.out.print("Color: ");
		color = sc.next();
		System.out.print("Service Charge: ");
		service_charge = sc.nextDouble();
	}
}

