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
@Table(name = "std_education_details")
public class StdEducationDetail implements Serializable {

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
	@Column(name = "free_edu")
	String freeEdu;
	@Column(name = "study_in_class")
	String studyInClass;
	@Column(name = "class_prev_year")
	String classPrevYear;
	@Column(name = "class_attend")
	long classAttend;
	@Column(name = "moi")
	String moi;
	@Column(name = "academic_year")
	long academicYear;
	@Column(name = "created_by")
	String createdBy;
	@Column(name = "created_time")
	Date createdTime;
	@Column(name = "modified_by")
	String modifiedBy;
	@Column(name = "modified_time")
	Date modifiedTime;
	@Column(name = "status_prev")
	String statusPrev;

	public String getStatusPrev() {
		return statusPrev;
	}

	public void setStatusPrev(String statusPrev) {
		this.statusPrev = statusPrev;
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

	public String getFreeEdu() {
		return freeEdu;
	}

	public void setFreeEdu(String freeEdu) {
		this.freeEdu = freeEdu;
	}

	public String getStudyInClass() {
		return studyInClass;
	}

	public void setStudyInClass(String studyInClass) {
		this.studyInClass = studyInClass;
	}

	public String getClassPrevYear() {
		return classPrevYear;
	}

	public void setClassPrevYear(String classPrevYear) {
		this.classPrevYear = classPrevYear;
	}

	public long getClassAttend() {
		return classAttend;
	}

	public void setClassAttend(long classAttend) {
		this.classAttend = classAttend;
	}

	public String getMoi() {
		return moi;
	}

	public void setMoi(String moi) {
		this.moi = moi;
	}

	public long getAcademicYear() {
		return academicYear;
	}

	public void setAcademicYear(long academicYear) {
		this.academicYear = academicYear;
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
