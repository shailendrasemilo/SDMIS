package com.np.sdmis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.np.sdmis.constant.ResponceCode;
import com.np.sdmis.dto.RequestDTO;
import com.np.sdmis.dto.ResponseDTO;
import com.np.sdmis.model.MasterConfig;
import com.np.sdmis.model.MstClassSection;
import com.np.sdmis.repository.MasterConfigRepo;
import com.np.sdmis.repository.MstClassSectionRepo;

@Service
public class MasterDataService {

	@Autowired
	MstClassSectionRepo mstClassSectionRepo;
	@Autowired
	MasterConfigRepo masterConfigRepo;

	public ResponseDTO getClassSection(long schoolId, String className) {
		ResponseDTO responseDTO = new ResponseDTO();

		List<MstClassSection> mstClassSections = mstClassSectionRepo.findBySchoolIdAndClassName(schoolId, className);
		if (null != mstClassSections && mstClassSections.size() > 0) {
			responseDTO.setMstClassSections(mstClassSections);
			responseDTO.setStatusCode(ResponceCode.App001.getStatusCode());
			responseDTO.setDescription(ResponceCode.App001.getStatusDesc());
		} else {
			responseDTO.setStatusCode(ResponceCode.App003.getStatusCode());
			responseDTO.setDescription(ResponceCode.App003.getStatusDesc());
		}
		return responseDTO;
	}

	public ResponseDTO saveClassSection(RequestDTO requestDTO) {
		ResponseDTO responseDTO = new ResponseDTO();
		MstClassSection mstClassSection = mstClassSectionRepo.save(requestDTO.getMstClassSection());
		if (null != mstClassSection) {
			responseDTO.setStatusCode(ResponceCode.App001.getStatusCode());
			responseDTO.setDescription(ResponceCode.App001.getStatusDesc());
		} else {
			responseDTO.setStatusCode(ResponceCode.App002.getStatusCode());
			responseDTO.setDescription(ResponceCode.App002.getStatusDesc());
		}
		return responseDTO;
	}

	public ResponseDTO saveMasterConfig(RequestDTO requestDTO) {
		ResponseDTO responseDTO = new ResponseDTO();
		MasterConfig masterConfig = masterConfigRepo.save(requestDTO.getMasterConfig());
		if (null != masterConfig) {
			responseDTO.setStatusCode(ResponceCode.App001.getStatusCode());
			responseDTO.setDescription(ResponceCode.App001.getStatusDesc());
		} else {
			responseDTO.setStatusCode(ResponceCode.App002.getStatusCode());
			responseDTO.setDescription(ResponceCode.App002.getStatusDesc());
		}
		return responseDTO;
	}

	public ResponseDTO getMasterConfig(String stateCode) {

		ResponseDTO responseDTO = new ResponseDTO();

		MasterConfig masterConfig = masterConfigRepo.findByStateCode(stateCode);
		if (null != masterConfig) {
			responseDTO.setMasterConfig(masterConfig);
			responseDTO.setStatusCode(ResponceCode.App001.getStatusCode());
			responseDTO.setDescription(ResponceCode.App001.getStatusDesc());
		} else {
			responseDTO.setStatusCode(ResponceCode.App003.getStatusCode());
			responseDTO.setDescription(ResponceCode.App003.getStatusDesc());
		}
		return responseDTO;

	}

}
