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

class InvalidDateException extends Exception {
    public InvalidDateException() {
        super();
    }
    public InvalidDateException(String s) {
        super(s);
    }
}

public class Exo3 {
    
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