package com.np.sdmis.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.np.sdmis.model.StdClassSectionMapping;

@Repository
public interface StdClassSectionMappingRepo extends JpaRepository<StdClassSectionMapping, Long> {

	StdClassSectionMapping findByStudentIdAndSchoolIdAndStatus(long studentId, long schoolId, String status);

	List<StdClassSectionMapping> findBySchoolIdAndStatus(long schoolId, String string);
}
