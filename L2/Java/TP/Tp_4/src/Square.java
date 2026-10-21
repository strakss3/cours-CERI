import java.util.Arrays;

/**Square object
 * 
 */
public class Square extends Rectangle {

	/**Square constructor
	 * @param len side length of the square
	 */
	public Square(double len) {
		super(len, len);
	}

	/**Override toString method for Square class
	 *
	 */
	@Override
	public String toString() {
		return "Square [edgeLength=" + Arrays.toString(edgeLength) + "]";
	}

	/**Override perimeter method for Square class
	 *
	 */
	@Override
	public double perimeter() {
		return 4 * this.edgeLength[0];
	}
}
