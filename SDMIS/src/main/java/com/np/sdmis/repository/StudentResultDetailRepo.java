package com.np.sdmis.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.np.sdmis.model.StudentResultDetail;

@Repository
public interface StudentResultDetailRepo extends JpaRepository<StudentResultDetail, Long> {

	StudentResultDetail findByStudentId(long studentId);

}
