package com.mahindra.project.model;

import java.io.Serializable;


public class DailyGraphData implements Serializable {
	
	DailySearchedTarget dSearchedTarget=null;

	DailyBreakdowns dailyBreakdowns=null;

	BreakdownProblemsList bProblemsList=null;

	
	public BreakdownProblemsList getbProblemsList() {
		return bProblemsList;
	}

	public void setbProblemsList(BreakdownProblemsList bProblemsList) {
		this.bProblemsList = bProblemsList;
	}

	public DailySearchedTarget getdSearchedTarget() {
		return dSearchedTarget;
	}

	public void setdSearchedTarget(DailySearchedTarget dSearchedTarget) {
		this.dSearchedTarget = dSearchedTarget;
	}

	public DailyBreakdowns getDailyBreakdowns() {
		return dailyBreakdowns;
	}

	public void setDailyBreakdowns(DailyBreakdowns dailyBreakdowns) {
		this.dailyBreakdowns = dailyBreakdowns;
	}

	@Override
	public String toString() {
		return "DailyGraphData [dSearchedTarget=" + dSearchedTarget + ", dailyBreakdowns=" + dailyBreakdowns
				+ ", bProblemsList=" + bProblemsList + "]";
	}

	   
}
