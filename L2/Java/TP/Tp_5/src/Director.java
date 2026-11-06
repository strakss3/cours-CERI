
public class Director extends Person implements Worker, Pay {

	public double fixSalary;
	private static Director DIRECTOR;
	
	public static Director getInstance(String name, double fixSalary) {
		if (DIRECTOR == null) {			
			DIRECTOR = new Director(name, fixSalary);		
		}
		return DIRECTOR;
	}
	
	private Director(String name, double fixSalary) {
		super(name);
		this.fixSalary = fixSalary;
	}
	
	@Override
	protected Object clone() throws CloneNotSupportedException {
		System.err.println("On ne clone pas un singleton");
		return DIRECTOR;
	}
	
	@Override
	public double computeSalary() {
		return this.fixSalary;
	}

	@Override
	public double computeBonus() {
		return Commercial.TOTAL_TURNOVER * 0.004;
	}

	@Override
	public double computePayment() {
		return this.computeSalary() + this.computeBonus();
	}
}