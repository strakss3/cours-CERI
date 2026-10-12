public class Tp2{
	public static void main(String[] args) {
	
		Vector vect1 = new Vector(3,4,1);
		Vector vect2 = new Vector(4,2,0);
		
		PairVect pair = new PairVect(vect1, vect2);
		pair.getFirstVector().display();
		
	}
}

class Vector {
	private int xCoordonate;
	private int yCoordonate;
	private int zCoordonate;
	private static int NUMBER_OF_VECTORS = 0;
	
	public Vector() {
		xCoordonate = 0;
		yCoordonate = 0;
		zCoordonate = 0;
		NUMBER_OF_VECTORS++;
	}
	
	public Vector(int x, int y, int z) {
		xCoordonate = x;
		yCoordonate = y;
		zCoordonate = z;
		NUMBER_OF_VECTORS++;
	}
	
	public int getX() {
		return xCoordonate;
	}
	
	public int getY() {
		return yCoordonate;
	}
	
	public int getZ() {
		return zCoordonate;
	}
	
	public void setX(int x) {
		xCoordonate = x;
	}
	
	public void setY(int y) {
		yCoordonate = y;
	}
	
	public void setZ(int z) {
		zCoordonate = z;
	}
	
	public void multiply(int scal) {
		xCoordonate *= scal;
		yCoordonate *= scal;
		zCoordonate *= scal;
	}
	
	public void display() {
		System.out.print("{");
		System.out.print(Integer.toString(xCoordonate)+", ");
		System.out.print(Integer.toString(yCoordonate)+", ");
		System.out.print(Integer.toString(zCoordonate));
		System.out.println("}");
	}
	
	public static int dotProduct(Vector scalar1, Vector scalar2) {
		int result = 0;
		result += scalar1.getX() * scalar2.getX();
		result += scalar1.getY() * scalar2.getY();
		result += scalar1.getZ() * scalar2.getZ();
		return result;
	}
	
	public static Vector sum(Vector vect1, Vector vect2) {
		Vector result = new Vector(
			vect1.getX() + vect2.getX(),
			vect1.getY() + vect2.getY(),
			vect1.getZ() + vect2.getZ()
		);
		return result;
	}
	
	public int getNumberOfVectors() {
		return NUMBER_OF_VECTORS;
	}
	
	public String toString() {
		String str = "{";
		str += Integer.toString(getX()) + ", ";
		str += Integer.toString(getY()) + ", ";
		str += Integer.toString(getZ()) + "}";
		return str;
	}
	
	public static void swapVectors(Vector vect1, Vector vect2) {
		final int xTemp = vect1.getX();
		final int yTemp = vect1.getY();
		final int zTemp = vect1.getZ();
		vect1.setX(vect2.getX());
		vect1.setY(vect2.getY());
		vect1.setZ(vect2.getZ());		
		vect2.setX(xTemp);
		vect2.setY(yTemp);
		vect2.setZ(zTemp);
	}
}

class PairVect {
	Vector vector1;
	Vector vector2;
	
	public PairVect(int x1, int y1, int z1, int x2, int y2, int z2) {
		vector1 = new Vector(x1, y1, z1);
		vector2 = new Vector(x2, y2, z2);
	}
	
	public PairVect(Vector vect1, Vector vect2) {
		vector1 = vect1;
		vector2 = vect2;
	}
	
	public Vector getFirstVector() {
		return vector1;
	}
	
	public Vector getSecondVector() {
		return vector2;
	}
}
