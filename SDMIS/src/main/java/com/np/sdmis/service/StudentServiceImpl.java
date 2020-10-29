package com.np.sdmis.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.np.sdmis.constant.ResponceCode;
import com.np.sdmis.dto.ResponseDTO;
import com.np.sdmis.model.StudentBasicDetail;
import com.np.sdmis.repository.StudentBasicDetailRepo;



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
