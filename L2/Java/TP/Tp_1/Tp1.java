/* Exo 1 :
 *  Une chaise          class
 *   
 *  Les enfants         class
 *  Moi                 objet
 *   
 *  Le tableau          class
 *  Ces tables          objet
 *  
 *  Une voiture         class
 *  La voiture blanche  objet
 *  
 *  Un professeur       class
 *  M. Jabaian          objet
 */

/* Exo 2 :
 *  vehicule
 *      terrestre
 *          moto            La moto de Pierre
 *          voiture         Une 205 rouge
 *          bus             Le premier bus vers Aix
 *          train           Le train pour Marseille
 *              TGV         Le TGV Paris-Lyon
 *              ferry       Le Ferry Bastia Marseille de 17h15
 *      maritime
 *          voilier         Le voilier de Marc Pajot
 *      aérien
 *          avion           Un airbus A320 particulier
 *          delta plane     Le delta plane de Paco
 */

/* Exo 3 :
 *  class Window {
 *      int yCornerCoordonate1;
 *      int xCornerCoordonate1;
 *      int yCornerCoordonate2;
 *      int xCornerCoordonate2;
 *      String backgroundColor;
 *      int windowWidth;
 *      int windowHeight;
 *
 *      int* getCornerCoordonate();
 *      int  getWindowWidth();
 *      int  getWindowHeight();
 *      void getBackgoundColor(String);
 *      void setBackgoundColor(String);
 *      void moveWindowTo(int x, int y);
 *  }
 *
 *  class Pile {
 *      int[] elements;
 *      
 *      bool empty();
 *      Node* peak();
 *      Node* pop();
 *      void push(int);
 *      bool search(int);
 *  }
 *
 *  class Television {
 *      int volume;
 *      int contrast;
 *
 *      int  getVolume();
 *      void setVolume(int);
 *      int getContrast();
 *      void setContrast(int);
 *      void turnOn();
 *      void delay(int);
 *  }
 */

/* Exo 4 :
 *  class Led {
 *      colorR;
 *      colorG;
 *      colorB;
 *
 *      void switchState();
 *      void getState();
 *      void setColorRed();
 *      void setColorGreen();
 *  }
 *
 *  class DigitalCode {
 *      static int password;		
 *  }
 *
 *  class Door {
 *      boolean opened;
 *
 *      void openDoor();
 *      void closeDoor();
 *  }
 *
 */

public class Tp1 {
    public static void main(String[] args) {
        //Exo1.main(args);
        //Exo2.main(args);
        Exo3.main(args);
    }
}

class Exo1 {
    public static void main(String[] args) {
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
        System.out.println();
    }
}

class NumberOfArgumentsException extends Exception {
    public NumberOfArgumentsException() {
        super();
    }

    public NumberOfArgumentsException(String s) {
        super(s);
    }
}

class ArgumentsTypeException extends Exception {
    public ArgumentsTypeException() {
        super();
    }
    public ArgumentsTypeException(String s) {
        super(s);
    }
}

class ArgumentsValueException extends Exception {
    public ArgumentsValueException() {
        super();
    }
    public ArgumentsValueException(String s) {
        super(s);
    }
}

class NegativeDeltaException extends Exception {
    public NegativeDeltaException() {
        super();
    }
    public NegativeDeltaException(String s) {
        super(s);
    }
}

class Exo2 {
    static int A;
    static int B;
    static int C;
    static double DELTA;

    public static void testNumberOfArguments(String[] args) throws NumberOfArgumentsException {
        if (args.length > 3) {
            throw new NumberOfArgumentsException("NumberOfArgumentsException : too many arguments");
        }
        else if (args.length < 3) {
            throw new NumberOfArgumentsException("NumberOfArgumentsException : not enough arguments");
        }
    }

    public static void testArgumentsType(String[] args) throws ArgumentsTypeException {
        try {
            A = Integer.valueOf(args[0]);
            B = Integer.valueOf(args[1]);
            C = Integer.valueOf(args[2]);
        }
        catch (NumberFormatException e) {
            throw new ArgumentsTypeException("ArgumentsTypeException : arguments must be integers");
        }            
    }

    public static void testArgumentsValue(int value) throws ArgumentsValueException {
        if (value == 0) {
            throw new ArgumentsValueException("ArgumentsValueException : a equal 0");
        }
    }

    public static void computeDelta() throws NegativeDeltaException{
        DELTA = B*B - 4*A*C;
        if (DELTA < 0) {
            throw new NegativeDeltaException("NegativeDeltaException : no real roots");
        }
    }

