package com.np.sdmis.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.np.sdmis.model.MstClassSection;

@Repository
public interface MstClassSectionRepo extends CrudRepository<MstClassSection, Long> {

	List<MstClassSection> findBySchoolId(long schoolId);

}
