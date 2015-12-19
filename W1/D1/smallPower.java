import java.util.*;

public class smallPower{
	public static void main(String argv[]){
		 
		 Scanner sc = new Scanner(System.in);
		 //Read X
		 System.out.print("X=");
		 int ix = sc.nextInt();
		 //Read Y
		 System.out.print("Y=");
		 int iy = sc.nextInt();
		 //Result
		System.out.println("Smallest Power: "+Math.floor(Math.log(iy)/Math.log(ix)));

	}
}