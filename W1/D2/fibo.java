import java.util.Scanner;
import java.math.BigInteger;

public class fibo{
	public static void main(String argv[]){
		Scanner sc = new Scanner(System.in);


		System.out.print("N : ");
		int n = sc.nextInt();

		BigInteger f1 = new BigInteger("1");
		BigInteger f2 = new BigInteger("1");

		System.out.println("\nFibonacci Series:");
		if(n>0)
			System.out.println(f1.toString());
		
		if(n>1)
			System.out.println(f2.toString());
		
		if(n>2){
			for(int i=0;i<n-2;i++){
				BigInteger f3 = f1.add(f2);
				System.out.println(f3);
				f1=f2;
				f2=f3;
			}
		}


	}
}
