
public class Tp4 {

	public static void main(String[] args) {
		Circle cir = new Circle(5);
		System.out.println(cir);
		System.out.println("perimeter " + cir.perimeter());
		System.out.println();

		Quadri q = new Quadri(1,2,3,4);
		System.out.println(q);
		System.out.println("perimeter " + q.perimeter());
		System.out.println();
		
		Rectangle r = new Rectangle(3,4);
		System.out.println(r);
		System.out.println("perimeter " + r.perimeter());
		System.out.println();
		
		Square s = new Square(4);
		System.out.println(s);
		System.out.println("perimeter " + s.perimeter());
		System.out.println();
		
		Triangle t = new Triangle(3, 4, 5);
		System.out.println(t);
		System.out.println("perimeter " + t.perimeter());
		System.out.println();
	}
}