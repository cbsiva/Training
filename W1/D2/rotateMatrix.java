import java.util.*;

public class rotateMatrix{
	public static void main(String argv[]){
		
		Scanner sc = new Scanner(System.in);

		//Read Dimension
		System.out.print("Dimension: ");
		int iD = sc.nextInt();

		//Declare & Initialize Array
		int[][] arr = new int[iD][iD];
		int c = 1;
		for(int i=0;i<iD;i++){
			for(int j=0;j<iD;j++){
				arr[i][j] = c++;
			}
		}

		//Initial
		System.out.println("Initial");
		for(int i=0;i<iD;i++){
			for(int j=0;j<iD;j++){
				System.out.print(arr[i][j]+"\t");
			}
			System.out.println();
		}

		//Transpose
		for(int i=0;i<iD;i++){
			for(int j=i+1;j<iD;j++){
				int t = arr[i][j];
				arr[i][j] = arr[j][i];
				arr[j][i] = t;	
			}
		}

		//Read Direction
		System.out.print("Rotate Direction (left/right): ");

		String sDirection = sc.next();

		if(sDirection.equals("left")){
			
			// Column Reverse
			for(int i=0;i<iD;i++){
				for(int j=0;j<iD/2;j++){
					int t = arr[j][i];
					arr[j][i] = arr[iD - j-1][i];
					arr[iD - j -1][i] = t;
				}
			}

		}else {

			// Row Reverse
			for(int i=0;i<iD;i++){
				for(int j=0;j<iD/2;j++){
					int t = arr[i][j];
					arr[i][j] = arr[i][iD - j -1];
					arr[i][iD - j -1] = t;
				}
			}

		}

		//Result
		System.out.println("Result");
		for(int i=0;i<iD;i++){
			for(int j=0;j<iD;j++){
				System.out.print(arr[i][j]+"\t");
			}
			System.out.println();
		}


	}
}