package DN;
import java.io.Serializable;

public class DistinguishedNameObject implements Serializable {

	public DistinguishedName dn;
	public ObjectToBeSent object;

	public DistinguishedNameObject(DistinguishedName dn, ObjectToBeSent object) {
		super();
		this.dn = dn;
		this.object = object;
	}
	
}
