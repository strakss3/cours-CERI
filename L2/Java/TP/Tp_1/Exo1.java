public class Exo1 {
    public static void main(String args[]) {
        System.out.println("Vrai ordre :");
        for(String s : args) {
            System.out.print(s + " ");
        }

        System.out.println("\n\n" + "Sens inverse :");
        for(int i = args.length-1 ; i >= 0 ; i--) {
            System.out.print(args[i] + " ");
        }


        System.out.println("\n\n" + "Caractères renversés :");
        for(int i = args.length-1 ; i >= 0 ; i--) {
            for(int j = args[i].length()-1 ; j >= 0 ; j--) {
                System.out.print(args[i].charAt(j));
            }
            System.out.print(" ");
        }
    }
}