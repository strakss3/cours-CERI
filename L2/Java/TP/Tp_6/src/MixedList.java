
public class MixedList {
	
	public Link firstElement;
	public Link currentLink;

	public MixedList() {
		super();
		this.firstElement = null;
	}

	public void add(Display value) {
		this.firstElement = new Link(value, firstElement);
	}

	public void initialise() {
		this.currentLink = this.firstElement;
	}

	public void next() {
		this.currentLink = this.currentLink.nextLink;
	}

	public Display getCurrentValue() {
		return this.currentLink.value;
	}

	public boolean endOfList() {
		return this.currentLink == null;
	}

	public void display() {
		this.initialise();
		while(!this.endOfList()) {
			System.out.print(this.getCurrentValue().getClass() + " : ");
			this.getCurrentValue().display();
			this.next();
		}
	}
}
