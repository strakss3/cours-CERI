//import java.io.FileInputStream;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Vector;

public class Tp7 {

	@SuppressWarnings("unchecked")
	public static void main(String[] args) {

//		Exercise 1:
//		try {
//			NaturalNumber n1 = new NaturalNumber((int)Math.pow(2, 31));
//			NaturalNumber n2 = new NaturalNumber(6);
//			System.out.println(NaturalNumber.sum(n1, n2).getN());
//			System.out.println(NaturalNumber.diff(n1, n2).getN());
//			System.out.println(NaturalNumber.prod(n1, n2).getN());
//		}
//		catch (SumErr e) {
//			System.out.println(e.getMessage());
//		}
//		catch (DiffErr e) {
//			System.out.println(e.getMessage());
//		}
//		catch (ProdErr e) {
//			System.out.println(e.getMessage());
//		}
//		catch (OpErr e) {
//			System.out.println(e.getMessage());
//		}
//		catch (ConstErr e) {
//			System.out.println(e.getMessage());
//		}		
//		catch (NatErr e) {
//			System.out.println(e.getMessage());
//		}
//		catch (Exception e) {
//			System.out.println(e.getMessage());
//		}
		
//		Exercise 2:
//		String fileName = "textTP7.txt";
//		String path = "./";
//		
//		try (FileInputStream file = new FileInputStream(path + fileName)) {
//			int c;
//			int lineIndex = 1;
//			int charIndex = 0;
//			while((c = file.read()) != -1) {
//				charIndex = 0;
//				System.out.print(lineIndex + ". ");
//				while((char)c != '\n') {
//					if(charIndex > 60) {
//						System.out.println();
//						System.out.print("    ");
//						charIndex = 0;
//					}
//					System.out.print((char)c);
//					c = file.read();
//					charIndex++;
//				}
//				System.out.println();
//				lineIndex++;
//			}
//		}
//		catch (Exception e) {
//			e.printStackTrace();
//		}
		
//		Exercise 3:
		Person antoine = new Person("Antoine", 19, 0707070707);
		Person merwan = new Person("Merwan", 19, 0404040404);
		Person noah = new Person("Noah", 2, 0606060606);
		Vector<Person> vectPers = new Vector<Person>();
		vectPers.add(antoine);
		vectPers.add(merwan);
		vectPers.add(noah);
		
		String fileName = "file.txt";
		try (ObjectOutputStream s = new ObjectOutputStream(new FileOutputStream("./" + fileName))) {
			s.writeObject(vectPers);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		try (ObjectInputStream s = new ObjectInputStream(new FileInputStream(fileName))) {
			Vector<Person> v = (Vector<Person>)s.readObject();
			for(Person p : v) {
				System.out.println(p);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
