
public class Employee implements Pay {
	
	public String name;
	public double hourlyRate;
	public double numberHour;
	public double standardNumberHour;
	public double prime;
	
	public Employee(String name, double hourlyRate, double standardNumberHour) {
		super();
		this.name = name;
		this.hourlyRate = hourlyRate;
		this.numberHour = 0;
		this.standardNumberHour= standardNumberHour ;
		this.prime = 0;
	}

	@Override
	public double payment() {
		if (this.numberHour < this.standardNumberHour) return this.numberHour * this.numberHour;
		else return this.numberHour * this.numberHour + this.prime;
	}
}
