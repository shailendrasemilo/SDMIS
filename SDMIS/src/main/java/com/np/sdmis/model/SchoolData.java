package com.np.sdmis.model;

import java.io.Serializable;

public class SchoolData implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String udiseCode;
	private String schoolName;
	private int schoolCategory;
	private int schoolManagementCenter;
	private int schoolManagementState;
	private int schoolType;
	private int classFrom;
	private int classTo;
	private String stateCode;
	private String stateName;
	private String districtName;
	private String blockName;
	private int locationType;
	private String headOfSchoolMobile;
	private String respondentMobile;
	private String alternateMobile;
	private String schoolEmail;

	public String getUdiseCode() {
		return udiseCode;
	}

	public void setUdiseCode(String udiseCode) {
		this.udiseCode = udiseCode;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public int getSchoolCategory() {
		return schoolCategory;
	}

	public void setSchoolCategory(int schoolCategory) {
		this.schoolCategory = schoolCategory;
	}

	public int getSchoolManagementCenter() {
		return schoolManagementCenter;
	}

	public void setSchoolManagementCenter(int schoolManagementCenter) {
		this.schoolManagementCenter = schoolManagementCenter;
	}

	public int getSchoolManagementState() {
		return schoolManagementState;
	}

	public void setSchoolManagementState(int schoolManagementState) {
		this.schoolManagementState = schoolManagementState;
	}

	public int getSchoolType() {
		return schoolType;
	}

	public void setSchoolType(int schoolType) {
		this.schoolType = schoolType;
	}

	public int getClassFrom() {
		return classFrom;
	}

	public void setClassFrom(int classFrom) {
		this.classFrom = classFrom;
	}

	public int getClassTo() {
		return classTo;
	}

	public void setClassTo(int classTo) {
		this.classTo = classTo;
	}

	public String getStateCode() {
		return stateCode;
	}

	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public String getDistrictName() {
		return districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}

	public String getBlockName() {
		return blockName;
	}

	public void setBlockName(String blockName) {
		this.blockName = blockName;
	}

	public int getLocationType() {
		return locationType;
	}

	public void setLocationType(int locationType) {
		this.locationType = locationType;
	}

	public String getHeadOfSchoolMobile() {
		return headOfSchoolMobile;
	}

	public void setHeadOfSchoolMobile(String headOfSchoolMobile) {
		this.headOfSchoolMobile = headOfSchoolMobile;
	}

	public String getRespondentMobile() {
		return respondentMobile;
	}

	public void setRespondentMobile(String respondentMobile) {
		this.respondentMobile = respondentMobile;
	}

	public String getAlternateMobile() {
		return alternateMobile;
	}

	public void setAlternateMobile(String alternateMobile) {
		this.alternateMobile = alternateMobile;
	}

	public String getSchoolEmail() {
		return schoolEmail;
	}

	public void setSchoolEmail(String schoolEmail) {
		this.schoolEmail = schoolEmail;
	}

	@Override
	public String toString() {
		return "SchoolData [udiseCode=" + udiseCode + ", schoolName=" + schoolName + ", schoolCategory="
				+ schoolCategory + ", schoolManagementCenter=" + schoolManagementCenter + ", schoolManagementState="
				+ schoolManagementState + ", schoolType=" + schoolType + ", classFrom=" + classFrom + ", classTo="
				+ classTo + ", stateCode=" + stateCode + ", stateName=" + stateName + ", districtName=" + districtName
				+ ", blockName=" + blockName + ", locationType=" + locationType + ", headOfSchoolMobile="
				+ headOfSchoolMobile + ", respondentMobile=" + respondentMobile + ", alternateMobile=" + alternateMobile
				+ ", schoolEmail=" + schoolEmail + "]";
	}

}
