package com.np.sdmis.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.np.sdmis.model.StdSectionClassMapping;
import com.np.sdmis.model.StudentBasicDetail;

public class RequestDTO {

	@JsonInclude(Include.NON_NULL)
	private StudentBasicDetail studentBasicDetail;
	@JsonInclude(Include.NON_NULL)
	private StdSectionClassMapping classMapping;

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
