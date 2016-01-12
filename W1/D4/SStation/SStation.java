import java.util.*;

class Person{
	String name, contact, address;

	public Person(String type){
		System.out.println(type);
		Scanner sc = new Scanner(System.in);
		System.out.print("Name: ");
		name = sc.nextLine();
		System.out.print("Address: ");
		address = sc.nextLine();
		System.out.print("Contact: ");
		contact = sc.next();
	}

	public void toDisplay(){
		System.out.println("Name: "+name);
		System.out.println("Address: "+address);
		System.out.println("Contact: "+contact);
	}
}

class Employee extends Person{
	String eid;

	public Employee(){
		super("Employee");
		Scanner sc = new Scanner(System.in);
		System.out.print("EID: ");
		eid = sc.next();
	}

	public void toDisplay(){
		System.out.println("EID: "+eid);
		super.toDisplay();
	}
}

class Customer extends Person{
	String cid;
	boolean isEmp;
	Vehicle vehicle;

	public Customer(){
		super("Customer");
		Scanner sc = new Scanner(System.in);
		System.out.print("CID: ");
		cid = sc.next();
		System.out.print("is he/she Employee of this station (true/false): ");
		isEmp = sc.nextBoolean();
		vehicle = new Vehicle();
	}

	public void toDisplay(){
		System.out.println("CID: "+cid);
		super.toDisplay();
		if(isEmp)
		System.out.println("He is also Employee of this station");
	}
}

class Vehicle{
	String brand, color, type;
	Double service_charge;

	public Vehicle(){
		Scanner sc = new Scanner(System.in);
		System.out.print("Vehicle Type: ");
		type = sc.next();
		System.out.print("Vehicle Brand: ");
		brand = sc.next();
		System.out.print("Vehicle Color: ");
		color = sc.next();
		System.out.print("Service Charge: ");
		service_charge = sc.nextDouble();
	}

	public void toDisplay(){
		System.out.println("Vehicle Type: "+type);
		System.out.println("Vehicle Brand: "+brand);
		System.out.println("Vehicle Color: "+color);
		System.out.println("Service Charge: "+service_charge);
	}
}

class Invoice{
	Customer customer;
	Employee employee;

	public Invoice(Customer cust, Employee emp){
		customer = cust;
		employee = emp;
	}

	public void toDisplay(){
		System.out.println("\n\nINVOICE");
		customer.toDisplay();
		System.out.println("Assigned Employee");
		employee.toDisplay();
	}
}

public class SStation{
	public static void main(String argv[]){
		int opt;
		Scanner sc = new Scanner(System.in);
		List<Invoice> inv = new ArrayList<>();
		do{
			System.out.print("Menu\n1.ADD INVOICE\n2.DISPLAY\n0.EXIT\nOption: ");
			opt = sc.nextInt();
			switch(opt){
				case 1:
					inv.add(new Invoice(new Customer(), new Employee()));
				break;
				case 2:
					for(Invoice i : inv){
						i.toDisplay();
					}
				break;
				case 0:
				break;
				default:
					System.out.println("Invalid Choice ! Try Again.");
			}
		}while(opt!=0);
	}
}

