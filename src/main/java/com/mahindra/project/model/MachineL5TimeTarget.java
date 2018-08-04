package com.mahindra.project.model;

import java.io.Serializable;

public class MachineL5TimeTarget implements Serializable{

	private int id;
	
	private float year1lTarget;
	
	private float year2lTarget;
	
	private float year3lTarget;
	
	private float year4lTarget;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getYear1lTarget() {
		return year1lTarget;
	}

	public void setYear1lTarget(float year1lTarget) {
		this.year1lTarget = year1lTarget;
	}

	public float getYear2lTarget() {
		return year2lTarget;
	}

	public void setYear2lTarget(float year2lTarget) {
		this.year2lTarget = year2lTarget;
	}

	public float getYear3lTarget() {
		return year3lTarget;
	}

	public void setYear3lTarget(float year3lTarget) {
		this.year3lTarget = year3lTarget;
	}

	public float getYear4lTarget() {
		return year4lTarget;
	}

	public void setYear4lTarget(float year4lTarget) {
		this.year4lTarget = year4lTarget;
	}

	@Override
	public String toString() {
		return "MachineL5TimeTarget [id=" + id + ", year1lTarget=" + year1lTarget + ", year2lTarget=" + year2lTarget
				+ ", year3lTarget=" + year3lTarget + ", year4lTarget=" + year4lTarget + "]";
	}
	
	
}
