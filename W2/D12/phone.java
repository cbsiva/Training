import java.util.*;

public class phone{

	public static void main(String argv[]){
		PhoneBook pb = new PhoneBook();

		pb.add("Sivanantham","8489130402","Work");
		pb.add("Sivanantham","7598630402","Home");
		pb.add("Siva","9988776655","Home");
		pb.add("Sivaram","3388776655","Home");
		pb.add("Sivaguru","9933776655","Home");
		pb.add("Sunil","9988772255","Home");
		pb.add("Arun","9922776655","Home");

		pb.findByName("Siv");

		pb.findByNumber("8489130402");

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

	// This Trie hold list of names
	Trie namelist = new Trie();

	public void add(String name, String number, String tag){

		namelist.add(name);

		master.put(number, new Contact(name, number, tag));
		
		//if not found in references
		if(!references.containsKey(name))
			references.put(name, new ArrayList<String>(Arrays.asList(number)));
		else
			references.get(name).add(number);

	}

	public void findByName(String name){

		for(String s:namelist.findWords(name)){
			if(references.containsKey(s)==true)
				for(String n:references.get(s))
					findByNumber(n);
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

class TrieNode{
	public Character data;
	public Boolean isWord;
	public HashMap<Character, TrieNode> child = new HashMap<>();

	public TrieNode(){}

	public TrieNode(Character c){
		data=c;
		isWord=false;
	}

}

class Trie{

	private TrieNode root = new TrieNode();

	public void add(String s){
		TrieNode cursor = root;

		for(int i=0;i<s.length();i++){
			Character c = s.charAt(i);

			if(!cursor.child.containsKey(c)){
				cursor.child.put(c,new TrieNode(c));
			}

			cursor = cursor.child.get(c);

			if(i==s.length()-1){
				cursor.isWord = true;
			}
		}

	}

	public ArrayList<String> findWords(String s){
		TrieNode cursor = root;
		ArrayList<String> words = new ArrayList<>();

		for(Character c:s.toCharArray()){
			if(!cursor.child.containsKey(c)){
				return words;
			}else{
				cursor = cursor.child.get(c);
			}
		}

		dfs(cursor,s,words);

		return words;

	}

	private void dfs(TrieNode cursor, String word, ArrayList<String> result){
		
		if(cursor.isWord)
			result.add(word);

		for(Map.Entry<Character, TrieNode> entry: cursor.child.entrySet()){
			dfs(entry.getValue(), word+entry.getValue().data, result);
		}

	}

}