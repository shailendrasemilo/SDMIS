package com.np.sdmis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.np.sdmis.dto.ResponseDTO;
import com.np.sdmis.service.DashboardService;

@RestController
@RequestMapping("/api/v1")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class DasboardController {

	@Autowired
	DashboardService dashboardService;

	@GetMapping("/getSchoolDasboard")
	public ResponseDTO getSchoolDasboard(@RequestParam("schoolId") long schoolId) {

		return dashboardService.findSchoolDashboard(schoolId);
	}

}
