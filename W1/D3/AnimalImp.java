import com.chargebee.animal;
import java.util.Scanner;

public class AnimalImp{

	public static void main(String argv[]){
		
		Scanner sc = new Scanner(System.in);

		do{

			animal ani = new animal();
			System.out.print("\nAnimal Name: ");
			ani.setName(sc.next());

			System.out.println(ani.getCount()+") Animal Name: "+ani.getName());
			System.out.println("Press 'y' to continue...");

		}while(sc.next().equals("y"));

	}

}