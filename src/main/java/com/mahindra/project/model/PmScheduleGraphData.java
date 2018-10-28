package com.mahindra.project.model;

public class PmScheduleGraphData {

	PmActualGData pmActualGData;
	
	PmTargetGData pmTargetGData;
	
	MachineL5Target machineL5Target;
	
	MachineL3Target machineL3Target;
	BreakdownYearly breakdownYearly;

	int year;
	
	public BreakdownYearly getBreakdownYearly() {
		return breakdownYearly;
	}

	public void setBreakdownYearly(BreakdownYearly breakdownYearly) {
		this.breakdownYearly = breakdownYearly;
	}

	public PmActualGData getPmActualGData() {
		return pmActualGData;
	}

	public void setPmActualGData(PmActualGData pmActualGData) {
		this.pmActualGData = pmActualGData;
	}

	public PmTargetGData getPmTargetGData() {
		return pmTargetGData;
	}

	public void setPmTargetGData(PmTargetGData pmTargetGData) {
		this.pmTargetGData = pmTargetGData;
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

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	@Override
	public String toString() {
		return "PmScheduleGraphData [pmActualGData=" + pmActualGData + ", pmTargetGData=" + pmTargetGData
				+ ", machineL5Target=" + machineL5Target + ", machineL3Target=" + machineL3Target + "]";
	}
	
	
}
