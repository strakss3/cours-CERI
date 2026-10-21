
/**Circle object
 * 
 */
public class Circle implements GeomFig {

	/**Radius of the circle
	 * 
	 */
	public double radius;
	
	/**Constructor for Circle class
	 * @param radius
	 */
	public Circle(double radius) {
		super();
		this.radius = radius;
	}

	/**Return circle perimeter
	 *
	 */
	@Override
	public double perimeter() {
		return 2 * Math.PI * this.radius;
	}

	/**Override toString method for Circle class
	 *
	 */
	@Override
	public String toString() {
		return "Circle [radius=" + radius + "]";
	}
}
