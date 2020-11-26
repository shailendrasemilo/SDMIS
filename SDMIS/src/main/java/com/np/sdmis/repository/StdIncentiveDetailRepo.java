package com.np.sdmis.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.np.sdmis.model.StdIncentiveDetail;

@Repository
public interface StdIncentiveDetailRepo extends JpaRepository<StdIncentiveDetail, Long>{

	StdIncentiveDetail findByStudentId(long studentId);

}
