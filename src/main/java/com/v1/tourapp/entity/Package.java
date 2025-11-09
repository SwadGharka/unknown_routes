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
public class Package {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;

	@Column(name = "NAME", nullable = false)
	private String name;

	@Column(name = "DESC", columnDefinition = "TEXT")
	private String desc;

	@Column(name = "MAJOR_ATTRACTIONSLIST")
	private String majorAttractionsList;

	@Column(name = "IMAGEURL")
	private String imageUrl;

	@Column(name = "CITY")
	private String city;

	@Column(name = "STATE")
	private String state;

	@Column(name = "CONTRY")
	private String country;

	@Column(name = "AMOUNT")
	private Double amount;

	@Column(name = "CATORGYID")
	private Long categoryId;

	@Column(name = "DAYANDNIGHT")
	private String dayAndNight;

	@Column(name = "ACTIVITIESLIST")
	private String activitiesList;

	@Column(name = "NUMBEROFADULT")
	private Integer numberOfAdult;

	@Column(name = "NUMBEROFCHILD")
	private Integer numberOfChild;

	@Column(name = "STATUS")
	private Boolean status;
}
