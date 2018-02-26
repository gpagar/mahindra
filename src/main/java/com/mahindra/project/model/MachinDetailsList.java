package com.mahindra.project.model;

import java.util.List;

public class MachinDetailsList {

	
	Info info;
	List<MachinDetails> machinDetailsList;
	public Info getInfo() {
		return info;
	}
	public void setInfo(Info info) {
		this.info = info;
	}
	public List<MachinDetails> getMachinDetailsList() {
		return machinDetailsList;
	}
	public void setMachinDetailsList(List<MachinDetails> machinDetailsList) {
		this.machinDetailsList = machinDetailsList;
	}
	@Override
	public String toString() {
		return "MachinDetailsList [info=" + info + ", machinDetailsList=" + machinDetailsList + "]";
	}
	
	
}
