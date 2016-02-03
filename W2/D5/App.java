import java.io.*;
import java.util.*;
//CSV Header
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.apache.commons.csv.CSVPrinter;
//JSON Header
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

//Script Engine
import javax.script.ScriptEngineManager;
import javax.script.ScriptEngine;

//DATE Format
import java.text.SimpleDateFormat;


public class App{

	private JSONObject grammer;
	private JSONArray header;

	App(JSONObject gr){
		grammer = gr;
		header = (JSONArray) grammer.get("header");
	}

	
	private List<String> getHeader(){
		List<String> arr = new ArrayList<>();

		for (Object o : header) {
			JSONObject jo = (JSONObject) o;
			arr.add((String)jo.get("title"));
		}
		return arr;
	}

	private Object eval(String exp) throws Exception{
		ScriptEngineManager mgr = new ScriptEngineManager();
    	ScriptEngine engine = mgr.getEngineByName("JavaScript");
    	return engine.eval(exp);
	}


	private String generateJSON(JSONArray arr, CSVRecord rec){
		
		Map<String, Object> map = new LinkedHashMap<>();

		for(Object o:arr){
			JSONObject jo = (JSONObject) o;
			String title = (String)jo.get("title");
			String format = (String)jo.get("format");
			if(format.equals("string")){
				String source = (String)jo.get("source");
				map.put(title, rec.get(source));
			}
		}
	
		return (new JSONObject(map)).toJSONString();
	}

	private List<Object> translate(CSVRecord rec) throws Exception{
		List<Object> arr = new ArrayList<>();

		for (Object o : header) {
			JSONObject jo = (JSONObject) o;
			
			String format = (String)jo.get("format");

			if(format.equals("json")){

				JSONArray source = (JSONArray)jo.get("source");
				arr.add(generateJSON(source, rec));

			}else if(format.equals("datetime") && jo.containsKey("patternFrom") && jo.containsKey("patternTo")  ){

				String source = (String)jo.get("source");
				String patternFrom = (String)jo.get("patternFrom");
				String patternTo = (String)jo.get("patternTo");

				SimpleDateFormat sdf = new SimpleDateFormat(patternFrom);
				Date date = sdf.parse(rec.get(source));
				sdf = new SimpleDateFormat(patternTo);
				
				arr.add(sdf.format(date));

			}else{

				String source = (String)jo.get("source");
				Object value = rec.get(source);

				if(jo.containsKey("before")){
					String exp = (String)jo.get("before");
					exp = exp.replaceAll("@", value.toString());
					value = eval(exp);
				}

				arr.add(value);	
			}
				
		}
		return arr;
	}
		

	public void transform(Reader in, Writer out) throws Exception{
		Iterable<CSVRecord> records = CSVFormat.DEFAULT.withHeader().parse(in);
		CSVPrinter printer = new CSVPrinter(out, CSVFormat.DEFAULT);
		
		printer.printRecord(getHeader());

		for(CSVRecord record : records){
			printer.printRecord(translate(record));
		}

		printer.close();
	}

	public static void main(String argv[]) throws Exception{
		JSONParser parser = new JSONParser();
		JSONObject grammer = (JSONObject) parser.parse(new FileReader("config.json"));
		
		Reader in = new FileReader("sample-input.csv");
		Writer out = new FileWriter("sample-output.csv");

		App app = new App(grammer);
		app.transform(in,out);

	}
}