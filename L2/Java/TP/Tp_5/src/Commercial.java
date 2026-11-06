
public class Commercial extends Person implements Worker, Pay {

	public double fixSalary;
	public double ownTurnover;
	public static double TOTAL_TURNOVER;	
	
	public Commercial(String name, double fixSalary, double ownTurnover) {
		super(name);
		this.fixSalary = fixSalary;
		this.ownTurnover = ownTurnover;
		Commercial.TOTAL_TURNOVER += this.ownTurnover;
	}

	@Override
	public double computeSalary() {
		return this.fixSalary;
	}

	@Override
	public double computeBonus() {
		return this.ownTurnover * 0.01;
	}

	@Override
	public double computePayment() {
		return this.computeSalary() + this.computeBonus();
	}
}
