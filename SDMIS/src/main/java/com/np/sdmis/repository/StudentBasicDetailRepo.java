package com.np.sdmis.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.np.sdmis.model.StudentBasicDetail;

public interface StudentBasicDetailRepo extends JpaRepository<StudentBasicDetail, Long> {

	List<StudentBasicDetail> findByUdiseCode(String udiseCode);

	List<StudentBasicDetail> findByBlockCode(String blockCode);

	List<StudentBasicDetail> findByGenderAndBlockCode(String gender, String blockCode);

	List<StudentBasicDetail> findBySocialCategoryAndBlockCode(long socialCategory, String blockCode);

	@Query("SELECT COUNT(DISTINCT udiseCode) FROM StudentBasicDetail WHERE blockCode = :blockCode")
	Integer countDistinctUdiseCodeByBlockCode(@Param("blockCode") String blockCode);

}
