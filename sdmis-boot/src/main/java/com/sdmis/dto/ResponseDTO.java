package com.sdmis.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResponseDTO {

	@JsonInclude(Include.NON_NULL)
	private String statusCode;
	@JsonInclude(Include.NON_NULL)
	private String description;

}
