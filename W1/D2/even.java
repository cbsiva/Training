import java.util.*;

public class even{
	public static void main(String argv[]){
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("STRING: ");		
		String s = sc.next().toLowerCase();

		int sum=0;
		for(int i=0;i<s.length();i++){
			sum += ((s.charAt(i)) - ('a') + 1);
		}

		if(sum % 2 == 0)
			System.out.println("EVEN");
		else
			System.out.println("ODD");
	
	}	
}