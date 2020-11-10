package com.np.sdmis.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "mst_moi")
public class MOI {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "record_id")
	private Long recordId;
	@Column(name = "moi")
	String moi;

	public Long getRecordId() {
		return recordId;
	}

	public void setRecordId(Long recordId) {
		this.recordId = recordId;
	}

	public String getMoi() {
		return moi;
	}

	public void setMoi(String moi) {
		this.moi = moi;
	}

}
