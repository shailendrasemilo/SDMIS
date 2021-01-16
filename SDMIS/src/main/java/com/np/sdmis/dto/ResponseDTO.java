package com.np.sdmis.dto;

import java.util.List;
import java.util.Optional;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.np.sdmis.model.DashboardData;
import com.np.sdmis.model.MasterConfig;
import com.np.sdmis.model.MstClassSection;
import com.np.sdmis.model.StdClassSectionMapping;
import com.np.sdmis.model.StdEducationDetail;
import com.np.sdmis.model.StdIncentiveDetail;
import com.np.sdmis.model.StdVocationalDetail;
import com.np.sdmis.model.StudentBasicDetail;
import com.np.sdmis.model.StudentListData;
import com.np.sdmis.model.StudentResultDetail;

public class ResponseDTO {

	@JsonInclude(Include.NON_NULL)
	private String statusCode;
	@JsonInclude(Include.NON_NULL)
	private String description;

	private Optional<StdClassSectionMapping> sectionClassMapping;

	private Optional<StudentBasicDetail> studentBasicDetail;
	private StdEducationDetail educationDetail;
	private StudentResultDetail resultDetail;
	private StdIncentiveDetail incentiveDetail;
	private StdVocationalDetail vocationalDetail;
	List<StudentListData> studentListDatas;
	List<MstClassSection> mstClassSections;
	DashboardData dashboardData;
	private MasterConfig masterConfig;
	int schoolCount;

	public int getSchoolCount() {
		return schoolCount;
	}

	public void setSchoolCount(int schoolCount) {
		this.schoolCount = schoolCount;
	}

	public MasterConfig getMasterConfig() {
		return masterConfig;
	}

	public void setMasterConfig(MasterConfig masterConfig) {
		this.masterConfig = masterConfig;
	}

	public DashboardData getDashboardData() {
		return dashboardData;
	}

	public void setDashboardData(DashboardData dashboardData) {
		this.dashboardData = dashboardData;
	}

	public List<MstClassSection> getMstClassSections() {
		return mstClassSections;
	}

	public void setMstClassSections(List<MstClassSection> mstClassSections) {
		this.mstClassSections = mstClassSections;
	}

	public List<StudentListData> getStudentListDatas() {
		return studentListDatas;
	}

	public void setStudentListDatas(List<StudentListData> studentListDatas) {
		this.studentListDatas = studentListDatas;
	}

	public StdVocationalDetail getVocationalDetail() {
		return vocationalDetail;
	}

	public void setVocationalDetail(StdVocationalDetail vocationalDetail) {
		this.vocationalDetail = vocationalDetail;
	}

	public StdIncentiveDetail getIncentiveDetail() {
		return incentiveDetail;
	}

	public void setIncentiveDetail(StdIncentiveDetail incentiveDetail) {
		this.incentiveDetail = incentiveDetail;
	}

	public StudentResultDetail getResultDetail() {
		return resultDetail;
	}

	public void setResultDetail(StudentResultDetail resultDetail) {
		this.resultDetail = resultDetail;
	}

	public StdEducationDetail getEducationDetail() {
		return educationDetail;
	}

	public void setEducationDetail(StdEducationDetail educationDetail) {
		this.educationDetail = educationDetail;
	}

	public Optional<StudentBasicDetail> getStudentBasicDetail() {
		return studentBasicDetail;
	}

	public void setStudentBasicDetail(Optional<StudentBasicDetail> basicDetail) {
		this.studentBasicDetail = basicDetail;
	}

	public Optional<StdClassSectionMapping> getSectionClassMapping() {
		return sectionClassMapping;
	}

	public void setSectionClassMapping(Optional<StdClassSectionMapping> optional) {
		this.sectionClassMapping = optional;
	}

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
