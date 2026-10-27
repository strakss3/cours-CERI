
public class Commercial extends Employee {

	public double fixSalary;
	public double ownRevenue;
	
	public Commercial(String name, double hourlyRate, double standardNumberHour, double fixSalary, double ownRevenue) {
		super(name, hourlyRate, standardNumberHour);
		this.ownRevenue = ownRevenue;
		this.fixSalary = fixSalary;
	}

	@Override
	public double payment() {
		return this.fixSalary + 0.01*this.ownRevenue;
	}
}
