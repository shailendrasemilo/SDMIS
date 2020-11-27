package com.np.sdmis.model;

import java.io.Serializable;
import java.util.Date;

public class StudentListData implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private long record;
	private String studentName;
	long studentId;
	long admNum;
	String gender;
	String className;
	String section;
	Date doa;
	String statusCode;
	String description;

	
	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDoa() {
		return doa;
	}

	public void setDoa(Date doa) {
		this.doa = doa;
	}

	public long getRecord() {
		return record;
	}

	public void setRecord(long record) {
		this.record = record;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public long getStudentId() {
		return studentId;
	}

	public void setStudentId(long studentId) {
		this.studentId = studentId;
	}

	public long getAdmNum() {
		return admNum;
	}

	public void setAdmNum(long admNum) {
		this.admNum = admNum;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

}
