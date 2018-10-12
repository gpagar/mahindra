package com.mahindra.project.model;
 

public class LearningLibrary {
	 
	private int fileId; 
	private String fileName; 
	private String date; 
	private String fileDesc; 
	private int delStatus; 
	private String varchar1; 
	private String varchar2;
	
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getFileDesc() {
		return fileDesc;
	}
	public void setFileDesc(String fileDesc) {
		this.fileDesc = fileDesc;
	}
	public int getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
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
	@Override
	public String toString() {
		return "LearningLibrary [fileId=" + fileId + ", fileName=" + fileName + ", date=" + date + ", fileDesc="
				+ fileDesc + ", delStatus=" + delStatus + ", varchar1=" + varchar1 + ", varchar2=" + varchar2 + "]";
	}
	
	

}
