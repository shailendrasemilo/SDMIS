package com.np.sdmis.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.np.sdmis.model.DistrictMaster;

@Repository
public interface DistrictRepository extends JpaRepository<DistrictMaster, Long> {

	List<DistrictMaster> getDistrict(int stateId);
}
