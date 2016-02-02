import java.nio.file.*;
import java.util.*;

public class move{

	public static void move(Path from, Path to) throws Exception{
		if(Files.isDirectory(from)){

			DirectoryStream<Path> stream = Files.newDirectoryStream(from);
    		for (Path entry: stream) {
    			move(entry,to);
       		}

		}else{ 
 
			String filename = from.getFileName().toString();
			
			int count=0;
			String newFilename = filename;
			while(Files.exists(to.resolve(newFilename))){
				int dot =  filename.lastIndexOf('.');
				newFilename = filename.substring(0,dot) + "-" + (++count) + filename.substring(dot);
			}
			Files.move(from, to.resolve(newFilename));	
		}
	}

	public static void main(String argv[]) throws Exception{
		move(Paths.get("first"),Paths.get("second"));
	}
}