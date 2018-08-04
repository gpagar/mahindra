package com.mahindra.project.model;


public class YearlyMachineBdTimeList {

	BreakdownTimeYearly breakdownYearly=null;
	MachineL5TimeTarget machineL5Target=null;
	MachineL3TimeTarget machineL3Target=null;
	DailyBreakdowns dailyBreakdowns=null;
	BreakdownProblemsList bProblemsList=null;
    
	public BreakdownProblemsList getbProblemsList() {
		return bProblemsList;
	}
	public void setbProblemsList(BreakdownProblemsList bProblemsList) {
		this.bProblemsList = bProblemsList;
	}
	public BreakdownTimeYearly getBreakdownYearly() {
		return breakdownYearly;
	}
	public void setBreakdownYearly(BreakdownTimeYearly breakdownYearly) {
		this.breakdownYearly = breakdownYearly;
	}
	public MachineL5TimeTarget getMachineL5Target() {
		return machineL5Target;
	}
	public void setMachineL5Target(MachineL5TimeTarget machineL5Target) {
		this.machineL5Target = machineL5Target;
	}
	public MachineL3TimeTarget getMachineL3Target() {
		return machineL3Target;
	}
	public void setMachineL3Target(MachineL3TimeTarget machineL3Target) {
		this.machineL3Target = machineL3Target;
	}
	public DailyBreakdowns getDailyBreakdowns() {
		return dailyBreakdowns;
	}
	public void setDailyBreakdowns(DailyBreakdowns dailyBreakdowns) {
		this.dailyBreakdowns = dailyBreakdowns;
	}
	@Override
	public String toString() {
		return "YearlyMachineBdTimeList [breakdownYearly=" + breakdownYearly + ", machineL5Target=" + machineL5Target
				+ ", machineL3Target=" + machineL3Target + ", dailyBreakdowns=" + dailyBreakdowns + "]";
	}
	
	
}
