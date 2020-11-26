package com.np.sdmis.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.np.sdmis.model.StdVocationalDetail;

@Repository
public interface StdVocationalDetailRepo extends JpaRepository<StdVocationalDetail, Long> {

	StdVocationalDetail findByStudentId(long studentId);

}
