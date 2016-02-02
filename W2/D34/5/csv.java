import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.apache.commons.csv.CSVPrinter;
import java.io.*;
import java.util.*;

public class csv{

	public static String fetchValues(CSVRecord rec){
		String ret ="";
		for(int i=0;i<rec.size();i++){
			ret+=rec.get(i);
			if(i<rec.size()-1)
				ret+=",";
		}
		return ret;
	}

	public static void main(String argv[]) throws IOException{

		Reader in = new FileReader("input.csv");
		Writer out = new FileWriter("output.csv");	
		Set<String> helper = new HashSet<>();

		Iterable<CSVRecord> records = CSVFormat.DEFAULT.parse(in);
		CSVPrinter newRecord = new CSVPrinter(out, CSVFormat.DEFAULT);
		
		for (CSVRecord record : records) {
			if(!helper.contains(fetchValues(record))){
				newRecord.printRecord(record);
				helper.add(fetchValues(record));
			}
		}
		helper.clear();
		newRecord.close();
	}
}