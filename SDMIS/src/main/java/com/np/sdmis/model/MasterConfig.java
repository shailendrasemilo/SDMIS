package com.np.sdmis.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "master_config")

public class MasterConfig {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "record_id")
	private Long recordId;
	@Column(name = "state_code")
	private String stateCode;
	@Column(name = "config_type")
	private String configType;
	@Column(name = "district_level")
	boolean districtLevel;
	@Column(name = "block_level")
	boolean blockLevel;
	@Column(name = "school_level")
	boolean schoolLevel;
	@Column(name = "status")
	private String status;
	@Column(name = "created_by")
	private String createdBy;
	@Column(name = "created_time")
	private Date createdTime;
	@Column(name = "modified_by")
	private String modifiedBy;
	@Column(name = "modified_time")
	private Date modifiedTime;

	public Long getRecordId() {
		return recordId;
	}

	public void setRecordId(Long recordId) {
		this.recordId = recordId;
	}

	public String getStateCode() {
		return stateCode;
	}

	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}

	public String getConfigType() {
		return configType;
	}

	public void setConfigType(String configType) {
		this.configType = configType;
	}

	public boolean isDistrictLevel() {
		return districtLevel;
	}

	public void setDistrictLevel(boolean districtLevel) {
		this.districtLevel = districtLevel;
	}

	public boolean isBlockLevel() {
		return blockLevel;
	}

	public void setBlockLevel(boolean blockLevel) {
		this.blockLevel = blockLevel;
	}

	public boolean isSchoolLevel() {
		return schoolLevel;
	}

	public void setSchoolLevel(boolean schoolLevel) {
		this.schoolLevel = schoolLevel;
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
