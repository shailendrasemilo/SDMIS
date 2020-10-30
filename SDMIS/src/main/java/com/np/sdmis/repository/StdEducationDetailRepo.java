package com.np.sdmis.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.np.sdmis.model.StdEducationDetail;

@Repository
public interface StdEducationDetailRepo extends JpaRepository<StdEducationDetail, Long> {

}
