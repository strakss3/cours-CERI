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

public class Exo2 {
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