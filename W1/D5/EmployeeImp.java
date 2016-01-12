import java.util.*;

class Employee {
	private String name;
	private Double salary;
	private Integer age;

	public Employee(){};

	public Employee(String name, Double salary, Integer age){
		this.name=name;
		this.salary=salary;
		this.age = age;
	}

	public Integer getAge(){return age;}
	public String getName(){return name;}
	public Double getSalary(){return salary;}


	public String toString(){
		return name+"/"+salary+"/"+age;
	}

}

public class EmployeeImp{
	public static void main(String argv[]){

		Scanner sc = new Scanner(System.in);
		System.out.print("\n\n1)Name 2)Age 3)Salary \nSort By: ");
		int opt = sc.nextInt();
		
		List<Employee> empList = new ArrayList<Employee>();
		empList.add(new Employee("Arun",1000.0,23));
		empList.add(new Employee("Charlie",3000.0,26));
		empList.add(new Employee("Bala",1500.0,22));
		empList.add(new Employee("Zahir",2000.0,20));
		empList.add(new Employee("Atlee",4000.0,30));

		System.out.println("\nBefore\n");
		for(Employee e : empList){
			System.out.println(e);
		}

		// Using Lambda Expression
		if(opt==1)
			Collections.sort(empList, (Employee e1, Employee e2) -> e1.getName().compareTo(e2.getName()) );
		else if(opt==2)
			Collections.sort(empList, (Employee e1, Employee e2) -> e1.getAge().compareTo(e2.getAge()) );
		else
			empList.sort(Comparator.comparing(Employee::getSalary));

		System.out.println("\nAfter\n");
		for(Employee e : empList){
			System.out.println(e);
		}

	}
}