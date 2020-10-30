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
@Table(name = "gis_block")
@NamedQueries({
		@NamedQuery(name = "BlockMaster.getBlock", query = "Select b from BlockMaster b where b.districtId = :districtId"), })
public class BlockMaster {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "block_id")
	private Long blockId;
	@Column(name = "district_id")
	private Long districtId;
	@Column(name = "block")
	private String blockName;
	@Column(name = "block_code")
	private String udiseBlockCode;

	public Long getBlockId() {
		return blockId;
	}

	public void setBlockId(Long blockId) {
		this.blockId = blockId;
	}

	public Long getDistrictId() {
		return districtId;
	}

	public void setDistrictId(Long districtId) {
		this.districtId = districtId;
	}

	public String getBlockName() {
		return blockName;
	}

	public void setBlockName(String blockName) {
		this.blockName = blockName;
	}

	public String getUdiseBlockCode() {
		return udiseBlockCode;
	}

	public void setUdiseBlockCode(String udiseBlockCode) {
		this.udiseBlockCode = udiseBlockCode;
	}

}
