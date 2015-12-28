import java.util.*;
class Book{
	private String name;
	private Author authors[];
	private double price;
	private int qtyInStock;

	public Book(){}

	public Book(String name, Author[] authors, double price, int qtyInStock){
		this.name = name;
		this.authors = authors;
		this.price = price;
		this.qtyInStock = qtyInStock;
	}

	public Book(String name, Author author, double price, int qtyInStock){
		this.name = name;
		this.authors = new Author[1];
		this.authors[0] = author;
		this.price = price;
		this.qtyInStock = qtyInStock;
	}

	public String getName(){return name;}
	public Author[] getAuthors(){return authors;}
	public double getPrice(){return price;}
	public int getQtyInStock(){return qtyInStock;}

	public void setPrice(double price){this.price=price;}
	public void setQtyInStock(int qtyInStock){this.qtyInStock=qtyInStock;}

	public String toDisplay(){
		String res = name + " by ";

		for(Author auth : authors){
			res+=auth.getName() + " ("+auth.getGender()+") at "+auth.getEmail() + "\n";
		}
		res+="Price: "+ price + "\n";
		res+="Stock: "+ qtyInStock;

		return res;
	}

	public void printAuthors(){
		for(Author auth : authors){
			System.out.println(auth.getName() + " ("+auth.getGender()+") at "+auth.getEmail());
		}
	}

	public void addAuthor(Author auth){
		Author[] newAuth = new Author[authors.length +1];
		System.arraycopy(authors,0,newAuth,0,authors.length);
		newAuth[authors.length]=auth;
		authors = newAuth;
	}

	public static void main(String arv[]){
		int opt;
		Scanner sc = new Scanner(System.in);
		List<Book> bk = new ArrayList<>();
		do{

			System.out.print("\n\nMENU:\n1.ADD Book\n2.ADD Author\n3.Display Author\n4.Display Book\n0.EXIT\n\nYour Option: ");
			opt = sc.nextInt();
			String bname,aname,amail;
			char agen;
			Double price;
			int stock, i, bookIndex;
			switch(opt){
				case 1:
					System.out.print("BOOK NAME:");
					 bname = sc.next();
					System.out.print("Author Name: ");
					 aname = sc.next();
					System.out.print("Author Mail: ");
					 amail = sc.next();
					System.out.print("Author Gender: ");
					 agen = sc.next().charAt(0);
					System.out.print("Price: ");
					 price = sc.nextDouble();
					System.out.print("Stock: ");
					 stock = sc.nextInt();
					bk.add(new Book(bname,new Author(aname,amail,agen),price,stock));
				break;
				case 2:
					i=1;
					for(Book b : bk){
						System.out.println(i++ + ") " + b.getName());
					}
					System.out.print("Your Option: ");
					bookIndex = sc.nextInt();

					System.out.print("Author Name: ");
					 aname = sc.next();
					System.out.print("Author Mail: ");
					 amail = sc.next();
					System.out.print("Author Gender: ");
					 agen = sc.next().charAt(0);

					bk.get(bookIndex-1).addAuthor(new Author(aname,amail,agen));

				break;
				case 3:
					i=1;
					for(Book b : bk){
						System.out.println(i++ + ") " + b.getName());
					}
					System.out.print("Your Option: ");
					bookIndex = sc.nextInt();
					bk.get(bookIndex-1).printAuthors();
				break;
				case 4:
					for(Book b : bk){
						System.out.println(b.toDisplay());
					}
				break;
				case 0:
				break;
				default:
					System.out.println("\nInvaild Option, Try Again");
			}

		}while(opt!=0);
	}

}