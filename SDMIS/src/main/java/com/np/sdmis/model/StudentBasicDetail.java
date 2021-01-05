package com.np.sdmis.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@NamedQueries({
		@NamedQuery(name = "StudentBasicDetail.getStudentList", query = "Select s from StudentBasicDetail s where s.status = :search"), })
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
	long studentId;
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
	String stateId;
	@Column(name = "district_id")
	String districtId;
	@Column(name = "city_id")
	String cityId;
	@Column(name = "locality_id")
	String localityId;
	@Column(name = "belong_bpl")
	long belongBPL;
	@Column(name = "disadvantage_group")
	long disadvantageGroup;
	@Column(name = "type_of_disability")
	String disabilityType;
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
	@Column(name = "class_section_id")
	long classSectionId;
	@Column(name = "udise_code")
	String udiseCode;
	@Column(name = "state_code")
	String stateCode;
	@Column(name = "district_code")
	String districtCode;
	@Column(name = "block_code")
	String blockCode;
	@Column(name = "category_id")
	long categoryId;
	@Column(name = "management_id")
	long managementId;
	@Column(name = "edu_type")
	long eduType;
	@Column(name = "locality")
	String locality;

	public long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
	}

	public long getManagementId() {
		return managementId;
	}

	public void setManagementId(long managementId) {
		this.managementId = managementId;
	}

	public long getEduType() {
		return eduType;
	}

	public void setEduType(long eduType) {
		this.eduType = eduType;
	}

	public String getUdiseCode() {
		return udiseCode;
	}

	public void setUdiseCode(String udiseCode) {
		this.udiseCode = udiseCode;
	}

	public String getStateCode() {
		return stateCode;
	}

	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}

	public String getDistrictCode() {
		return districtCode;
	}

	public void setDistrictCode(String districtCode) {
		this.districtCode = districtCode;
	}

	public String getBlockCode() {
		return blockCode;
	}

	public void setBlockCode(String blockCode) {
		this.blockCode = blockCode;
	}

	public long getClassSectionId() {
		return classSectionId;
	}

	public void setClassSectionId(long classSectionId) {
		this.classSectionId = classSectionId;
	}

	public long getRecordId() {
		return recordId;
	}

	public void setRecordId(long recordId) {
		this.recordId = recordId;
	}

	public long getStudentId() {
		return studentId;
	}

	public void setStudentId(long studentId) {
		this.studentId = studentId;
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

	public String getStateId() {
		return stateId;
	}

	public void setStateId(String stateId) {
		this.stateId = stateId;
	}

	public String getDistrictId() {
		return districtId;
	}

	public void setDistrictId(String districtId) {
		this.districtId = districtId;
	}

	public String getCityId() {
		return cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

	public String getLocalityId() {
		return localityId;
	}

	public void setLocalityId(String localityId) {
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

	public String getDisabilityType() {
		return disabilityType;
	}

	public void setDisabilityType(String disabilityType) {
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

	public String getLocality() {
		return locality;
	}

	public void setLocality(String locality) {
		this.locality = locality;
	}

}
