import java.util.Arrays;

/**Triangle object
 * 
 */
public class Triangle extends Polygon {

	/**
	 * @param len1 1st side length of the triangle
	 * @param len2 2nd side length of the triangle
	 * @param len3 3rd side length of the triangle
	 */
	public Triangle(double len1, double len2, double len3) {
		super(3);
		this.addEdgeLength(len1);
		this.addEdgeLength(len2);
		this.addEdgeLength(len3);
	}

	/**Override toString method for Triangle class
	 *
	 */
	@Override
	public String toString() {
		return "Triangle [edgeLength=" + Arrays.toString(edgeLength) + "]";
	}

}
