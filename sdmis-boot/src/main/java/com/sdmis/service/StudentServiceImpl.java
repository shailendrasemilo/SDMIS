package com.sdmis.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sdmis.constant.ResponceCode;
import com.sdmis.dto.ResponseDTO;
import com.sdmis.model.StudentBasicDetail;
import com.sdmis.repository.StudentBasicDetailRepo;

@Service
public class StudentServiceImpl {

	@Autowired
	StudentBasicDetailRepo basicDetailRepo;

	public ResponseDTO saveStudentBasicDetail(StudentBasicDetail studentBasicDetail) {
		ResponseDTO responceDto = new ResponseDTO();
		basicDetailRepo.save(studentBasicDetail);
		responceDto.setStatusCode(ResponceCode.App001.getStatusCode());
		responceDto.setDescription(ResponceCode.App001.getStatusDesc());
		return responceDto;
	}

}
