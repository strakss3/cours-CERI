
public class Commercial extends Person implements Worker, Pay {

	public double fixSalary;
	public double ownTurnover;
	public Company company;

	public Commercial(String name, double fixSalary, double ownTurnover, Company company) {
		super(name);
		this.fixSalary = fixSalary;
		this.ownTurnover = ownTurnover;
		if (company.addWorker(this)) {			
			this.company = company;
			this.company.totalTurnover += this.ownTurnover;
		}
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
