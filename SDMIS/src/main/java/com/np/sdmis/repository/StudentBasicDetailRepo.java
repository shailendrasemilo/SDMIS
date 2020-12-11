package com.np.sdmis.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.np.sdmis.model.StudentBasicDetail;

public interface StudentBasicDetailRepo extends JpaRepository<StudentBasicDetail, Long> {

	

	List<StudentBasicDetail> findByUdiseCode(String udiseCode);

	List<StudentBasicDetail> findByBlockCode(String blockCode);

	
}
