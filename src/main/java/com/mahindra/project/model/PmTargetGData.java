package com.mahindra.project.model;

import java.io.Serializable;


public class PmTargetGData implements Serializable{
	
	private int id;
	
	private float aprTarget;
	
	private float mayTarget;
	
	private float juneTarget;
	
	private float julyTarget;
	
	private float augTarget;
	
	private float septTarget;
	
	private float octTarget;
	
	private float novTarget;
	
	private float decTarget;
	
	private float janTarget;
	
	private float febTarget;
	
	private float marchTarget;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getAprTarget() {
		return aprTarget;
	}

	public void setAprTarget(float aprTarget) {
		this.aprTarget = aprTarget;
	}

	public float getMayTarget() {
		return mayTarget;
	}

	public void setMayTarget(float mayTarget) {
		this.mayTarget = mayTarget;
	}

	public float getJuneTarget() {
		return juneTarget;
	}

	public void setJuneTarget(float juneTarget) {
		this.juneTarget = juneTarget;
	}

	public float getJulyTarget() {
		return julyTarget;
	}

	public void setJulyTarget(float julyTarget) {
		this.julyTarget = julyTarget;
	}

	public float getAugTarget() {
		return augTarget;
	}

	public void setAugTarget(float augTarget) {
		this.augTarget = augTarget;
	}

	public float getSeptTarget() {
		return septTarget;
	}

	public void setSeptTarget(float septTarget) {
		this.septTarget = septTarget;
	}

	public float getOctTarget() {
		return octTarget;
	}

	public void setOctTarget(float octTarget) {
		this.octTarget = octTarget;
	}

	public float getNovTarget() {
		return novTarget;
	}

	public void setNovTarget(float novTarget) {
		this.novTarget = novTarget;
	}

	public float getDecTarget() {
		return decTarget;
	}

	public void setDecTarget(float decTarget) {
		this.decTarget = decTarget;
	}

	public float getJanTarget() {
		return janTarget;
	}

	public void setJanTarget(float janTarget) {
		this.janTarget = janTarget;
	}

	public float getFebTarget() {
		return febTarget;
	}

	public void setFebTarget(float febTarget) {
		this.febTarget = febTarget;
	}

	public float getMarchTarget() {
		return marchTarget;
	}

	public void setMarchTarget(float marchTarget) {
		this.marchTarget = marchTarget;
	}

	@Override
	public String toString() {
		return "PmTargetGData [id=" + id + ", aprTarget=" + aprTarget + ", mayTarget=" + mayTarget + ", juneTarget="
				+ juneTarget + ", julyTarget=" + julyTarget + ", augTarget=" + augTarget + ", septTarget=" + septTarget
				+ ", octTarget=" + octTarget + ", novTarget=" + novTarget + ", decTarget=" + decTarget + ", janTarget="
				+ janTarget + ", febTarget=" + febTarget + ", marchTarget=" + marchTarget + "]";
	}
    
	

}
