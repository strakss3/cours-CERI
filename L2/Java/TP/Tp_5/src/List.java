
public class List<T> {

	public Link<T> firstElement;
	public Link<T> currentLink;

	public List() {
		super();
		this.firstElement = null;
	}

	public void add(T value) {
		this.firstElement = new Link<T>(value, firstElement);
	}

	public void initialise() {
		this.currentLink = this.firstElement;
	}

	public void next() {
		this.currentLink = this.currentLink.nextLink;
	}

	public T getCurrentValue() {
		return this.currentLink.value;
	}

	public boolean endOfList() {
		return this.currentLink == null;
	}

	public void display() {
		this.initialise();
		while(!this.endOfList()) {
			System.out.println(this.getCurrentValue());
			this.next();
		}
	}
}