abstract class Mobile{
	
	String name;
	int remainingCharge;

	public Mobile(String name){
		this.name = name;
	}

	public abstract void remainingCharge();

	public String toString(){
		return ("Mobile Name: "+name+"\nRemaining Charge: "+remainingCharge);
	}
}
public class MobileImp{

	public static void main(String argv[]){
		
		Mobile karbonn = new Mobile("Karbonn"){
							public void remainingCharge(){
								remainingCharge = 10;
							}
						};
						
		karbonn.remainingCharge();
		System.out.println(karbonn);

		Mobile apple = new Mobile("Apple"){
							public void remainingCharge(){
								remainingCharge = 20;
							}
						};
		apple.remainingCharge();
		System.out.println(apple);

		Mobile sony = new Mobile("Sony"){
							public void remainingCharge(){
								remainingCharge = 40;
							}
						};
		sony.remainingCharge();
		System.out.println(sony);

	}
}