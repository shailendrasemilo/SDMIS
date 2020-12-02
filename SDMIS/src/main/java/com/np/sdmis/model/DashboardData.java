package com.np.sdmis.model;

import java.util.List;

public class DashboardData {

	private int totalStudent;
	private int completeProfile;
	private int remainingProfile;
	private List<Integer> classesData;
	/*
	 * private long classI; private long classII; private long classIII; private
	 * long classIV; private long classV; private long classVI; private long
	 * classVII; private long classVIII; private long classIX; private long classX;
	 * private long classXI; private long classXII;
	 */
	private List<Integer> sectionWiseData;

	/*
	 * private long completeEducation; private long completeIncentive; private long
	 * completeVocational; private long completeResult;
	 */
	public long getTotalStudent() {
		return totalStudent;
	}

	public int getCompleteProfile() {
		return completeProfile;
	}

	public void setCompleteProfile(int completeProfile) {
		this.completeProfile = completeProfile;
	}

	public int getRemainingProfile() {
		return remainingProfile;
	}

	public void setRemainingProfile(int remainingProfile) {
		this.remainingProfile = remainingProfile;
	}

	public List<Integer> getClassesData() {
		return classesData;
	}

	public void setClassesData(List<Integer> classesData) {
		this.classesData = classesData;
	}

	public List<Integer> getSectionWiseData() {
		return sectionWiseData;
	}

	public void setSectionWiseData(List<Integer> sectionWiseData) {
		this.sectionWiseData = sectionWiseData;
	}

	public void setTotalStudent(int totalStudent) {
		this.totalStudent = totalStudent;
	}

}
