package com.np.sdmis.repository;

import org.springframework.data.repository.CrudRepository;

import com.np.sdmis.model.MasterConfig;

public interface MasterConfigRepo extends CrudRepository<MasterConfig, Long>{

	MasterConfig findByStateCode(String stateCode);

}
