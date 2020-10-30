package com.np.sdmis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.np.sdmis.model.BlockMaster;
import com.np.sdmis.model.DistrictMaster;
import com.np.sdmis.model.StateMaster;
import com.np.sdmis.repository.BlockRepository;
import com.np.sdmis.repository.DistrictRepository;
import com.np.sdmis.repository.StateRepository;

@Service
public class LocationServiceImpl {

	@Autowired
	StateRepository stateRepository;

	@Autowired
	DistrictRepository districtRepository;

	@Autowired
	BlockRepository blockRepository;

	public List<StateMaster> getState() {

		return stateRepository.findAll();
	}

	public StateMaster findById(long id) {
		return stateRepository.findById(id);
	}

	public List<DistrictMaster> getDistrict(int stateId) {
		return districtRepository.getDistrict(stateId);
	}

	public List<BlockMaster> getBlock(int districtId) {
		return blockRepository.getBlock(districtId);
	}
}
