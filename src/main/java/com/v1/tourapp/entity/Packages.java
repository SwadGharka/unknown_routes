package com.v1.tourapp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.*;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
@Table(name = "PACKAGES")
public class Packages {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;

	@Column(name = "NAME")
	private String name;

	@Column(name = "DESCRIPTION")
	private String description;

	@Column(name = "MAJOR_ATTRACTIONS_LIST")
	private String majorAttractionsList;

	@Column(name = "IMAGE_URL")
	private String imageUrl;

	@Column(name = "DESTINATION")
	private String destination;

	@Column(name = "MEMBERS")
	private String members;

	@Column(name = "AMOUNT")
	private Double amount;

	@Column(name = "CATORGY_ID")
	private Long categoryId;

	@Column(name = "TOTAL_DAYS")
	private Integer totalDays;

	@Column(name = "STATUS")
	private Boolean status;
	
	@Column(name = "INCLUSION")
	private String inclusion;
	
	@Column(name = "EXCLUSION")
	private String exclusion;
	
	@Column(name = "HOTEL")
	private String hotel;
	
	@Column(name = "FLIGHT")
	private String flight;
}
