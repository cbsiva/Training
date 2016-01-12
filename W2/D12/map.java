import java.util.*;

public class map{

	public static void print(ArrayList<String> ar){

		HashMap<Integer, ArrayList<String>> hm = new HashMap<>();

		for(String e : ar){
			if(hm.containsKey(e.length())==false){
				hm.put(e.length(),new ArrayList<String>());
				hm.get(e.length()).add(e);
			}else{
				if(hm.get(e.length()).contains(e)==false)
					hm.get(e.length()).add(e);
			}
		}

		for(Map.Entry<Integer, ArrayList<String>> entry: hm.entrySet()){
			System.out.println("KEY: "+ entry.getKey());
			for(String e : entry.getValue()){
				System.out.println("\tVALUE: "+e);
			}
		}

	}

	public static void main(String argv[]){
		Scanner sc = new Scanner(System.in);
		ArrayList<String> ar = new ArrayList<>();

		ar.add("Hello");
		ar.add("Suresh");
		ar.add("Sunil");
		ar.add("Ramesh");
		ar.add("Siva");
		ar.add("Apple");
		ar.add("Cricket");
		ar.add("Cricket");
		ar.add("football");
		
		print(ar);

	}

}