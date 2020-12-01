package com.np.sdmis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.np.sdmis.constant.ResponceCode;
import com.np.sdmis.dto.ResponseDTO;
import com.np.sdmis.model.DashboardData;
import com.np.sdmis.model.StdClassSectionMapping;
import com.np.sdmis.model.StdEducationDetail;
import com.np.sdmis.model.StdIncentiveDetail;
import com.np.sdmis.model.StdVocationalDetail;
import com.np.sdmis.model.StudentBasicDetail;
import com.np.sdmis.model.StudentResultDetail;
import com.np.sdmis.repository.StdClassSectionMappingRepo;
import com.np.sdmis.repository.StdEducationDetailRepo;
import com.np.sdmis.repository.StdIncentiveDetailRepo;
import com.np.sdmis.repository.StdVocationalDetailRepo;
import com.np.sdmis.repository.StudentBasicDetailRepo;
import com.np.sdmis.repository.StudentResultDetailRepo;

@Service
public class DashboardService {
	@Autowired
	StudentBasicDetailRepo studentRepo;
	@Autowired
	StdEducationDetailRepo eduRepo;
	@Autowired
	StdVocationalDetailRepo vocRepo;
	@Autowired
	StdIncentiveDetailRepo incRepo;

	@Autowired
	StudentResultDetailRepo resRepo;
	@Autowired
	StdClassSectionMappingRepo classSecRepo;

	public ResponseDTO findSchoolDashboard(long schoolId) {
		ResponseDTO responseDTO = new ResponseDTO();
		DashboardData dashboardData = new DashboardData();
		List<StudentBasicDetail> studentBasicDetails = studentRepo.findBySchoolId(schoolId);
		if (null != studentBasicDetails && studentBasicDetails.size() > 0) {
			dashboardData.setTotalStudent(studentBasicDetails.size());
			int edu = 0;
			int voc = 0;
			int inc = 0;
			int res = 0;
			int comlProf = 0;
			long remProf = 0;
			boolean flag = false;
			for (StudentBasicDetail studentBasicDetail : studentBasicDetails) {
				StdEducationDetail educationDetail = eduRepo.findByStudentId(studentBasicDetail.getRecordId());
				if (null != educationDetail) {
					dashboardData.setCompleteEducation(edu++);
				} else
					flag = true;
				StdVocationalDetail vocationalDetail = vocRepo.findByStudentId(studentBasicDetail.getRecordId());
				if (null != vocationalDetail) {
					dashboardData.setCompleteVocational(voc++);
				} else
					flag = true;
				StdIncentiveDetail incentiveDetail = incRepo.findByStudentId(studentBasicDetail.getRecordId());
				if (null != incentiveDetail) {
					dashboardData.setCompleteIncentive(inc++);
				} else
					flag = true;
				StudentResultDetail resultDetail = resRepo.findByStudentId(studentBasicDetail.getRecordId());
				if (null != resultDetail) {
					dashboardData.setCompleteResult(res++);
				} else
					flag = true;

				if (!flag) {
					dashboardData.setCompleteProfile(comlProf++);
				}
			}
			remProf = studentBasicDetails.size() - dashboardData.getCompleteProfile();
			dashboardData.setRemainingProfile(remProf);

			List<StdClassSectionMapping> classSectionMapping = classSecRepo.findBySchoolIdAndStatus(schoolId, "A");
			if (null != classSectionMapping && classSectionMapping.size() > 0) {
				int classI = 0;
				int classII = 0;
				int classIII = 0;
				int classIV = 0;
				int classV = 0;
				int classVI = 0;
				int classVII = 0;
				int classVIII = 0;
				int classIX = 0;
				int classX = 0;
				int classXI = 0;
				int classXII = 0;
				for (StdClassSectionMapping stdClassSectionMapping : classSectionMapping) {
					if (stdClassSectionMapping.getClassName().equals("I")) {
						dashboardData.setClassI(classI++);
					} else if (stdClassSectionMapping.getClassName().equals("II")) {
						dashboardData.setClassII(classII++);
					} else if (stdClassSectionMapping.getClassName().equals("III")) {
						dashboardData.setClassIII(classIII++);
					} else if (stdClassSectionMapping.getClassName().equals("IV")) {
						dashboardData.setClassIV(classIV++);
					} else if (stdClassSectionMapping.getClassName().equals("V")) {
						dashboardData.setClassV(classV++);
					} else if (stdClassSectionMapping.getClassName().equals("VI")) {
						dashboardData.setClassVI(classVI++);
					} else if (stdClassSectionMapping.getClassName().equals("VII")) {
						dashboardData.setClassVII(classVII++);
					} else if (stdClassSectionMapping.getClassName().equals("VIII")) {
						dashboardData.setClassVIII(classVIII++);
					} else if (stdClassSectionMapping.getClassName().equals("IX")) {
						dashboardData.setClassIX(classIX++);
					} else if (stdClassSectionMapping.getClassName().equals("X")) {
						dashboardData.setClassX(classX++);
					} else if (stdClassSectionMapping.getClassName().equals("XI")) {
						dashboardData.setClassXI(classXI++);
					} else if (stdClassSectionMapping.getClassName().equals("XII")) {
						dashboardData.setClassXII(classXII++);
					}
				}
			}
			responseDTO.setDashboardData(dashboardData);
			responseDTO.setStatusCode(ResponceCode.App001.getStatusCode());
			responseDTO.setDescription(ResponceCode.App001.getStatusDesc());
		} else {

			responseDTO.setStatusCode(ResponceCode.App003.getStatusCode());
			responseDTO.setDescription(ResponceCode.App003.getStatusDesc());
		}
		return responseDTO;

	}

}
