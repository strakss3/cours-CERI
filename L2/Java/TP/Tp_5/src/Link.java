
public class Link<T>{
	
	public T value;
	public Link<T> nextLink;
	
	public Link(T value, Link<T> nextLink) {
		super();
		this.value = value;
		this.nextLink = nextLink;
	}	
}
