package DN;

import java.util.ArrayList;
import java.util.Collection;

public class DistinguishedNameObjectList extends ArrayList<DistinguishedNameObject> {

	public DistinguishedNameObjectList() {
	}

	public DistinguishedNameObjectList(int initialCapacity) {
		super(initialCapacity);
	}

	public DistinguishedNameObjectList(Collection<? extends DistinguishedNameObject> c) {
		super(c);
	}
	
	public ArrayList<DistinguishedName> generateDnl() {
		ArrayList<DistinguishedName> listDnl = new ArrayList<DistinguishedName>();
		for(int i = 0 ; i < size() ; i++) {
			listDnl.add(get(i).dn);
		}
		return listDnl;
	}
	
	public void removeFromName(String name) {
		for(int i = 0 ; i < size() ; i++) {
			if (get(i).dn.name == name) {
				remove(i);
				break;
			}
		}
	}

}
