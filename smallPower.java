import java.util.*;

public class smallPower{
	public static void main(String argv[]){
		 
		 Scanner sc = new Scanner(System.in);
		 System.out.print("X=");
		 int ix = sc.nextInt();
		 System.out.print("Y=");
		 int iy = sc.nextInt();

		System.out.println("Smallest Power: "+Math.floor(Math.log(iy)/Math.log(ix)));

	}
}