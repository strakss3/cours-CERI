import java.util.Arrays;

/**Polygon class
 * 
 */
public class Polygon implements GeomFig {

	/**Array that store length of the shape
	 * 
	 */
	public double[] edgeLength;
	
	/**Polygon constructor
	 * @param numberOfEdges How many side, your polygon has
	 */
	public Polygon(int numberOfEdges) {
		super();
		this.edgeLength = new double[numberOfEdges];
	}
	
	/**Method that add a length to edgeLength
	 * @param length length that you want to add
	 */
	public void addEdgeLength(double length) {
		for(int i = 0 ; i < this.edgeLength.length ; i++)
			if (this.edgeLength[i] == 0) {
				this.edgeLength[i] = length;
				break;
			}
	}

	/**Override toString method to Polygon
	 *
	 */
	@Override
	public String toString() {
		return "Polygon [edgeLength=" + Arrays.toString(edgeLength) + "]";
	}

	/**Override perimeter method for Polygon class
	 *
	 */
	@Override
	public double perimeter() {
		double sum = 0;
		for(int i = 0 ; i < this.edgeLength.length ; i++) sum += this.edgeLength[i];
		return sum;
	}
}