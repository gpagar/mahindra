package com.mahindra.project.model;

public class Info {
	
	private boolean isError;
	private String message;
	public boolean isError() {
		return isError;
	}
	public void setError(boolean isError) {
		this.isError = isError;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "Info [isError=" + isError + ", message=" + message + "]";
	}
	
	

}
