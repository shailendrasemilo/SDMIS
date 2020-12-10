package com.np.sdmis.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.np.sdmis.model.StdClassSectionMapping;

@Repository
public interface StdClassSectionMappingRepo extends JpaRepository<StdClassSectionMapping, Long> {

	StdClassSectionMapping findByStudentIdAndUdiseCodeAndStatus(long studentId, String udiseCode, String status);


	List<StdClassSectionMapping> findByUdiseCodeAndStatus(String udiseCode, String string);


	List<StdClassSectionMapping> findByBlockCodeAndStatus(String blockCode, String string);
}
