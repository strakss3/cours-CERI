package DN;

public class ObjectToBeSent implements InterfaceForObjectMessage {

	public Object object;
	public String from;
	public String dest;
	
	@Override
	public void display() {
		System.out.println("ObjectToBeSent [object=" + object + ", from=" + from + ", dest=" + dest + "]");
	}
	
	@Override
	public Object getObject() {
		return this.object;
	}

	@Override
	public void setObject(Object object) {
		this.object = object;
	}

	@Override
	public String getFrom() {
		return this.from;
	}

	@Override
	public void setFrom(String from) {
		this.from = from;
	}

	@Override
	public String getDest() {
		return this.dest;
	}

	@Override
	public void setDest(String dest) {
		this.dest = dest;
	}

}
