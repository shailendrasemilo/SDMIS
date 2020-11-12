
package com.np.sdmis.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.np.sdmis.dto.RequestDTO;
import com.np.sdmis.dto.ResponseDTO;
import com.np.sdmis.model.BlockMaster;
import com.np.sdmis.model.DistrictMaster;
import com.np.sdmis.model.MOI;
import com.np.sdmis.model.StateMaster;
import com.np.sdmis.model.StudentBasicDetail;
import com.np.sdmis.repository.MOIRepo;
import com.np.sdmis.repository.StudentBasicDetailRepo;
import com.np.sdmis.service.LocationServiceImpl;
import com.np.sdmis.service.StudentServiceImpl;

@RestController
@RequestMapping("/api/v1")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class UserController {

	@Autowired
	StudentServiceImpl studentService;

	@Autowired
	StudentBasicDetailRepo studentRepo;

	@Autowired
	LocationServiceImpl locationServiceImpl;

	@Autowired
	MOIRepo moiRepo;

	@PostMapping(value = "/saveStudentDetail")
	public ResponseDTO saveStudentBasicInfo(@RequestBody RequestDTO requestDTO) {

		return studentService.saveStudentBasicDetail(requestDTO);

	}
	@PutMapping(value = "/udateStudentDetail")
	public ResponseDTO updateStudentBasicInfo(@RequestBody RequestDTO requestDTO) {

		return studentService.saveStudentBasicDetail(requestDTO);

	}

	@PostMapping(value = "/saveSectionClassMap")
	public ResponseDTO savesaveSectionClassMap(@RequestBody RequestDTO requestDTO) {

		return studentService.saveSectionClassMap(requestDTO);

	}

	@GetMapping("/getStdSectionClass")
	public ResponseDTO getStdSectionClass(@RequestParam("studentId") long studentId) {
		return studentService.getStdSectionClass(studentId);
	}

	@PostMapping(value = "/saveEducationDetail")
	public ResponseDTO saveEducationDetail(@RequestBody RequestDTO requestDTO) {

		return studentService.saveEducationDetail(requestDTO);

	}
	@PostMapping(value = "/saveResultDetail")
	public ResponseDTO saveResultDetail(@RequestBody RequestDTO requestDTO) {

		return studentService.saveResultDetail(requestDTO);

	}
	@PostMapping(value = "/saveIncentiveDetail")
	public ResponseDTO saveIncentiveDetail(@RequestBody RequestDTO requestDTO) {

		return studentService.saveIncentiveDetail(requestDTO);

	}
	@PostMapping(value = "/saveVocationalDetail")
	public ResponseDTO saveVocationalDetail(@RequestBody RequestDTO requestDTO) {

		return studentService.saveVocationalDetail(requestDTO);

	}
	@GetMapping("/getStudent")
	public Optional<StudentBasicDetail> getStudentById(@RequestParam("studentId") long studentId) {
		return studentRepo.findById(studentId);
	}

	@GetMapping("/test")
	public String testAPI() {
		return "hello";
	}

	/**
	 * Get all users list.
	 *
	 * @return the list
	 */
	@GetMapping("/students")
	public List<StudentBasicDetail> getAllStudents() {
		return studentRepo.findAll();
	}

	@GetMapping("/getState")
	public List<StateMaster> getState() throws JsonProcessingException {
		// log.info("State requested data ");

		return locationServiceImpl.getState();
	}

	@GetMapping("/getStateById")
	public StateMaster getStateById(@RequestParam("stateId") long stateId) throws JsonProcessingException {
		// log.info("State requested data ");

		return locationServiceImpl.findById(stateId);
	}

	@GetMapping("/getDistrict")
	public List<DistrictMaster> getDistrict(@RequestParam("stateId") long stateId) throws JsonProcessingException {
		// log.info("State requested data ");

		return locationServiceImpl.getDistrict(stateId);
	}

	@GetMapping("/getBlock")
	public List<BlockMaster> getBlock(@RequestParam("districtId") long districtId) throws JsonProcessingException {
		// log.info("State requested data ");

		return locationServiceImpl.getBlock(districtId);
	}

	@GetMapping("/moi")
	public List<MOI> getMOI() {
		return moiRepo.findAll();
	}

	/* *//**
			 * Gets users by id.
			 *
			 * @param userId the user id
			 * @return the users by id
			 * @throws ResourceNotFoundException the resource not found exception
			 */
	/*
	 * @GetMapping("/users/{id}") public ResponseEntity<User>
	 * getUsersById(@PathVariable(value = "id") Long userId) throws
	 * ResourceNotFoundException { User user = userRepository .findById(userId)
	 * .orElseThrow(() -> new ResourceNotFoundException("User not found on :: " +
	 * userId)); return ResponseEntity.ok().body(user); }
	 * 
	 *//**
		 * Create user user.
		 *
		 * @param user the user
		 * @return the user
		 */
	/*
	 * @PostMapping("/users") public User createUser(@Valid @RequestBody User user)
	 * { return userRepository.save(user); }
	 * 
	 *//**
		 * Update user response entity.
		 *
		 * @param userId      the user id
		 * @param userDetails the user details
		 * @return the response entity
		 * @throws ResourceNotFoundException the resource not found exception
		 */
	/*
	 * @PutMapping("/users/{id}") public ResponseEntity<User> updateUser(
	 * 
	 * @PathVariable(value = "id") Long userId, @Valid @RequestBody User
	 * userDetails) throws ResourceNotFoundException {
	 * 
	 * User user = userRepository .findById(userId) .orElseThrow(() -> new
	 * ResourceNotFoundException("User not found on :: " + userId));
	 * 
	 * user.setEmail(userDetails.getEmail());
	 * user.setLastName(userDetails.getLastName());
	 * user.setFirstName(userDetails.getFirstName()); user.setUpdatedAt(new Date());
	 * final User updatedUser = userRepository.save(user); return
	 * ResponseEntity.ok(updatedUser); }
	 * 
	 *//**
		 * Delete user map.
		 *
		 * @param userId the user id
		 * @return the map
		 * @throws Exception the exception
		 *//*
			 * @DeleteMapping("/user/{id}") public Map<String, Boolean>
			 * deleteUser(@PathVariable(value = "id") Long userId) throws Exception { User
			 * user = userRepository .findById(userId) .orElseThrow(() -> new
			 * ResourceNotFoundException("User not found on :: " + userId));
			 * 
			 * userRepository.delete(user); Map<String, Boolean> response = new HashMap<>();
			 * response.put("deleted", Boolean.TRUE); return response; }
			 */
}
