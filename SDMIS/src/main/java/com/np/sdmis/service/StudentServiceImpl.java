package com.np.sdmis.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.np.sdmis.constant.ResponceCode;
import com.np.sdmis.dto.RequestDTO;
import com.np.sdmis.dto.ResponseDTO;
import com.np.sdmis.model.StudentBasicDetail;
import com.np.sdmis.repository.StdSectionClassMappingRepo;
import com.np.sdmis.repository.StudentBasicDetailRepo;

@Service
public class StudentServiceImpl {

	@Autowired
	StudentBasicDetailRepo basicDetailRepo;
	@Autowired
	StdSectionClassMappingRepo sectionClassRepo;

	public ResponseDTO saveStudentBasicDetail(RequestDTO requestDTO) {
		ResponseDTO responceDto = new ResponseDTO();
		StudentBasicDetail studentBasicDetail = basicDetailRepo.save(requestDTO.getStudentBasicDetail());
		if (null != studentBasicDetail) {
			requestDTO.getClassMapping().setStudentId(studentBasicDetail.getRecordId());
			sectionClassRepo.save(requestDTO.getClassMapping());
			responceDto.setStatusCode(ResponceCode.App001.getStatusCode());
			responceDto.setDescription(ResponceCode.App001.getStatusDesc());
		}
		return responceDto;
	}

}
