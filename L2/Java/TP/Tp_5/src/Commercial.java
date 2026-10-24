
public class Commercial extends Employee {

	public double ownRevenue;
	
	public Commercial(String name, double hourlyRate, double standardNumberHour, double ownRevenue) {
		super(name, hourlyRate, standardNumberHour);
		this.ownRevenue = ownRevenue;
	}

	@Override
	public double payment() {
		return super.payment() + 0.01*this.ownRevenue;
	}
}
