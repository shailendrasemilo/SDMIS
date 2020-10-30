package com.np.sdmis.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "gis_state")
public class StateMaster {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "state_id")
	private Long id;
	@Column(name = "state_name")
	private String stateName;
	@Column(name = "state_code")
	private String udiseStateCode;

	@Column(name = "status")
	private String status;

	/*
	 * @OneToMany(targetEntity = DistrictMaster.class, mappedBy = "stateMaster",
	 * fetch = FetchType.LAZY) private List<DistrictMaster> districts;
	 */

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public String getUdiseStateCode() {
		return udiseStateCode;
	}

	public void setUdiseStateCode(String udiseStateCode) {
		this.udiseStateCode = udiseStateCode;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
