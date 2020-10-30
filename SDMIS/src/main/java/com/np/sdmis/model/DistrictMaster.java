package com.np.sdmis.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "gis_district")
@NamedQueries({
		@NamedQuery(name = "DistrictMaster.getDistrict", query = "Select d from DistrictMaster d where d.stateId = :stateId"), })
public class DistrictMaster {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "district_id")
	private Long districtId;

	@Column(name = "state_id")
	private Long stateId;

	@Column(name = "district_name")
	private String districtName;
	@Column(name = "district_code")
	private String udiseDisCode;

	/*
	 * @ManyToOne(targetEntity = StateMaster.class, fetch = FetchType.LAZY)
	 * 
	 * @JoinColumn(name = "state_id", insertable = false, updatable = false)
	 * 
	 * @JsonIgnore private StateMaster stateMaster;
	 */

	public Long getDistrictId() {
		return districtId;
	}

	public void setDistrictId(Long districtId) {
		this.districtId = districtId;
	}

	public Long getStateId() {
		return stateId;
	}

	public void setStateId(Long stateId) {
		this.stateId = stateId;
	}

	public String getDistrictName() {
		return districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}

	public String getUdiseDisCode() {
		return udiseDisCode;
	}

	public void setUdiseDisCode(String udiseDisCode) {
		this.udiseDisCode = udiseDisCode;
	}

}
