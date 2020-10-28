package com.sdmis.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "std_basic_details")
public class StudentBasicDetail implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2206188058166930986L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name = "record_id")
	long recordId;
	@Column(name = "student_id")
	long student_id;
	@Column(name = "admission_num")
	long admissionNum;
	@Column(name = "class_section_id")
	long classSectionId;
	@Column(name = "school_id")
	long schoolId;
	@Column(name = "date_of_admission")
	Date doa;
	@Column(name = "aadhar_num")
	long aadharNum;
	@Column(name = "std_name")
	String name;
	@Column(name = "father_name")
	String fatherName;
	@Column(name = "mother_name")
	String motherName;
	@Column(name = "gender")
	String gender;
	@Column(name = "social_category")
	long socialCategory;
	@Column(name = "religion")
	long religion;
	@Column(name = "mother_tongue")
	long motherTongue;
	@Column(name = "child_homeless")
	long childHomeless;
	@Column(name = "state_id")
	long stateId;
	@Column(name = "district_id")
	long districtId;
	@Column(name = "city_id")
	long cityId;
	@Column(name = "locality_id")
	long localityId;
	@Column(name = "belong_bpl")
	long belongBPL;
	@Column(name = "disadvantage_group")
	long disadvantageGroup;
	@Column(name = "type_of_disability")
	long disabilityType;
	@Column(name = "status")
	String status;
	@Column(name = "created_by")
	String createdBy;
	@Column(name = "created_time")
	Date createdTime;
	@Column(name = "modified_by")
	String modifiedBy;
	@Column(name = "modified_time")
	Date modifiedTime;

}
