import java.util.*;
public class map_sort{

	public static void print(ArrayList<String> ar){

		TreeMap<String, ArrayList<String>> hm = new TreeMap<>();

		for(String e : ar){
			if(hm.containsKey(e.substring(0,3))==false){
				hm.put(e.substring(0,3),new ArrayList<String>());
				hm.get(e.substring(0,3)).add(e);
			}else{
				if(hm.get(e.substring(0,3)).contains(e)==false)
					hm.get(e.substring(0,3)).add(e);
			}
		}

		for(Map.Entry<String, ArrayList<String>> entry: hm.entrySet()){
			System.out.println("KEY: "+ entry.getKey());

			Collections.sort(entry.getValue());
			for(String e : entry.getValue()){
				System.out.println("\tVALUE: "+e);
			}
		}

	}

	public static void main(String argv[]){
		Scanner sc = new Scanner(System.in);
		ArrayList<String> ar = new ArrayList<>();

		ar.add("Hello");
		ar.add("Hell");
		ar.add("Pencil");
		ar.add("Pen");
		ar.add("Apple");
		ar.add("Application");
		ar.add("Appear");
		ar.add("Original");
		ar.add("Origin");
		
		print(ar);
	}
}