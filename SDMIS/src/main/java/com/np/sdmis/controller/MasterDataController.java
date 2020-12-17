package com.np.sdmis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.np.sdmis.dto.RequestDTO;
import com.np.sdmis.dto.ResponseDTO;
import com.np.sdmis.service.MasterDataService;

@RestController
@RequestMapping("/api/v1")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class MasterDataController {
	
	@Autowired
	MasterDataService masterDataService;
	
	@PostMapping(value = "/saveMasterConfig")
	public ResponseDTO saveMasterConfig(@RequestBody RequestDTO requestDTO) {

		return masterDataService.saveMasterConfig(requestDTO);

	}
	@GetMapping(value = "/getMasterConfig")
	public ResponseDTO getMasterConfig(@RequestParam("stateCode") String stateCode)
	{
		return masterDataService.getMasterConfig(stateCode);
	}

}
