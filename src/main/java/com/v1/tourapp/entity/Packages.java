package com.v1.tourapp.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
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

	@Column(name = "INCLUSIONS_FOR_CARD")
	private String inclusionsForCard;

	@Column(name = "IMAGE_URL")
	private String imageUrl;

	@Column(name = "DESTINATION")
	private String destination;

	@Column(name = "MEMBERS")
	private String members;

	@Column(name = "AMOUNT")
	private Double amount;

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
	
	@Column(name = "BADGE")
	private String badge;
	
	@Column(name = "PACKAGE_COLOR")
	private String packageColor;
	
	@Column(name = "PACKAGE_UNIQUE_CODE")
	private String packageUniqueCode;
	
	@Column(name = "TRAVEL_TYPE", length = 3)
	private String travelType;
	
	@Column(name = "IS_COMPLETED")
	private Boolean isCompleted;
}
