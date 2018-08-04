package com.mahindra.project.model;

import java.io.Serializable;

public class BreakdownTimeYearly implements Serializable {


	private int id;
	
	private int firstYear;
	
	private int secondYear;
	
	private int thirdYear;
	
	private int fourthYear;
	
	private float firstYearTime;
	
	private float secondYearTime;
	
	private float thirdYearTime;
	
	private float fourthYearTime;

	
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


	public float getFirstYearTime() {
		return firstYearTime;
	}


	public void setFirstYearTime(float firstYearTime) {
		this.firstYearTime = firstYearTime;
	}


	public float getSecondYearTime() {
		return secondYearTime;
	}


	public void setSecondYearTime(float secondYearTime) {
		this.secondYearTime = secondYearTime;
	}


	public float getThirdYearTime() {
		return thirdYearTime;
	}


	public void setThirdYearTime(float thirdYearTime) {
		this.thirdYearTime = thirdYearTime;
	}


	public float getFourthYearTime() {
		return fourthYearTime;
	}


	public void setFourthYearTime(float fourthYearTime) {
		this.fourthYearTime = fourthYearTime;
	}


	@Override
	public String toString() {
		return "BreakdownTimeYearly [id=" + id + ", firstYear=" + firstYear + ", secondYear=" + secondYear
				+ ", thirdYear=" + thirdYear + ", fourthYear=" + fourthYear + ", firstYearTime=" + firstYearTime
				+ ", secondYearTime=" + secondYearTime + ", thirdYearTime=" + thirdYearTime + ", fourthYearTime="
				+ fourthYearTime + "]";
	}
	
	
}
