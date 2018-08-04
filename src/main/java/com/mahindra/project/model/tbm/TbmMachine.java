package com.mahindra.project.model.tbm;

public class TbmMachine {

    private int machineId;
	
	private String machineName;
	
	private String machineNo;
	
	private int delStatus;

	public int getMachineId() {
		return machineId;
	}

	public void setMachineId(int machineId) {
		this.machineId = machineId;
	}

	public String getMachineName() {
		return machineName;
	}

	public void setMachineName(String machineName) {
		this.machineName = machineName;
	}

	public String getMachineNo() {
		return machineNo;
	}

	public void setMachineNo(String machineNo) {
		this.machineNo = machineNo;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	@Override
	public String toString() {
		return "TbmMachine [machineId=" + machineId + ", machineName=" + machineName + ", machineNo=" + machineNo
				+ ", delStatus=" + delStatus + "]";
	}
	
	
}
