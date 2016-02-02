import java.nio.file.*;
import java.util.*;

public class basic {

	public static void list(Path dir, TreeMap<String, int[]> result){
		try (DirectoryStream<Path> stream = Files.newDirectoryStream(dir)) {
	    	for (Path entry: stream) {

	    		if(Files.isDirectory(entry)){

	    			list(entry, result);
	         	
	         	}else if( entry.getFileName().toString().indexOf(".")>1){

	         		int dot =  entry.toString().lastIndexOf('.') + 1;
	         		String ext = entry.toString().substring(dot).toLowerCase();

	         		int[] counter = result.get(ext);

	         		if(counter==null)
	         			result.put(ext, new int[]{1});
	         		else
	         			counter[0]++;

	         	}

	       }
	   	}catch(Exception e){}
	}

	public static void main(String argv[]){

		Path dir = Paths.get("/Users/cb-sivanantham/Music");

		TreeMap<String, int[]> result = new TreeMap<>();

		list(dir,result);

		System.out.print("\n\n");
		for(Map.Entry<String, int[]> e : result.entrySet()){
			System.out.println("----------------------------------------------------");
			System.out.println("\t" + e.getValue()[0] + "\t"+ e.getKey() + " Files") ;
		}
		System.out.println("----------------------------------------------------");
		System.out.print("\n\n");
	}
}