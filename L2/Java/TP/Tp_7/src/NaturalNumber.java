
public class NaturalNumber {
	public int number;

	public NaturalNumber(int number) throws ConstErr {
		super();
		if(number < 0) throw new ConstErr("Le nombre doit être positif ou nul.");
		this.number = number;
	}

	public long getN() {
		return this.number;
	}

	public static NaturalNumber sum(NaturalNumber a, NaturalNumber b) throws SumErr, ConstErr {
		long sum = (long)a.number + (long)b.number;
		if(sum > Integer.MAX_VALUE) throw new SumErr("La somme dépasse la valeur entière maximale.");
		NaturalNumber n = new NaturalNumber((int)sum);
		return n;
	}
	
	public static NaturalNumber diff(NaturalNumber a, NaturalNumber b) throws DiffErr, ConstErr {
		int diff = a.number - b.number;
		if(diff < 0) throw new DiffErr("La différence est nulle.");
		NaturalNumber n = new NaturalNumber(diff);
		return n;
	}
	
	public static NaturalNumber prod(NaturalNumber a, NaturalNumber b) throws ProdErr, ConstErr {
		long prod = (long)a.number * (long)b.number;
		if(prod > Integer.MAX_VALUE) throw new ProdErr("Le produit dépasse la valeur entière maximale.");
		NaturalNumber n = new NaturalNumber((int)prod);
		return n;
	}
}