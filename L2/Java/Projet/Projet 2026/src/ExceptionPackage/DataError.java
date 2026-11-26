package ExceptionPackage;

public class DataError extends ClientError {

	public DataError() {
	}

	public DataError(String message) {
		super(message);
	}

	public DataError(Throwable cause) {
		super(cause);
	}

	public DataError(String message, Throwable cause) {
		super(message, cause);
	}

	public DataError(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

}
