import java.io.Serializable;

public class Person implements Serializable {
	
	private static final long serialVersionUID = 457245L;
	
	public String name;
	public int age;
	public int phoneNumber;
	
	public Person(String name, int age, int phoneNumber) {
		super();
		this.name = name;
		this.age = age;
		this.phoneNumber = phoneNumber;
	}
	
	@Override
	public String toString() {
		return "Person [name=" + name + ", age=" + age + ", phoneNumber=" + phoneNumber + "]";
	}
}
