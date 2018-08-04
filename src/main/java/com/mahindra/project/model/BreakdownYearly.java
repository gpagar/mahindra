package com.mahindra.project.model;


public class BreakdownYearly{
	
	private int id;
	
	private int firstYear;
	
	private int secondYear;
	
	private int thirdYear;
	
	private int fourthYear;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getFirstYear() {
		return firstYear;
	}

	public void setFirstYear(int firstYear) {
		this.firstYear = firstYear;
	}

	public int getSecondYear() {
		return secondYear;
	}

	public void setSecondYear(int secondYear) {
		this.secondYear = secondYear;
	}

	public int getThirdYear() {
		return thirdYear;
	}

	public void setThirdYear(int thirdYear) {
		this.thirdYear = thirdYear;
	}

	public int getFourthYear() {
		return fourthYear;
	}

	public void setFourthYear(int fourthYear) {
		this.fourthYear = fourthYear;
	}

	@Override
	public String toString() {
		return "BreakdownYearly [id=" + id + ", firstYear=" + firstYear + ", secondYear=" + secondYear + ", thirdYear="
				+ thirdYear + ", fourthYear=" + fourthYear + "]";
	}
	

}
