import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		Scanner test = new Scanner(System.in);
		String input;
		while(true) {
			System.out.println("Oui ?");
			input = test.nextLine();
			if(input.equals("stop")) break;
			System.out.println("Tu as dis : " + input);
			System.out.println();
			
		}
		test.close();			
	}
}
