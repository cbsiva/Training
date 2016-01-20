import java.util.*;

public class phone{

	public static void main(String argv[]){
		PhoneBook pb = new PhoneBook();

		pb.add("Sivanantham","8489130402","Work");
		pb.add("Sivanantham","7598630402","Home");

		pb.findByNumber("8489130402");
		pb.findByName("Sivanantham");

	}
}

class Contact{
	public String name, number, tag;

	public Contact(String name, String number, String tag){
		this.name = name;
		this.number = number;
		this.tag = tag;
	}
}

class PhoneBook{

	// This map hold phone number as key 
	Map<String, Contact> master = new TreeMap<String, Contact>();

	// This map hold name as key and list of phone number as value
	Map<String, ArrayList<String>> references = new TreeMap<String, ArrayList<String>>();

	public void add(String name, String number, String tag){

		master.put(number, new Contact(name, number, tag));
		
		//if not found in references
		if(!references.containsKey(name))
			references.put(name, new ArrayList<String>(Arrays.asList(number)));
		else
			references.get(name).add(number);

	}

	public void findByName(String name){
		if(references.containsKey(name)==true){
			for(String n:references.get(name)){
				findByNumber(n);
			}
		}
	}

	public void findByNumber(String number){
		if(master.containsKey(number)==true){
			Contact c = master.get(number);
			System.out.println(c.name +"/"+ c.number +"/"+ c.tag);
		}else{
			System.out.println("Not Found");
		}
	}
			
}