package com.np.sdmis.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.np.sdmis.constant.ResponceCode;
import com.np.sdmis.dto.RequestDTO;
import com.np.sdmis.dto.ResponseDTO;
import com.np.sdmis.model.StudentBasicDetail;
import com.np.sdmis.repository.StdEducationDetailRepo;
import com.np.sdmis.repository.StdIncentiveDetailRepo;
import com.np.sdmis.repository.StdSectionClassMappingRepo;
import com.np.sdmis.repository.StdVocationalDetailRepo;
import com.np.sdmis.repository.StudentBasicDetailRepo;
import com.np.sdmis.repository.StudentResultDetailRepo;

@Service
public class StudentServiceImpl {

	@Autowired
	StudentBasicDetailRepo basicDetailRepo;
	@Autowired
	StdSectionClassMappingRepo sectionClassRepo;
	@Autowired
	StdEducationDetailRepo educationDetailRepo;

	@Autowired
	StudentResultDetailRepo resultDetailRepo;
	@Autowired
	StdIncentiveDetailRepo incentiveDetailRepo;
	@Autowired
	StdVocationalDetailRepo vocationalDetailRepo;

	public ResponseDTO saveStudentBasicDetail(RequestDTO requestDTO) {
		ResponseDTO responceDto = new ResponseDTO();
		StudentBasicDetail studentBasicDetail = basicDetailRepo.save(requestDTO.getStudentBasicDetail());
		if (null != studentBasicDetail) {
			responceDto.setStudentBasicDetail(studentBasicDetail);
			requestDTO.getClassMapping().setStudentId(studentBasicDetail.getRecordId());
			sectionClassRepo.save(requestDTO.getClassMapping());
			responceDto.setStatusCode(ResponceCode.App001.getStatusCode());
			responceDto.setDescription(ResponceCode.App001.getStatusDesc());
		}
		return responceDto;
	}

	public ResponseDTO saveEducationDetail(RequestDTO requestDTO) {
		ResponseDTO responceDto = new ResponseDTO();
		educationDetailRepo.save(requestDTO.getEducationDetail());
		responceDto.setStatusCode(ResponceCode.App001.getStatusCode());
		responceDto.setDescription(ResponceCode.App001.getStatusDesc());
		return responceDto;
	}

	public ResponseDTO saveSectionClassMap(RequestDTO requestDTO) {
		ResponseDTO responceDto = new ResponseDTO();
		responceDto.setSectionClassMapping(Optional.ofNullable(sectionClassRepo.save(requestDTO.getClassMapping())));
		responceDto.setStatusCode(ResponceCode.App001.getStatusCode());
		responceDto.setDescription(ResponceCode.App001.getStatusDesc());

		return responceDto;
	}

	public ResponseDTO getStdSectionClass(long studentId)

	{
		ResponseDTO responceDto = new ResponseDTO();
		responceDto.setSectionClassMapping(sectionClassRepo.findById(studentId));
		responceDto.setStatusCode(ResponceCode.App001.getStatusCode());
		responceDto.setDescription(ResponceCode.App001.getStatusDesc());
		return responceDto;
	}

	public ResponseDTO saveResultDetail(RequestDTO requestDTO) {
		ResponseDTO responceDto = new ResponseDTO();
		resultDetailRepo.save(requestDTO.getResultDetail());
		responceDto.setStatusCode(ResponceCode.App001.getStatusCode());
		responceDto.setDescription(ResponceCode.App001.getStatusDesc());
		return responceDto;
	}

	public ResponseDTO saveIncentiveDetail(RequestDTO requestDTO) {
		ResponseDTO responceDto = new ResponseDTO();
		incentiveDetailRepo.save(requestDTO.getIncentiveDetail());
		responceDto.setStatusCode(ResponceCode.App001.getStatusCode());
		responceDto.setDescription(ResponceCode.App001.getStatusDesc());
		return responceDto;
	}

	public ResponseDTO saveVocationalDetail(RequestDTO requestDTO) {
		ResponseDTO responceDto = new ResponseDTO();
		vocationalDetailRepo.save(requestDTO.getVocationalDetail());
		responceDto.setStatusCode(ResponceCode.App001.getStatusCode());
		responceDto.setDescription(ResponceCode.App001.getStatusDesc());
		return responceDto;
	}

}
