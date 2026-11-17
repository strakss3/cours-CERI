
public class NatErr extends Exception {
	
	public NatErr() {
		super();
	}

	public NatErr(String message) {
		super("NatErr -> " + message);
	}
}
