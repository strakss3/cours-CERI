package DN;

public class DistinguishedNameObjectFactory {

	private static DistinguishedNameObjectFactory DNOF;
	public DistinguishedNameObjectList dnol;

	public DistinguishedNameObjectFactory getInstance() {
		if (DistinguishedNameObjectFactory.DNOF == null) {
			DistinguishedNameObjectFactory.DNOF = new DistinguishedNameObjectFactory();
		}
		return DistinguishedNameObjectFactory.DNOF;
	}

	private DistinguishedNameObjectFactory() {
		this.dnol = new DistinguishedNameObjectList();
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		return DistinguishedNameObjectFactory.DNOF;
	}

}
