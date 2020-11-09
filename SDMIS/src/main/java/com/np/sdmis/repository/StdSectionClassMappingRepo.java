package com.np.sdmis.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.np.sdmis.dto.RequestDTO;
import com.np.sdmis.dto.ResponseDTO;
import com.np.sdmis.model.StdSectionClassMapping;

@Repository
public interface StdSectionClassMappingRepo extends JpaRepository<StdSectionClassMapping, Long> {

	ResponseDTO saveSectionClassMap(RequestDTO requestDTO);

}
