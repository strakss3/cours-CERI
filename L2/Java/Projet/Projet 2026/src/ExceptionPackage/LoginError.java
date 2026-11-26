package ExceptionPackage;

public class LoginError extends ClientError {

	public LoginError() {
	}

	public LoginError(String message) {
		super(message);
	}

	public LoginError(Throwable cause) {
		super(cause);
	}

	public LoginError(String message, Throwable cause) {
		super(message, cause);
	}

	public LoginError(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

}
