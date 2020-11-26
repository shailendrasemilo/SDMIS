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
@Table(name = "std_result_details")
public class StudentResultDetail implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name = "record_id")
	long recordId;
	@Column(name = "student_id")
	long studentId;
	@Column(name = "academic_year")
	String academicYear;
	@Column(name = "last_result")
	long lastResult;
	@Column(name = "mark_obtain")
	long markObtain;
	@Column(name = "schooling_status")
	String schoolingStatus;
	@Column(name = "stream")
	String stream;
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

	public long getLastResult() {
		return lastResult;
	}

	public void setLastResult(long lastResult) {
		this.lastResult = lastResult;
	}

	public long getMarkObtain() {
		return markObtain;
	}

	public void setMarkObtain(long markObtain) {
		this.markObtain = markObtain;
	}

	public String getSchoolingStatus() {
		return schoolingStatus;
	}

	public void setSchoolingStatus(String schoolingStatus) {
		this.schoolingStatus = schoolingStatus;
	}

	public String getStream() {
		return stream;
	}

	public void setStream(String stream) {
		this.stream = stream;
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
