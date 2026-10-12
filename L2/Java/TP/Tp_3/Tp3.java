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
		double[][] db = {{1.1, 2.2, 3.3}, {5.5, 6.6}};
		DoubleArray.display(db);
	}
}

abstract class DoubleArray {
	static void display(double t[][]) {
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
}
