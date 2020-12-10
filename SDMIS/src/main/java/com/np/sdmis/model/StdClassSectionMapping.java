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
@Table(name = "std_class_section_mapping")
public class StdClassSectionMapping implements Serializable {
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
	@Column(name = "section")
	String section;
	@Column(name = "class_name")
	String className;
	@Column(name = "status")
	String status;
	@Column(name = "created_by")
	String createdBy;
	@Column(name = "created_time")
	Date createdTime;

	@Column(name = "mst_cls_sec_id")
	long mstClsSecId;
	@Column(name = "udise_code")
	String udiseCode;
	@Column(name = "state_code")
	String stateCode;
	@Column(name = "district_code")
	String districtCode;
	@Column(name = "block_code")
	String blockCode;

	public long getMstClsSecId() {
		return mstClsSecId;
	}

	public void setMstClsSecId(long mstClsSecId) {
		this.mstClsSecId = mstClsSecId;
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

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
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

}
