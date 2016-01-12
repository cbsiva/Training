import java.util.Scanner;
import java.text.DecimalFormat;

public class interest{
	public static void main(String argv[]){
		Scanner sc = new Scanner(System.in);
		DecimalFormat rupee = new DecimalFormat("\u20B9 #0.00");

		System.out.print("  Principle : ");
		double dPrinciple = sc.nextDouble();

		System.out.print(" Interest % : ");
		double dInterest = sc.nextDouble()/100.0;

		System.out.print("No. of Year : ");
		int iYear = sc.nextInt();
		
		double simple = (dPrinciple * dInterest * iYear);
		System.out.println("\nSimple Interest : "+rupee.format(simple));

		double compound = (dPrinciple * Math.pow(1+dInterest, iYear) - dPrinciple);
		System.out.println("Compound Interest : "+rupee.format(compound));

			
	}
}