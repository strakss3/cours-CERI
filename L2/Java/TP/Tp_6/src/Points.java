
public class Points implements Display {
	
	public int x;
	public int y;
	
	public Points(int x, int y) {
		super();
		this.x = x;
		this.y = y;
	}

	@Override
	public void display() {
		System.out.println("(" + x + ", " + y + ")");
	}
}
