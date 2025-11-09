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
@Table(name = "`PACKAGES`")
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

	@Column(name = "CITY")
	private String city;

	@Column(name = "STATE")
	private String state;

	@Column(name = "CONTRY")
	private String country;

	@Column(name = "AMOUNT")
	private Double amount;

	@Column(name = "CATORGY_ID")
	private Long categoryId;

	@Column(name = "DAY_AND_NIGHT")
	private String dayAndNight;

	@Column(name = "ACTIVITIES_LIST")
	private String activitiesList;

	@Column(name = "NUMBER_OF_ADULT")
	private Integer numberOfAdult;

	@Column(name = "NUMBER_OF_CHILD")
	private Integer numberOfChild;

	@Column(name = "STATUS")
	private Boolean status;
}
