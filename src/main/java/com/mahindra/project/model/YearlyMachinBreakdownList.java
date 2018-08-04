package com.mahindra.project.model;


public class YearlyMachinBreakdownList {


	BreakdownYearly breakdownYearly=null;
	MachineL5Target machineL5Target=null;
	MachineL3Target machineL3Target=null;
	DailyBreakdowns dailyBreakdowns=null;
	BreakdownProblemsList bProblemsList=null;
	public BreakdownYearly getBreakdownYearly() {
		return breakdownYearly;
	}
	public void setBreakdownYearly(BreakdownYearly breakdownYearly) {
		this.breakdownYearly = breakdownYearly;
	}
	public MachineL5Target getMachineL5Target() {
		return machineL5Target;
	}
	public void setMachineL5Target(MachineL5Target machineL5Target) {
		this.machineL5Target = machineL5Target;
	}
	
	public MachineL3Target getMachineL3Target() {
		return machineL3Target;
	}
	public void setMachineL3Target(MachineL3Target machineL3Target) {
		this.machineL3Target = machineL3Target;
	}
	
	public DailyBreakdowns getDailyBreakdowns() {
		return dailyBreakdowns;
	}
	public void setDailyBreakdowns(DailyBreakdowns dailyBreakdowns) {
		this.dailyBreakdowns = dailyBreakdowns;
	}
	
	public BreakdownProblemsList getbProblemsList() {
		return bProblemsList;
	}
	public void setbProblemsList(BreakdownProblemsList bProblemsList) {
		this.bProblemsList = bProblemsList;
	}
	@Override
	public String toString() {
		return "YearlyMachinBreakdownList [breakdownYearly=" + breakdownYearly + ", machineL5Target=" + machineL5Target
				+ ", machineL3Target=" + machineL3Target + ", dailyBreakdowns=" + dailyBreakdowns + ", bProblemsList="
				+ bProblemsList + "]";
	}
	
	
}
