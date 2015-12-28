import java.util.*;
import java.text.DecimalFormat;

class IncomeTax{

	private String name;
	private char gender;
	private Double taxableIncome;
	private double forMale = 0.14, forFemale = 0.10;

	public IncomeTax(String name, char gender, Double taxableIncome){
		this.name = name;
		this.gender = gender;
		this.taxableIncome = taxableIncome;
	}

	public double getTaxPercentage(){
		if(gender == 'M' || gender == 'm')
			return  forMale;
		else
			return forFemale;
	}

	public Double getTaxableIncome(){return taxableIncome;}

	public static Double calculateTax(IncomeTax tax){
		return tax.getTaxableIncome() * tax.getTaxPercentage();
	}

	public void ToDisplay(){
		DecimalFormat rupee = new DecimalFormat("\u20B9 #0.00");
		System.out.println(name + " | "+gender+" | "+rupee.format(taxableIncome)+" | "+rupee.format(calculateTax(this)));
	}

	public static void main(String argv[]){
		
		int opt;
		List<IncomeTax> emp = new ArrayList<>();
		Scanner sc = new Scanner(System.in);

		do{
			System.out.print("\n\nMENU\n1.ADD Employee\n2.Display\n0.Exit\n\nOption: ");
			opt = sc.nextInt();
			switch(opt){
				case 1:
					System.out.print("Name: ");
					String name = sc.next();
					System.out.print("Gender: ");
					char gender = sc.next().charAt(0);
					System.out.print("Income: \u20B9 ");
				    double income = sc.nextDouble();
					emp.add(new IncomeTax(name,gender,income));			
				break;
				case 2:
					for(IncomeTax tax : emp){
						tax.ToDisplay();
					}
				break;
				case 0:
				break;
				default:
				 System.out.println("Invalid Option ! Try Again");
			}

		}while(opt!=0);

	}
}