    public static double solveWhenDeltaIsZero() {
        return -B/(2*A);
    }
    
    public static double[] solveWhenDeltaIsPositive() {
        double x1 = (-B + Math.sqrt(DELTA)) / (2*A);
        double x2 = (-B - Math.sqrt(DELTA)) / (2*A);
        double[] xArray = {x1, x2};
        return xArray;
    }

    public static void main(String[] args) {
        try {
            testNumberOfArguments(args);
            testArgumentsType(args);
            testArgumentsValue(A);
            computeDelta();

            String equation = args[0]+"x² + "+args[1]+"x + "+args[2]+" = 0";
            System.out.println("Solutions of : " + equation);
            if (DELTA == 0) {
                double x = solveWhenDeltaIsZero();
                System.out.println("x = "+Double.toString(x));
            }
            else if (DELTA > 0) {
                double[] x = solveWhenDeltaIsPositive();
                System.out.println("x1 = "+Double.toString(x[0]));
                System.out.println("x2 = "+Double.toString(x[1]));
            }
        }
        catch (NumberOfArgumentsException e) {
            System.out.println(e.getMessage());
        }
        catch (ArgumentsTypeException e) {
            System.out.println(e.getMessage());
        }
        catch (ArgumentsValueException e) {
            System.out.println(e.getMessage());
        }
        catch(NegativeDeltaException e) {
            System.out.println(e.getMessage());
        }
    }
}

class InvalidDateException extends Exception {
    public InvalidDateException() {
        super();
    }
    public InvalidDateException(String s) {
        super(s);
    }
}

class Exo3 {
    
    static int day;
    static int month;
    static int year;
    
    public static void testNumberOfArguments(String[] args) throws NumberOfArgumentsException{
        if (args.length > 3) {
            throw new NumberOfArgumentsException("NumberOfArgumentsException : too many arguments");
        }
        if (args.length < 3) {
            throw new NumberOfArgumentsException("NumberOfArgumentsException : not enough arguments");
        }
    }

    public static void testArgumentsType(String[] args) throws ArgumentsTypeException {
        try {
            day   = Integer.valueOf(args[0]);
            month = Integer.valueOf(args[1]);
            year  = Integer.valueOf(args[2]);
        }
        catch (NumberFormatException e) {
            throw new ArgumentsTypeException("ArgumentsTypeException : arguments must be integers");
        }
    }   
    
    public static void testYear() throws InvalidDateException {
        if (year < 1) {
            throw new InvalidDateException("InvalidDateException : year must be at least 1");
        }
    }

    public static void testMonth() throws InvalidDateException {
        if (month < 1 || month > 12) {
            throw new InvalidDateException("InvalidDateException : month must be between 1 and 12");
        }
    }

    public static void testDay() throws InvalidDateException {
        if (day < 1 || day > maxDaysInMonth()) {
            throw new InvalidDateException("InvalidDateException : day " + day + " does not exist in this month");
        }
    }

    public static int maxDaysInMonth() {
        if (month == 2) {
            if (isLeapYear()) {
                return 29;
            }
            else {
                return 28;
            }
        }
        else if (month == 4 || month == 6 || month == 9 || month == 11) {
            return 30;
        }
        else {
            return 31;
        }
    }

    public static boolean isLeapYear() {
        return (year % 4 == 0) && (year % 100 != 0 || year % 400 == 0);
    }

    public static int[] computeNextDate() {
        int[] nextDate = {day, month, year};
        if(day+1 > maxDaysInMonth()) {
            nextDate[0] = 1;
            if(month+1 > 12) {
                nextDate[1] = 1;
                nextDate[2] += 1;
            }
            else {
                nextDate[1] += 1;
            }
        }
        else {
            nextDate[0] += 1;
        }
        return nextDate;
    }

    public static void main(String[] args) {
        try {
            testNumberOfArguments(args);
            testArgumentsType(args);
            testYear();
            testMonth();
            testDay();

            int[] nextDate = computeNextDate();
            System.out.println("Date format: DD/MM/YYYY");
            System.out.println("The day after "+Integer.toString(day)+"/"+Integer.toString(month)+"/"+Integer.toString(year)+" is:");
            System.out.println(nextDate[0]+"/"+nextDate[1]+"/"+nextDate[2]);
        }
        catch (NumberOfArgumentsException e) {
            System.out.println(e.getMessage());
        }
        catch (ArgumentsTypeException e) {
            System.out.println(e.getMessage());
        }
        catch (InvalidDateException e) {
            System.out.println(e.getMessage());
        }
    }
}