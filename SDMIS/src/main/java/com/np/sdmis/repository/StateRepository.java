package com.np.sdmis.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.np.sdmis.model.StateMaster;

@Repository
public interface StateRepository extends JpaRepository<StateMaster, Long>, JpaSpecificationExecutor<StateMaster> {

	public StateMaster findById(long id);

}
