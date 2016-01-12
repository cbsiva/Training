import java.util.*;
public class Factorial implements Iterable<Integer>{

	private int lower, upper;

	Factorial(int lower, int upper){
		this.lower = lower;
		this.upper = upper;
	}

	public MyIterator iterator(){
		return new MyIterator();
	}

	public String toString(){
		String ret="";
		for(int e: this)
			ret+=e+", ";
		return ret;
	}

	public class MyIterator implements Iterator<Integer>{

		private int fact(int n){
			if(n==0)
				return 1;
			else
				return n* fact(n-1);
		}

		public Integer next() throws NoSuchElementException{
			if(! hasNext()) throw new NoSuchElementException();
			return fact(lower++);
		}

		public boolean hasNext(){
			return lower <= upper;
		}

		public void remove() throws UnsupportedOperationException{
			throw new UnsupportedOperationException();
		}

	}


	public static void main(String argv[]){
		Scanner sc = new Scanner(System.in);
		System.out.print("Lower Limit: ");
		int l = sc.nextInt();
		System.out.print("Upper Limit: ");
		int u = sc.nextInt();

		Factorial f = new Factorial(l,u);
		System.out.println(f);
	}
}