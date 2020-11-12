package com.np.sdmis.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.np.sdmis.model.StdEducationDetail;
import com.np.sdmis.model.StdIncentiveDetail;
import com.np.sdmis.model.StdSectionClassMapping;
import com.np.sdmis.model.StdVocationalDetail;
import com.np.sdmis.model.StudentBasicDetail;
import com.np.sdmis.model.StudentResultDetail;

public class RequestDTO {

	@JsonInclude(Include.NON_NULL)
	private StudentBasicDetail studentBasicDetail;
	@JsonInclude(Include.NON_NULL)
	private StdSectionClassMapping classMapping;

	private StdEducationDetail educationDetail;
	private StudentResultDetail resultDetail;
	private StdIncentiveDetail incentiveDetail;
	private StdVocationalDetail vocationalDetail;

	public StudentResultDetail getResultDetail() {
		return resultDetail;
	}

	public void setResultDetail(StudentResultDetail resultDetail) {
		this.resultDetail = resultDetail;
	}

	public StdIncentiveDetail getIncentiveDetail() {
		return incentiveDetail;
	}

	public void setIncentiveDetail(StdIncentiveDetail incentiveDetail) {
		this.incentiveDetail = incentiveDetail;
	}

	public StdVocationalDetail getVocationalDetail() {
		return vocationalDetail;
	}

	public void setVocationalDetail(StdVocationalDetail vocationalDetail) {
		this.vocationalDetail = vocationalDetail;
	}

	public StdEducationDetail getEducationDetail() {
		return educationDetail;
	}

	public void setEducationDetail(StdEducationDetail educationDetail) {
		this.educationDetail = educationDetail;
	}

	public StudentBasicDetail getStudentBasicDetail() {
		return studentBasicDetail;
	}

	public void setStudentBasicDetail(StudentBasicDetail studentBasicDetail) {
		this.studentBasicDetail = studentBasicDetail;
	}

	public StdSectionClassMapping getClassMapping() {
		return classMapping;
	}

	public void setClassMapping(StdSectionClassMapping classMapping) {
		this.classMapping = classMapping;
	}

}
