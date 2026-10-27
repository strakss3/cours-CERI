
public class Director extends Employee {

	public double fixSalary;

	public Director(String name, double hourlyRate, double standardNumberHour, double fixSalary) {
		super(name, hourlyRate, standardNumberHour);
		this.fixSalary = fixSalary;
	}

	@Override
	public double payment() {
		return this.fixSalary + 0.004*1;
	}
	
	
}
