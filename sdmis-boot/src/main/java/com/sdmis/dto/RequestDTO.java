package com.sdmis.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.sdmis.model.StudentBasicDetail;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RequestDTO {

	@JsonInclude(Include.NON_NULL)
	private StudentBasicDetail studentBasicDetail;
}
