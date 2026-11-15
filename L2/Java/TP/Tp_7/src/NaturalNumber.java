
public class NaturalNumber {
	public int number;

	public NaturalNumber(int number) throws ConstErr {
		super();
		if(number < 0) throw new ConstErr("ConstErr : Le nombre doit être positif ou nul.");
		this.number = number;
	}

	public int getN() {
		return this.number;
	}

	public static NaturalNumber sum(NaturalNumber a, NaturalNumber b) {
		return null;
	}
}