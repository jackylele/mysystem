package com.sy.exception;

public class SysException extends Exception {
	private static final long serialVersionUID = 1L;
	String code = "-1";

	String message;

	Exception cause;

	public SysException(String code, String message, Exception cause) {
		super();
		this.code = code;
		this.message = message;
		this.cause = cause;
	}

	public SysException(String code, String message) {
		super();
		this.code = code;
		this.message = message;
	}

	public SysException(String message) {
		super();
		this.message = message;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Exception getCause() {
		return cause;
	}

	public void setCause(Exception cause) {
		this.cause = cause;
	}

	public SysException() {
		super();
	}

	public SysException(String message, Throwable cause) {
		super(message, cause);
	}

	public SysException(Throwable cause) {
		super(cause);
	}
}
