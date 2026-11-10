import java.util.Vector;

public class Tp6 {

	public static void main(String[] args) {
//		Exercise 1:		
//		Points p = new Points(5, 3);
//		Vector<String> v = new Vector<String>();
//		v.add("test");
//		MixedList l = new MixedList();
//		l.add(p);
//		l.add(v);
//		l.display();
			
//		Exercise 2:
		Company c1 = new Company();
		Employee jean = new Employee("jean", 10, 30, 0.2, c1);
		Employee marie = new Employee("marie", 10, 37, 0.2, c1);
		Commercial eric = new Commercial("eric", 2000, 10000, c1);
		Commercial david = new Commercial("david", 3000, 20000, c1);
		Director anne = Director.getInstance("anne", 8000, c1);
		
		System.out.println(c1);
	}
}
