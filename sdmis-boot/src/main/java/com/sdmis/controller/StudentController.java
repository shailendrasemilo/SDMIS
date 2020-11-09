package com.sdmis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sdmis.dto.RequestDTO;
import com.sdmis.dto.ResponseDTO;
import com.sdmis.service.StudentServiceImpl;

@RestController
@RequestMapping("/api/v1")
public class StudentController {

	@Autowired
	StudentServiceImpl studentService;

	@PostMapping(value = "/saveStudentDetail")
	public ResponseDTO saveStudentBasicInfo(@RequestBody RequestDTO requestDTO) {

		return studentService.saveStudentBasicDetail(requestDTO.getStudentBasicDetail());

	}

	@GetMapping("/test")
	public String getAPI() {

		return "HELLO";
	}
}
