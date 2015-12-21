import java.util.Scanner;

public class minmax{
	public static void main(String argv[]){
		Scanner sc = new Scanner(System.in);
		
		System.out.print("Array Size: ");		
		int iSize = sc.nextInt();
		if(iSize >0){
			int[] iElement = new int[iSize];

			System.out.print("Element: ");		
			for(int i=0;i<iSize;i++)
				iElement[i] = sc.nextInt();

			int iMin = iElement[0], iMax = iElement[0];
			for(int i=1;i<iSize;i++){
				if(iMin > iElement[i])
					iMin = iElement[i];

				if(iMax < iElement[i])
					iMax = iElement[i];
			}

			System.out.println("Minimum: "+iMin);		
			System.out.println("Maximum: "+iMax);
		}		
	}
}