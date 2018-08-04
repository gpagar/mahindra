package com.mahindra.project.model;

public class GraphData {

	BreakdownMonthwise breakdownMothwiseRes =null;
		
	YearlyMachinBreakdownList breakdownYearlyListRes=null;

	 int year;

	
	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}



	public BreakdownMonthwise getBreakdownMothwiseRes() {
		return breakdownMothwiseRes;
	}

	public void setBreakdownMothwiseRes(BreakdownMonthwise breakdownMothwiseRes) {
		this.breakdownMothwiseRes = breakdownMothwiseRes;
	}

	public YearlyMachinBreakdownList getBreakdownYearlyListRes() {
		return breakdownYearlyListRes;
	}

	public void setBreakdownYearlyListRes(YearlyMachinBreakdownList breakdownYearlyListRes) {
		this.breakdownYearlyListRes = breakdownYearlyListRes;
	}

	@Override
	public String toString() {
		return "GraphData [breakdownMothwiseRes=" + breakdownMothwiseRes + ", breakdownYearlyListRes="
				+ breakdownYearlyListRes + ", year=" + year + "]";
	}
    
	
}
