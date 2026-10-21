import java.util.Arrays;

/**Rectangle object
 * 
 */
public class Rectangle extends Quadri {

	/**Rectangle constructor 
	 * @param len1 longest side of the rectangle
	 * @param len2 shortest side of the rectangle
	 */
	public Rectangle(double len1, double len2) {
		super(len1, len2, len1, len2);
	}

	/**Override toString method for Rectangle class
	 *
	 */
	@Override
	public String toString() {
		return "Rectangle [edgeLength=" + Arrays.toString(edgeLength) + "]";
	}
}
