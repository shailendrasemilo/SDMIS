package com.np.sdmis.service;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.np.sdmis.constant.ResponceCode;
import com.np.sdmis.dto.RequestDTO;
import com.np.sdmis.dto.ResponseDTO;
import com.np.sdmis.model.StdClassSectionMapping;
import com.np.sdmis.model.StdEducationDetail;
import com.np.sdmis.model.StdIncentiveDetail;
import com.np.sdmis.model.StdVocationalDetail;
import com.np.sdmis.model.StudentBasicDetail;
import com.np.sdmis.model.StudentListData;
import com.np.sdmis.model.StudentResultDetail;
import com.np.sdmis.repository.StdClassSectionMappingRepo;
import com.np.sdmis.repository.StdEducationDetailRepo;
import com.np.sdmis.repository.StdIncentiveDetailRepo;
import com.np.sdmis.repository.StdVocationalDetailRepo;
import com.np.sdmis.repository.StudentBasicDetailRepo;
import com.np.sdmis.repository.StudentResultDetailRepo;

@Service
public class StudentServiceImpl {

	@Autowired
	StudentBasicDetailRepo basicDetailRepo;
	@Autowired
	StdClassSectionMappingRepo sectionClassRepo;
	@Autowired
	StdEducationDetailRepo educationDetailRepo;

	@Autowired
	StudentResultDetailRepo resultDetailRepo;
	@Autowired
	StdIncentiveDetailRepo incentiveDetailRepo;
	@Autowired
	StdVocationalDetailRepo vocationalDetailRepo;
	@Autowired
	EntityManagerFactory emf;

	public ResponseDTO getStudentList(String className, String section, String udiseCode) {
		ResponseDTO responseDTO = new ResponseDTO();
		EntityManager em = null;
		try {
			em = emf.createEntityManager();

			em.getTransaction().begin();
			String qq = "Select"
					+ " new com.np.sdmis.model.StudentListData(s.recordId as record,s.name as studentName,s.studentId as studentId,s.admissionNum as admNum,s.gender as gender,s.doa as doa,"
					+ "c.className as className ,c.section as section)" + " from StdClassSectionMapping  c "
					+ "inner join StudentBasicDetail s on s.recordId = c.studentId where c.status='A' and c.udiseCode=:udiseCode";
			System.out.println("class name:: " + className);
			String qqq = null;
			if (null != className) {
				qqq = qq + " and c.className=:className";
			}
			String qqqq = null;
			if (null != section) {
				qqqq = qqq + " or c.section=:section";
			}
			qq.concat(" group by c.className,c.section order by c.className");
			System.out.println(qqqq);
			Query query = em.createQuery(qqqq);
			query.setParameter("udiseCode", udiseCode);
			if (null != className) {
				query.setParameter("className", className);
			}
			if (null != section) {
				query.setParameter("section", section);
			}
			@SuppressWarnings("unchecked")
			List<StudentListData> list = (List<StudentListData>) query.getResultList();
			if (null != list && list.size() > 0) {
				responseDTO.setStudentListDatas(list);
				responseDTO.setStatusCode(ResponceCode.App001.getStatusCode());
				responseDTO.setDescription(ResponceCode.App001.getStatusDesc());
			} else {
				responseDTO.setStatusCode(ResponceCode.App003.getStatusCode());
				responseDTO.setDescription(ResponceCode.App003.getStatusDesc());
			}
			em.close();
		} catch (Exception ex) {
			ex.printStackTrace();
			em.close();
		}
		System.out.println("Student Name :");

		return responseDTO;

	}

	public ResponseDTO saveStudentBasicDetail(RequestDTO requestDTO) {
		ResponseDTO responceDto = new ResponseDTO();
		StudentBasicDetail studentBasicDetail = basicDetailRepo.save(requestDTO.getStudentBasicDetail());
		if (null != studentBasicDetail) {
			requestDTO.getClassMapping().setStudentId(studentBasicDetail.getRecordId());
			StdClassSectionMapping classSectionObj = sectionClassRepo.save(requestDTO.getClassMapping());
			studentBasicDetail.setClassSectionId(classSectionObj.getRecordId());
			basicDetailRepo.save(studentBasicDetail);
			responceDto.setStudentBasicDetail(Optional.ofNullable(studentBasicDetail));
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

	public ResponseDTO saveClassSection(RequestDTO requestDTO) {
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

	public ResponseDTO viewStubasicDetail(long studentId, String udiseCode) {
		// TODO Auto-generated method stub
		ResponseDTO responseDTO = new ResponseDTO();
		StdClassSectionMapping classSectionMapping = sectionClassRepo.findByStudentIdAndUdiseCodeAndStatus(studentId,
				udiseCode, "A");
		if (null != classSectionMapping) {
			Optional<StudentBasicDetail> basicDetail = basicDetailRepo.findById(studentId);
			responseDTO.setSectionClassMapping(Optional.ofNullable(classSectionMapping));
			responseDTO.setStudentBasicDetail(basicDetail);
			responseDTO.setStatusCode(ResponceCode.App001.getStatusCode());
			responseDTO.setDescription(ResponceCode.App001.getStatusDesc());
		}
		return responseDTO;
	}

	public ResponseDTO viewEducationDetail(long studentId, long schoolId) {
		// TODO Auto-generated method stub
		ResponseDTO responseDTO = new ResponseDTO();
		StdEducationDetail educationDetail = educationDetailRepo.findByStudentId(studentId);
		responseDTO.setEducationDetail(educationDetail);
		responseDTO.setStatusCode(ResponceCode.App001.getStatusCode());
		responseDTO.setDescription(ResponceCode.App001.getStatusDesc());
		return responseDTO;
	}

	public ResponseDTO viewResultDetail(long studentId, long schoolId) {
		// TODO Auto-generated method stub
		ResponseDTO responseDTO = new ResponseDTO();
		StudentResultDetail resultDetail = resultDetailRepo.findByStudentId(studentId);
		responseDTO.setResultDetail(resultDetail);
		responseDTO.setStatusCode(ResponceCode.App001.getStatusCode());
		responseDTO.setDescription(ResponceCode.App001.getStatusDesc());
		return responseDTO;
	}

	public ResponseDTO viewIncentiveDetail(long studentId, long schoolId) {
		// TODO Auto-generated method stub
		ResponseDTO responseDTO = new ResponseDTO();
		StdIncentiveDetail incentiveDetail = incentiveDetailRepo.findByStudentId(studentId);
		responseDTO.setIncentiveDetail(incentiveDetail);
		responseDTO.setStatusCode(ResponceCode.App001.getStatusCode());
		responseDTO.setDescription(ResponceCode.App001.getStatusDesc());
		return responseDTO;
	}

	public ResponseDTO viewVocationalDetail(long studentId, long schoolId) {
		// TODO Auto-generated method stub
		ResponseDTO responseDTO = new ResponseDTO();
		StdVocationalDetail vocationalDetail = vocationalDetailRepo.findByStudentId(studentId);
		responseDTO.setVocationalDetail(vocationalDetail);
		responseDTO.setStatusCode(ResponceCode.App001.getStatusCode());
		responseDTO.setDescription(ResponceCode.App001.getStatusDesc());
		return responseDTO;
	}

}
