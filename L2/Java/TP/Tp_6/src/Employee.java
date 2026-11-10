
public class Employee extends Person implements Worker, Pay {

	public double hourlyRate;
	public double numberHour;
	public double bonusRate;
	public Company company;

	public Employee(String name, double hourlyRate, double numberHour, double bonusRate, Company company) {
		super(name);
		this.hourlyRate = hourlyRate;
		this.numberHour = numberHour;
		this.bonusRate = bonusRate;
		if (company.addWorker(this)) {			
			this.company = company;
		}
	}

	@Override
	public double computeSalary() {
		return this.hourlyRate * this.numberHour;
	}

	@Override
	public double computeBonus() {
		if(this.numberHour > 35) {			
			return this.numberHour * this.bonusRate;
		}
		else {
			return 0;
		}
	}

	@Override
	public double computePayment() {
		return this.computeSalary() + this.computeBonus();
	}
}
