package com.np.sdmis.service;

import java.util.ArrayList;
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

	public ResponseDTO findSchoolDashboard(String udiseCode) {
		ResponseDTO responseDTO = new ResponseDTO();
		DashboardData dashboardData = new DashboardData();
		List<StudentBasicDetail> studentBasicDetails = studentRepo.findByUdiseCode(udiseCode);
		if (null != studentBasicDetails && studentBasicDetails.size() > 0) {
			dashboardData.setTotalStudent(studentBasicDetails.size());
			int edu = 0;
			int voc = 0;
			int inc = 0;
			int res = 0;
			int comlProf = 0;
			int remProf = 0;
			boolean flag = false;
			List<Integer> sectionWiseData = new ArrayList<>();
			sectionWiseData.add(studentBasicDetails.size());
			for (StudentBasicDetail studentBasicDetail : studentBasicDetails) {
				StdEducationDetail educationDetail = eduRepo.findByStudentId(studentBasicDetail.getRecordId());
				if (null != educationDetail) {
					edu = ++edu;
				} else
					flag = true;
				StdVocationalDetail vocationalDetail = vocRepo.findByStudentId(studentBasicDetail.getRecordId());
				if (null != vocationalDetail) {
					voc = ++voc;
				} else
					flag = true;
				StdIncentiveDetail incentiveDetail = incRepo.findByStudentId(studentBasicDetail.getRecordId());
				if (null != incentiveDetail) {
					inc = ++inc;
				} else
					flag = true;
				StudentResultDetail resultDetail = resRepo.findByStudentId(studentBasicDetail.getRecordId());
				if (null != resultDetail) {
					res = ++res;
				} else
					flag = true;

				if (!flag) {
					dashboardData.setCompleteProfile(++comlProf);
				}
			}
			sectionWiseData.add(edu);
			sectionWiseData.add(inc);
			sectionWiseData.add(voc);
			sectionWiseData.add(res);
			dashboardData.setSectionWiseData(sectionWiseData);
			remProf = studentBasicDetails.size() - dashboardData.getCompleteProfile();
			dashboardData.setRemainingProfile(remProf);

			List<StdClassSectionMapping> classSectionMapping = classSecRepo.findByUdiseCodeAndStatus(udiseCode, "A");
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
				List<Integer> classesData = new ArrayList<>();
				for (StdClassSectionMapping stdClassSectionMapping : classSectionMapping) {
					if (stdClassSectionMapping.getClassName().equals("I")) {
						classI = ++classI;
					} else if (stdClassSectionMapping.getClassName().equals("II")) {
						classII = ++classII;
					} else if (stdClassSectionMapping.getClassName().equals("III")) {
						classIII = ++classIII;
					} else if (stdClassSectionMapping.getClassName().equals("IV")) {
						classIV = ++classIV;
					} else if (stdClassSectionMapping.getClassName().equals("V")) {
						classV = ++classV;
					} else if (stdClassSectionMapping.getClassName().equals("VI")) {
						classVI = ++classVI;
					} else if (stdClassSectionMapping.getClassName().equals("VII")) {
						classVII = ++classVII;
					} else if (stdClassSectionMapping.getClassName().equals("VIII")) {
						classVIII = ++classVIII;
					} else if (stdClassSectionMapping.getClassName().equals("IX")) {
						classIX = ++classIX;
					} else if (stdClassSectionMapping.getClassName().equals("X")) {
						classX = ++classX;
					} else if (stdClassSectionMapping.getClassName().equals("XI")) {
						classXI = ++classXI;
					} else if (stdClassSectionMapping.getClassName().equals("XII")) {
						classXII = ++classXII;
					}
				}
				classesData.add(classI);
				classesData.add(classII);
				classesData.add(classIII);
				classesData.add(classIV);
				classesData.add(classV);
				classesData.add(classVI);
				classesData.add(classVII);
				classesData.add(classVIII);
				classesData.add(classIX);
				classesData.add(classX);
				classesData.add(classXI);
				classesData.add(classXII);
				dashboardData.setClassesData(classesData);
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

	public ResponseDTO findBlockDashboard(String blockCode) {

		ResponseDTO responseDTO = new ResponseDTO();
		DashboardData dashboardData = new DashboardData();
		List<StudentBasicDetail> studentBasicDetails = studentRepo.findByBlockCode(blockCode);
		if (null != studentBasicDetails && studentBasicDetails.size() > 0) {
			dashboardData.setTotalStudent(studentBasicDetails.size());
			int edu = 0;
			int voc = 0;
			int inc = 0;
			int res = 0;
			int comlProf = 0;
			int remProf = 0;
			boolean flag = false;
			List<Integer> sectionWiseData = new ArrayList<>();
			sectionWiseData.add(studentBasicDetails.size());
			for (StudentBasicDetail studentBasicDetail : studentBasicDetails) {
				StdEducationDetail educationDetail = eduRepo.findByStudentId(studentBasicDetail.getRecordId());
				if (null != educationDetail) {
					edu = ++edu;
				} else
					flag = true;
				StdVocationalDetail vocationalDetail = vocRepo.findByStudentId(studentBasicDetail.getRecordId());
				if (null != vocationalDetail) {
					voc = ++voc;
				} else
					flag = true;
				StdIncentiveDetail incentiveDetail = incRepo.findByStudentId(studentBasicDetail.getRecordId());
				if (null != incentiveDetail) {
					inc = ++inc;
				} else
					flag = true;
				StudentResultDetail resultDetail = resRepo.findByStudentId(studentBasicDetail.getRecordId());
				if (null != resultDetail) {
					res = ++res;
				} else
					flag = true;

				if (!flag) {
					dashboardData.setCompleteProfile(++comlProf);
				}
			}
			sectionWiseData.add(edu);
			sectionWiseData.add(inc);
			sectionWiseData.add(voc);
			sectionWiseData.add(res);
			dashboardData.setSectionWiseData(sectionWiseData);
			remProf = studentBasicDetails.size() - dashboardData.getCompleteProfile();
			dashboardData.setRemainingProfile(remProf);

			List<StdClassSectionMapping> classSectionMapping = classSecRepo.findByBlockCodeAndStatus(blockCode, "A");
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
				List<Integer> classesData = new ArrayList<>();
				for (StdClassSectionMapping stdClassSectionMapping : classSectionMapping) {
					if (stdClassSectionMapping.getClassName().equals("I")) {
						classI = ++classI;
					} else if (stdClassSectionMapping.getClassName().equals("II")) {
						classII = ++classII;
					} else if (stdClassSectionMapping.getClassName().equals("III")) {
						classIII = ++classIII;
					} else if (stdClassSectionMapping.getClassName().equals("IV")) {
						classIV = ++classIV;
					} else if (stdClassSectionMapping.getClassName().equals("V")) {
						classV = ++classV;
					} else if (stdClassSectionMapping.getClassName().equals("VI")) {
						classVI = ++classVI;
					} else if (stdClassSectionMapping.getClassName().equals("VII")) {
						classVII = ++classVII;
					} else if (stdClassSectionMapping.getClassName().equals("VIII")) {
						classVIII = ++classVIII;
					} else if (stdClassSectionMapping.getClassName().equals("IX")) {
						classIX = ++classIX;
					} else if (stdClassSectionMapping.getClassName().equals("X")) {
						classX = ++classX;
					} else if (stdClassSectionMapping.getClassName().equals("XI")) {
						classXI = ++classXI;
					} else if (stdClassSectionMapping.getClassName().equals("XII")) {
						classXII = ++classXII;
					}
				}
				classesData.add(classI);
				classesData.add(classII);
				classesData.add(classIII);
				classesData.add(classIV);
				classesData.add(classV);
				classesData.add(classVI);
				classesData.add(classVII);
				classesData.add(classVIII);
				classesData.add(classIX);
				classesData.add(classX);
				classesData.add(classXI);
				classesData.add(classXII);
				dashboardData.setClassesData(classesData);
			}

			List<StudentBasicDetail> studentBoysDetails = studentRepo.findByGender("1");
			List<StudentBasicDetail> studentGirlsDetails = studentRepo.findByGender("2");
			List<StudentBasicDetail> studentTransDetails = studentRepo.findByGender("3");
			List<Integer> genderList = new ArrayList<>();
			if (null != studentBoysDetails)
				genderList.add(studentBoysDetails.size());
			if (null != studentGirlsDetails)
				genderList.add(studentGirlsDetails.size());
			if (null != studentTransDetails)
				genderList.add(studentTransDetails.size());
			dashboardData.setGenderWiseData(genderList);
			List<StudentBasicDetail> studentGenral = studentRepo.findBySocialCategory(1);
			List<StudentBasicDetail> studentSc = studentRepo.findBySocialCategory(2);
			List<StudentBasicDetail> studentST = studentRepo.findBySocialCategory(3);
			List<StudentBasicDetail> studentOBC = studentRepo.findBySocialCategory(4);
			List<StudentBasicDetail> studentORC = studentRepo.findBySocialCategory(5);
			List<StudentBasicDetail> studentOthers = studentRepo.findBySocialCategory(6);
			List<Integer> socialCatList = new ArrayList<>();
			if (null != studentGenral)
				socialCatList.add(studentGenral.size());
			if (null != studentSc)
				socialCatList.add(studentSc.size());
			if (null != studentST)
				socialCatList.add(studentST.size());
			if (null != studentOBC)
				socialCatList.add(studentOBC.size());
			if (null != studentORC)
				socialCatList.add(studentORC.size());
			if (null != studentOthers)
				socialCatList.add(studentOthers.size());
			dashboardData.setSocialCatData(socialCatList);
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
