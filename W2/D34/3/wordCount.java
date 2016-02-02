import java.io.*;
import java.util.*;
public class wordCount{

	public static String clean(String word){
		String ret = "";
		for(int i=0;i<word.length();i++){
			char c = word.charAt(i);
			if(c >= 'a' && c<='z' || c >= 'A' && c<='Z' || c >= '0' && c<='9')
				ret+=c;
		}
		return ret;
	}

	public static void main(String argv[]) throws IOException{
		BufferedReader inputStream = null;
        PrintWriter outputStream = null;
        TreeMap<String, Integer> map = new TreeMap<>(); 

        try {
            inputStream = new BufferedReader(new FileReader("input.txt"));
            outputStream = new PrintWriter(new FileWriter("output.txt"));

            String line;
            while ((line = inputStream.readLine()) != null) {
            	String[] words = line.split(" ");
            	for (String word: words) {
            		word = clean(word.toLowerCase());
            		if(!word.equals("")){
	            		if(map.containsKey(word))
	               			map.put(word,map.get(word)+1);
		               	else
		               		map.put(word,1);
	               	}
            	}
            }

            for(Map.Entry<String, Integer> e:map.entrySet()){
            	outputStream.println(e.getKey()+":"+e.getValue());
            }
        } finally {
            if (inputStream != null) {
                inputStream.close();
            }
            if (outputStream != null) {
                outputStream.close();
            }
        }

	}
}