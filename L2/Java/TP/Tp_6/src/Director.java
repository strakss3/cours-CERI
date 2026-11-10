import java.util.HashMap;

public class Director extends Person implements Worker, Pay {

	public double fixSalary;
	public Company company;
	public static HashMap<Company, Director> MAP;

	public static Director getInstance(String name, double fixSalary, Company company) {
		if (MAP == null) {
			MAP = new HashMap<Company, Director>();
		}
		if (MAP.containsKey(company)) {
			return MAP.get(company);
		}
		Director d = new Director(name, fixSalary, company);
		MAP.put(company, d);
		return d;
	}

	private Director(String name, double fixSalary, Company company) {
		super(name);
		this.fixSalary = fixSalary;
		if (company.addWorker(this)) {			
			this.company = company;
		}
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		System.err.println("On ne clone pas un singleton");
		return null;
	}

	@Override
	public double computeSalary() {
		return this.fixSalary;
	}

	@Override
	public double computeBonus() {
		return this.company.totalTurnover * 0.004;
	}

	@Override
	public double computePayment() {
		return this.computeSalary() + this.computeBonus();
	}
}