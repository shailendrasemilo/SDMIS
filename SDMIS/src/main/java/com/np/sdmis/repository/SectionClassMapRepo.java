package com.np.sdmis.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SectionClassMapRepo extends JpaRepository<StdSectionClassMappingRepo, Long>{

}
