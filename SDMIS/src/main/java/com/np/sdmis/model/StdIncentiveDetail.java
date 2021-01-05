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
@Table(name = "std_incentive_details")
public class StdIncentiveDetail implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name = "record_id")
	long recordId;
	@Column(name = "student_id")
	long studentId;
	@Column(name = "academic_year")
	String academicYear;
	@Column(name = "facility_cwsn")
	String facilityCWSN;
	@Column(name = "num_of_uniform_set")
	int uniformSet;
	@Column(name = "free_text_book")
	int textBook;
	@Column(name = "free_transport_facility")
	int transFacility;
	@Column(name = "free_escort_facility")
	int escortFacility;
	@Column(name = "free_bicycle")
	int bicycle;
	@Column(name = "free_hostal_facility")
	int hostalFacility;
	@Column(name = "special_training")
	String specialTraining;
	@Column(name = "created_by")
	String createdBy;
	@Column(name = "created_time")
	Date createdTime;
	@Column(name = "modified_by")
	String modifiedBy;
	@Column(name = "modified_time")
	Date modifiedTime;

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

	public String getAcademicYear() {
		return academicYear;
	}

	public void setAcademicYear(String academicYear) {
		this.academicYear = academicYear;
	}

	public String getFacilityCWSN() {
		return facilityCWSN;
	}

	public void setFacilityCWSN(String facilityCWSN) {
		this.facilityCWSN = facilityCWSN;
	}

	public int getUniformSet() {
		return uniformSet;
	}

	public void setUniformSet(int uniformSet) {
		this.uniformSet = uniformSet;
	}

	public int getTextBook() {
		return textBook;
	}

	public void setTextBook(int textBook) {
		this.textBook = textBook;
	}

	public int getTransFacility() {
		return transFacility;
	}

	public void setTransFacility(int transFacility) {
		this.transFacility = transFacility;
	}

	public int getEscortFacility() {
		return escortFacility;
	}

	public void setEscortFacility(int escortFacility) {
		this.escortFacility = escortFacility;
	}

	public int getBicycle() {
		return bicycle;
	}

	public void setBicycle(int bicycle) {
		this.bicycle = bicycle;
	}

	public int getHostalFacility() {
		return hostalFacility;
	}

	public void setHostalFacility(int hostalFacility) {
		this.hostalFacility = hostalFacility;
	}

	public String getSpecialTraining() {
		return specialTraining;
	}

	public void setSpecialTraining(String specialTraining) {
		this.specialTraining = specialTraining;
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
