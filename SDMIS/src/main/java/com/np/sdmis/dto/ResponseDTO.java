package com.np.sdmis.dto;

import java.util.Optional;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.np.sdmis.model.StdSectionClassMapping;

public class ResponseDTO {

	@JsonInclude(Include.NON_NULL)
	private String statusCode;
	@JsonInclude(Include.NON_NULL)
	private String description;

	private Optional<StdSectionClassMapping> sectionClassMapping;

	public Optional<StdSectionClassMapping> getSectionClassMapping() {
		return sectionClassMapping;
	}

	public void setSectionClassMapping(Optional<StdSectionClassMapping> optional) {
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
