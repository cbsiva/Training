import java.io.*;
import java.util.*;
public class search{

	public static void search(String keyword) throws IOException{
		BufferedReader inputStream = null;
        PrintWriter outputStream = null;
      
        try {
            inputStream = new BufferedReader(new FileReader("input.txt"));
            outputStream = new PrintWriter(new FileWriter(keyword+".txt"));

            String line; int lineNumber = 1;
            while ((line = inputStream.readLine()) != null) {
                int index = line.indexOf(keyword);
                String indexes="";
                while (index >= 0) {
                    indexes+=(index+1+", ");
                    index = line.indexOf(keyword, index + 1);
                }
                if(indexes!="")
                outputStream.println(lineNumber+":"+indexes);
                lineNumber++;
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

	public static void main(String argv[]) throws IOException{
		Scanner sc = new Scanner(System.in);
        System.out.println("Search Keyword: ");
        search(sc.next());
	}
}
