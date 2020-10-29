package com.np.sdmis.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "std_basic_details")
public class StudentBasicDetail implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2206188058166930986L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name = "record_id")
	long recordId;
	@Column(name = "student_id")
	long student_id;
	@Column(name = "admission_num")
	long admissionNum;
	@Column(name = "date_of_admission")
	Date doa;
	@Column(name = "aadhar_num")
	long aadharNum;
	@Column(name = "std_name")
	String name;
	@Column(name = "father_name")
	String fatherName;
	@Column(name = "mother_name")
	String motherName;
	@Column(name = "gender")
	String gender;
	@Column(name = "social_category")
	long socialCategory;
	@Column(name = "religion")
	long religion;
	@Column(name = "mother_tongue")
	long motherTongue;
	@Column(name = "child_homeless")
	long childHomeless;
	@Column(name = "state_id")
	long stateId;
	@Column(name = "district_id")
	long districtId;
	@Column(name = "city_id")
	long cityId;
	@Column(name = "locality_id")
	long localityId;
	@Column(name = "belong_bpl")
	long belongBPL;
	@Column(name = "disadvantage_group")
	long disadvantageGroup;
	@Column(name = "type_of_disability")
	long disabilityType;
	@Column(name = "status")
	String status;
	@Column(name = "created_by")
	String createdBy;
	@Column(name = "created_time")
	Date createdTime;
	@Column(name = "modified_by")
	String modifiedBy;
	@Column(name = "modified_time")
	Date modifiedTime;
	@Column(name = "date_of_birth")
	Date dob;

	public long getRecordId() {
		return recordId;
	}

	public void setRecordId(long recordId) {
		this.recordId = recordId;
	}

	public long getStudent_id() {
		return student_id;
	}

	public void setStudent_id(long student_id) {
		this.student_id = student_id;
	}

	public long getAdmissionNum() {
		return admissionNum;
	}

	public void setAdmissionNum(long admissionNum) {
		this.admissionNum = admissionNum;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public Date getDoa() {
		return doa;
	}

	public void setDoa(Date doa) {
		this.doa = doa;
	}

	public long getAadharNum() {
		return aadharNum;
	}

	public void setAadharNum(long aadharNum) {
		this.aadharNum = aadharNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public String getMotherName() {
		return motherName;
	}

	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public long getSocialCategory() {
		return socialCategory;
	}

	public void setSocialCategory(long socialCategory) {
		this.socialCategory = socialCategory;
	}

	public long getReligion() {
		return religion;
	}

	public void setReligion(long religion) {
		this.religion = religion;
	}

	public long getMotherTongue() {
		return motherTongue;
	}

	public void setMotherTongue(long motherTongue) {
		this.motherTongue = motherTongue;
	}

	public long getChildHomeless() {
		return childHomeless;
	}

	public void setChildHomeless(long childHomeless) {
		this.childHomeless = childHomeless;
	}

	public long getStateId() {
		return stateId;
	}

	public void setStateId(long stateId) {
		this.stateId = stateId;
	}

	public long getDistrictId() {
		return districtId;
	}

	public void setDistrictId(long districtId) {
		this.districtId = districtId;
	}

	public long getCityId() {
		return cityId;
	}

	public void setCityId(long cityId) {
		this.cityId = cityId;
	}

	public long getLocalityId() {
		return localityId;
	}

	public void setLocalityId(long localityId) {
		this.localityId = localityId;
	}

	public long getBelongBPL() {
		return belongBPL;
	}

	public void setBelongBPL(long belongBPL) {
		this.belongBPL = belongBPL;
	}

	public long getDisadvantageGroup() {
		return disadvantageGroup;
	}

	public void setDisadvantageGroup(long disadvantageGroup) {
		this.disadvantageGroup = disadvantageGroup;
	}

	public long getDisabilityType() {
		return disabilityType;
	}

	public void setDisabilityType(long disabilityType) {
		this.disabilityType = disabilityType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public Date getModifiedTime() {
		return modifiedTime;
	}

	public void setModifiedTime(Date modifiedTime) {
		this.modifiedTime = modifiedTime;
	}

}
