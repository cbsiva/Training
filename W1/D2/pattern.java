import java.util.Scanner;
import java.math.*;
public class pattern{

	public static String space(int k){
		return new String(new char[k]).replace("\0", " ");
	}

	public static void main(String argv[]){
		Scanner sc = new Scanner(System.in);
		
		System.out.print("Number of Line: ");
		int k=sc.nextInt();

		BigInteger sum = new BigInteger("1");
		for(int i=1;i<=k;i++){
			System.out.println(space(k-i)+sum.pow(2));
			sum = sum.multiply(new BigInteger("10")).add(new BigInteger("1"));
		}

	}
}