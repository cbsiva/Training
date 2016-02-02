import java.util.*;
import java.io.*;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class json{
	public static void main(String argv[]) throws Exception{
		
		JSONParser parser = new JSONParser();

		JSONObject root = (JSONObject) parser.parse(new FileReader("input.json"));
		JSONObject student = (JSONObject) root.get("Student");
		JSONObject teacher = (JSONObject) root.get("Teacher");

		//Student
		HashMap<String, Long> marks = new HashMap<>();
		JSONArray arrMarks = (JSONArray) student.get("Marks"); 
		for(Object oo : arrMarks){
			JSONObject o = (JSONObject) oo;
			marks.put((String) o.get("Subject"), (Long)o.get("Mark"));
		}

		Student objStudent = new Student((String)student.get("ID"),
										(String)student.get("Name"),
										(String)student.get("Std"),
										(String)student.get("Date Of Joining"),
										marks);

		System.out.println(objStudent);

		// Teacher
		List<String> cls = new ArrayList<>();
		JSONArray arrCls = (JSONArray) teacher.get("Classes Taking Care Of");
		for(Object o : arrCls){
			cls.add((String)o);
		}

		Teacher objTeacher = new Teacher((String)teacher.get("ID"),
										(String) teacher.get("Name"),
										(String) teacher.get("Date Of Joining"),
										(Long) teacher.get("Salary"),
										cls);

		System.out.println(objTeacher);
		
	}
}

class Student{
	String id, doj, name, std;
	Map<String,Long> marks;

	public Student(String id, String name, String std, String doj, Map<String, Long> marks){
		this.id=id;
		this.name=name;
		this.std=std;
		this.doj=doj;
		this.marks = marks;
	} 

	public String toString(){
		String ret =  id+"|"+name+"|"+std+"|"+doj;

		for(Map.Entry e: marks.entrySet()){
			ret+= ("[" + e.getKey()+ ":" + e.getValue() +"]");
		}
		return ret;
	}
}

class Teacher{
	String id, name, doj;
	Long salary;
	List<String> classes;

	public Teacher(String id, String name, String doj, Long salary, List<String> classes){
		this.id = id;
		this.name = name;
		this.doj = doj;
		this.salary = salary;
		this.classes = classes;
	}

	public String toString(){
		String ret =  id+"|"+name+"|"+doj+"|"+salary;

		for(String cls: classes){
			ret+= ("[" + cls +"]");
		}
		return ret;
	}
}