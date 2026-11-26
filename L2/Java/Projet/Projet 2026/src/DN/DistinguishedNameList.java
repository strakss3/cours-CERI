package DN;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

public class DistinguishedNameList extends ArrayList<DistinguishedName> implements Serializable {

	public DistinguishedNameList() {
	}

	public DistinguishedNameList(int initialCapacity) {
		super(initialCapacity);
	}

	public DistinguishedNameList(Collection<? extends DistinguishedName> c) {
		super(c);
	}

	public int indexFromCode(String code) {
		for(int i = 0 ; i < size() ; i++) {
			if(get(i).code == code) return i;
		}
		return -1;
	}

}
