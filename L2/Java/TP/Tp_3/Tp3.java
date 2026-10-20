/* Exercice 1 :
 * 	machine
 * 		cc
 * 		ca
 * 			synchrone
 * 				grand
 * 			inductive
 * 				petit			appareils ménagers / 
 *			universels			appareils ménagers / 
 * 			à aimants permanent 
 */

/* Exercice 2
 * 	Shape
 * 		Polygon
 * 			Quadrilateral
 * 				Rectangle
 * 					Square
 * 			Triangle
 * 		Line
 * 			Curve
 * 		Circleish
 * 			Circle
 */

public class Tp3 {
	public static void main(String[] args) {
		// Exercice 4 :
		// DoubleArray.main(args);
		
		// Exercice 5 :
		// Index.main(args);
	}
}

abstract class DoubleArray {
	public static void main(String[] args) {
		double[][] dArray1 = {
			{1.1, 2.2, 3.3},
			{5.5, 6.6}
		};
		double[][] dArray2 = {
			{0.1, 2.0, 6.0},
			{5.8, 1.6, 6.1},
			{5.8, 1.6, 6.1}
		};

		System.out.println("Double Array 1 : ");
		DoubleArray.display(dArray1);
		System.err.println();
		
		System.out.println("Test regular :");
		System.out.println(DoubleArray.regular(dArray1));
		System.out.println(DoubleArray.regular(dArray2));
		System.err.println();
		
		System.out.println("Calcul lineSum :");
		System.out.print("{ ");
		for(double d : DoubleArray.lineSum(dArray1)) System.out.print(d + " ");
		System.out.println("}");
		System.out.println();

		double[][] sum = DoubleArray.sum(dArray2, dArray2);
		if (sum != null) {
			System.out.println("dArray1 + dArray2 =");
			DoubleArray.display(sum);
		}
	}

	static void display(double[][] t) {
		System.out.println("{");
		for(double[] tabY : t) {			
			System.out.print("{ ");
			for(double tabX : tabY) {
				System.out.print(tabX);
				System.out.print(" ");
			}
			System.out.println("}");
		}
		System.out.println("}");
	}

	static boolean regular(double[][] t) {
		for(int i = 1 ; i < t.length ; i++) {
			if (t[i].length != t[i-1].length) return false;
		}
		return true;
	}

	static double[] lineSum(double[][] t) {
		double[] arraySum = new double[t.length];
		for(int i = 0 ; i < t.length ; i++) {
			for(int j = 0 ; j < t[i].length ; j++) {
				arraySum[i] += t[i][j];
			}
		}
		return arraySum;
	}

	static double[][] sum(double[][] t1, double[][] t2) {
		if (!DoubleArray.regular(t1) || !DoubleArray.regular(t2)) return null;
		if (t1[0].length != t2[0].length) return null;
		if (t1.length != t2.length) return null;
		double[][] resultSum = new double[t1.length][t1[0].length];
		for(int i = 0 ; i < t1.length ; i++) {
			for(int j = 0 ; j < t1[i].length ; j++) {
				resultSum[i][j] = t1[i][j] + t2[i][j];
			}
		}
		return resultSum;
	}
}

class Index {
	int nbSubscibers;
	Subscriber[] arraySubscribers;
	public static void main(String[] args) {
		Index index = new Index(3);
		Subscriber subB = new Subscriber("BBB", 456);
		Subscriber subC = new Subscriber("CCC", 789);
		Subscriber subA = new Subscriber("AAA", 123);
		Subscriber subD = new Subscriber("DDD", 1011);

		System.out.println("Ajout sub :");
		System.out.println(index.addSubscriber(subC));
		System.out.println(index.addSubscriber(subA));
		System.out.println(index.addSubscriber(subB));
		System.out.println(index.addSubscriber(subD));
		System.out.println();
		
		System.out.println("Display Index : ");
		index.display();
		System.out.println();
		
		System.out.println("getNumber :");
		System.out.println(index.getNumber("AAA"));
		System.out.println(index.getNumber("ABA"));
		System.out.println();
		
		System.out.println("getNbSubs :");
		System.out.println(index.getNbSubscibers());
		System.out.println();
		
		System.out.println("Array Sorted :");
		Subscriber[] arrayTest = index.getSortedSubscriber();
		for(Subscriber sub : arrayTest) {
			sub.display();
		}
	}

	Index(int max) {
		nbSubscibers = 0;
		arraySubscribers = new Subscriber[max];
	}

	boolean addSubscriber(Subscriber sub) {
		if (nbSubscibers == arraySubscribers.length) return false;
		arraySubscribers[nbSubscibers++]= sub;
		return true;
	}

	void display() {
		for(int i = 0 ; i < nbSubscibers ; i++) {
			arraySubscribers[i].display();
		}
	}

	int getNumber(String name) {
		for(int i = 0 ; i < arraySubscribers.length ; i++) {
			if(arraySubscribers[i] == null) return -1;
			if(arraySubscribers[i].name == name) return arraySubscribers[i].number;
		}
		return -1;
	}

	int getNbSubscibers() {
		return nbSubscibers;
	}

	Subscriber getSubscriber(int i) {
		return arraySubscribers[i];
	}

	Subscriber[] getSortedSubscriber() {
		Subscriber[] sortedSubscribers = new Subscriber[nbSubscibers];
		for (int i = 0 ; i < nbSubscibers ; i++) {
			sortedSubscribers[i] = arraySubscribers[i];
		}

		for (int i = 0 ; i < sortedSubscribers.length - 1 ; i++) {
			for (int j = 0 ; j < sortedSubscribers.length - i - 1 ; j++) {
				if (sortedSubscribers[j].name.compareTo(sortedSubscribers[j + 1].name) > 0) {
					Subscriber subscriber = sortedSubscribers[j];
					sortedSubscribers[j] = sortedSubscribers[j + 1];
					sortedSubscribers[j + 1] = subscriber;
				}
			}
		}

		return sortedSubscribers;
	}
}

class Subscriber {
	String name;
	int number;

	Subscriber(String name, int number) {
		this.name = name;
		this.number = number;
	}
	
	void display() {
		System.out.println(name + " : " + number);
	}
}