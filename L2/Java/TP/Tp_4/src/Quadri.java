import java.util.Arrays;

/**Quadrilateral class
 * 
 */
public class Quadri extends Polygon {

	/**Quadri constructor
	 * @param len1 1st side length of the shape
	 * @param len2 2nd side length of the shape
	 * @param len3 3rd side length of the shape
	 * @param len4 4th side length of the shape
	 */
	public Quadri(double len1, double len2, double len3, double len4) {
		super(4);
		this.addEdgeLength(len1);
		this.addEdgeLength(len2);
		this.addEdgeLength(len3);
		this.addEdgeLength(len4);
	}

	/**Override toString method for Quadri class
	 *
	 */
	@Override
	public String toString() {
		return "Quadri [edgeLength=" + Arrays.toString(edgeLength) + "]";
	}

}
