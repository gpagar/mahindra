package com.mahindra.project.model;

public class GraphBCData {
	
	YearlyMachineBdTimeList yearlyMachineBdTimeList;
	
	BreakdownTimeMonthwise breakdownTimeMonthwise;

	 int year;

	 
	public YearlyMachineBdTimeList getYearlyMachineBdTimeList() {
		return yearlyMachineBdTimeList;
	}

	public void setYearlyMachineBdTimeList(YearlyMachineBdTimeList yearlyMachineBdTimeList) {
		this.yearlyMachineBdTimeList = yearlyMachineBdTimeList;
	}

	public BreakdownTimeMonthwise getBreakdownTimeMonthwise() {
		return breakdownTimeMonthwise;
	}

	public void setBreakdownTimeMonthwise(BreakdownTimeMonthwise breakdownTimeMonthwise) {
		this.breakdownTimeMonthwise = breakdownTimeMonthwise;
	}
    
	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	@Override
	public String toString() {
		return "GraphBCData [yearlyMachineBdTimeList=" + yearlyMachineBdTimeList + ", breakdownTimeMonthwise="
				+ breakdownTimeMonthwise + "]";
	}

	
}
