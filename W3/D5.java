import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.apache.commons.csv.CSVPrinter;
import java.io.*;
import java.util.*;
import java.sql.*;

public class D5{

	// JDBC driver name and database URL
   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   static final String DB_URL = "jdbc:mysql://localhost/phone";

   //  Database credentials
   static final String USER = "root";
  
	public static void main(String argv[]) throws Exception{

		Scanner sc = new Scanner(System.in);
		Connection conn = null;
   		Statement stmt = null;

		//STEP 2: Register JDBC driver
      	Class.forName("com.mysql.jdbc.Driver");

      	//STEP 3: Open a connection
     	System.out.println("DB PASSWORD: ");
     	String PASS = sc.next();
      	conn = DriverManager.getConnection(DB_URL,USER,PASS);

      	String act, sql, name, number;

      	ResultSet rs;

		do{

			System.out.print("Action:");
			act =sc.next();

			try{

				switch(act){
					case "load":

						stmt = conn.createStatement();
						Reader in = new FileReader("input.csv");
						Iterable<CSVRecord> records = CSVFormat.DEFAULT.withHeader().parse(in);
						for (CSVRecord rec : records) {							
							 sql = "INSERT INTO contact " +
	               			"VALUES ('"+rec.get("name")+"','"+rec.get("phone")+"','"+rec.get("tag")+"')";
	               			stmt.executeUpdate(sql);
						}

					break;
					case "new":

						stmt = conn.createStatement();
						System.out.print("Name:");
						name = sc.next();
						System.out.print("Number:");
						number = sc.next();
						System.out.print("Tag:");
						String tag = sc.next();

						sql = "INSERT INTO contact " +
	               			"VALUES ('"+name+"','"+number+"','"+tag+"')";
	               		stmt.executeUpdate(sql);
						
					break;
					case "update_number":

						stmt = conn.createStatement();
						System.out.print("Old Number:");
						String oNumber = sc.next();
						System.out.print("New Number:");
						String nNumber = sc.next();

						sql = "UPDATE Table contact " +
	               			"SET  number = "+nNumber+"' WHERE number = '"+oNumber+"'";
	               		stmt.executeUpdate(sql);

					break;
					case "update_name":

						stmt = conn.createStatement();
						System.out.print("Number:");
						number = sc.next();
						System.out.print("Name:");
						name = sc.next();

						sql = "UPDATE Table contact " +
	               			"SET  name = "+name+"' WHERE number = '"+number+"'";
	               		stmt.executeUpdate(sql);

					break;

					case "search_number":

						stmt = conn.createStatement();
						System.out.print("Number: ");
						number = sc.next();
					

						sql = "SELECT * FROM contact " +
	               			"WHERE number like '"+number+"%'";
	               		
	               		rs = stmt.executeQuery(sql);

	               		while (rs.next()) {
					         System.out.println(rs.getString("name")+"|"+rs.getString("number")+"|"+rs.getString("tag"));
	      				}    
	               		
					break;

					case "search_name":

						stmt = conn.createStatement();
						System.out.print("Name: ");
						name = sc.next();
					
						sql = "SELECT * FROM contact " +
	               			"WHERE name like '"+name+"%'";
	               		
	               		rs = stmt.executeQuery(sql);

	               		while (rs.next()) {
					         System.out.println(rs.getString("name")+"|"+rs.getString("number")+"|"+rs.getString("tag"));
	      				}      
	               		
					break;

					case "display_all":

						stmt = conn.createStatement();
						sql = "SELECT * FROM contact";
	               		rs = stmt.executeQuery(sql);

	               		while (rs.next()) {
					         System.out.println(rs.getString("name")+"|"+rs.getString("number")+"|"+rs.getString("tag"));
	      				}      
	               		
					break;
				}
			}catch(Exception e){
				System.out.println("Error: "+e.toString()+"\n\n");
			}

		}while(!act.equals( "exit"));

		
	}
}