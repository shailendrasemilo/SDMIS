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
@Table(name = "std_vocational_details")
public class StdVocationalDetail implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name = "record_id")
	long recordId;
	@Column(name = "student_id")
	long student_id;
	@Column(name = "academic_year")
	String academicYear;
	@Column(name = "trade")
	String trade;
	@Column(name = "job_role")
	String jobRole;
	@Column(name = "NSQF_level")
	int nsqfLevel;
	@Column(name = "student_opted_for")
	String stuOptedFor;
	@Column(name = "placement_status")
	int placementStatus;
	@Column(name = "salary_offered")
	long salaryOffered;
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

	public long getStudent_id() {
		return student_id;
	}

	public void setStudent_id(long student_id) {
		this.student_id = student_id;
	}

	public String getAcademicYear() {
		return academicYear;
	}

	public void setAcademicYear(String academicYear) {
		this.academicYear = academicYear;
	}

	public String getTrade() {
		return trade;
	}

	public void setTrade(String trade) {
		this.trade = trade;
	}

	public String getJobRole() {
		return jobRole;
	}

	public void setJobRole(String jobRole) {
		this.jobRole = jobRole;
	}

	public int getNsqfLevel() {
		return nsqfLevel;
	}

	public void setNsqfLevel(int nsqfLevel) {
		this.nsqfLevel = nsqfLevel;
	}

	public String getStuOptedFor() {
		return stuOptedFor;
	}

	public void setStuOptedFor(String stuOptedFor) {
		this.stuOptedFor = stuOptedFor;
	}

	public int getPlacementStatus() {
		return placementStatus;
	}

	public void setPlacementStatus(int placementStatus) {
		this.placementStatus = placementStatus;
	}

	public long getSalaryOffered() {
		return salaryOffered;
	}

	public void setSalaryOffered(long salaryOffered) {
		this.salaryOffered = salaryOffered;
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
