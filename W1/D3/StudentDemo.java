class Student{
	private int studentId;
	private String studentName;
	private boolean gender;
	private Subject subject;

	// SET Methods
	public void setStudentId(int id){studentId=id;}
	public void setStudentName(String name){studentName=name;}
	public void setGender(boolean g){gender=g;}
	public void setSubject(Subject s){subject=s;}

	// GET Methods
	public int getStudentId(){return studentId;}
	public String getStudentName(){return studentName;}
	public boolean getGender(){return gender;}
	public Subject getSubject(){return subject;}
}

class Subject{
	private String[] subject = new String[3];
	private float[] mark = new float[3];
 
	//SET Methods
	public void setSubject(String s1,String s2,String s3){
		subject[0] = s1;
		subject[1] = s2;
		subject[2 ]= s3;
	}
	public void setMark(float m1, float m2, float m3){
		mark[0] = m1;
		mark[1] = m2;
		mark[2] = m3;
	}

	//GET Methods
	public String[] getSubject(){
		String[] sub = new String[3];
		for(int i=0;i<3;i++)
			sub[i] = subject[i];

		return sub;
	}

	public float[] getMark(){
		float[] m = new float[3];
		for(int i=0;i<3;i++)
			m[i] = mark[i];

		return m;
	}
}

class ResultGenerator{
		public static void generateResult(Student st){

			float[] mark = (st.getSubject()).getMark();
			float total =0;

			for(int i=0;i<3;i++)
				total += mark[i];

			System.out.println("   ID: "+st.getStudentId());
			System.out.println(" Name: "+st.getStudentName());
			System.out.println("Total: "+total);
			System.out.println("  AVG: "+total/3);

		}
}


public class StudentDemo{
	

	public void storeStudentData(Student st){
		Subject sub = new Subject();
		sub.setSubject("TAMIL","ENGLISH","HINDI");
		sub.setMark(79,72,80);

		st.setStudentName("Sivanantham G");
		st.setStudentId(1345);
		st.setGender(true);
		st.setSubject(sub);
	}

	public static void main(String argv[]){
		
		Student st = new Student();

		new StudentDemo().storeStudentData(st);
		ResultGenerator.generateResult(st);

	}
}