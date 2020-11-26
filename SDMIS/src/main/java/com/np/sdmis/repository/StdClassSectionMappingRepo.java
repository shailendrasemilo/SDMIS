package com.np.sdmis.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.np.sdmis.model.StdClassSectionMapping;

@Repository
public interface StdClassSectionMappingRepo extends JpaRepository<StdClassSectionMapping, Long> {

	StdClassSectionMapping findByStudentIdAndSchoolIdAndStatus(long studentId, long schoolId, String status);
}
