package com.mahindra.project.model.cbm;

import java.io.Serializable;
import java.util.Date;

public class BallBarTest implements Serializable{

	private int bbtId;

	private String machineNo; 
	
	private String machineName;
	
	private String line;
	
	private String remark;
	
	private String date;
	
	private int extra1;
	
	private int extra2;
	
	private String file;
	
	private String varchar1;
	
	private String varchar2;
	
	private int status;
	
	private String yearEnd;
	
	private int schId;
	
	private int deptId;

	
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public int getBbtId() {
		return bbtId;
	}

	public void setBbtId(int bbtId) {
		this.bbtId = bbtId;
	}

	public String getMachineNo() {
		return machineNo;
	}

	public void setMachineNo(String machineNo) {
		this.machineNo = machineNo;
	}

	public String getMachineName() {
		return machineName;
	}

	public void setMachineName(String machineName) {
		this.machineName = machineName;
	}

	public String getLine() {
		return line;
	}

	public void setLine(String line) {
		this.line = line;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getExtra1() {
		return extra1;
	}

	public void setExtra1(int extra1) {
		this.extra1 = extra1;
	}

	public int getExtra2() {
		return extra2;
	}

	public void setExtra2(int extra2) {
		this.extra2 = extra2;
	}

	public String getVarchar1() {
		return varchar1;
	}

	public void setVarchar1(String varchar1) {
		this.varchar1 = varchar1;
	}

	public String getVarchar2() {
		return varchar2;
	}

	public void setVarchar2(String varchar2) {
		this.varchar2 = varchar2;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getYearEnd() {
		return yearEnd;
	}

	public void setYearEnd(String yearEnd) {
		this.yearEnd = yearEnd;
	}

	public int getSchId() {
		return schId;
	}

	public void setSchId(int schId) {
		this.schId = schId;
	}

	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	@Override
	public String toString() {
		return "BallBarTest [bbtId=" + bbtId + ", machineNo=" + machineNo + ", machineName=" + machineName + ", line="
				+ line + ", remark=" + remark + ", date=" + date + ", extra1=" + extra1 + ", extra2=" + extra2
				+ ", varchar1=" + varchar1 + ", varchar2=" + varchar2 + ", status=" + status + ", yearEnd=" + yearEnd
				+ ", schId=" + schId + ", deptId=" + deptId + "]";
	}

	
}
