

class Author{
	private String name, email;
	private char gender;

	public Author(){};

	public Author(String name, String email, char gender){
		this.name = name;
		this.email = email;
		this.gender = gender;
	}

	public String getName(){return name;}
	public char getGender(){return gender;}
	public String getEmail(){return email;}

	public void setEmail(String email){this.email=email;}

	public String toDisplay(){return "["+name+"]["+gender+"]at["+email+"]";}


	public static void main(String argv[]){
			Author auth = new Author("R.K. Narayan", "rknarayan@gmail.com", 'M');
			System.out.println(auth.toDisplay());
			auth.setEmail("rk@chargebee.com");
			System.out.println(auth.toDisplay());

	}
	
}
