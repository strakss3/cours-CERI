import java.util.Vector;

public class Company {

	public Vector<Worker> vectWorker;
	public double totalTurnover;

	public Company() {
		super();
		this.vectWorker = new Vector<Worker>();
	}

	public boolean addWorker(Worker w) {
		return this.vectWorker.add(w);
	}

	public boolean removeWorker(Worker w) {
		return this.vectWorker.remove(w);
	}

	@Override
	public String toString() {
		return "Company [vectWorker=" + vectWorker + ", totalTurnover=" + totalTurnover + "]";
	}
}
