package com.v1.tourapp.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "CATEGORY")
@Setter
@Getter
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;

	@Column(name = "NAME")
	private String name;

	@Column(name = "DESCRIPTION")
	private String description;

	@Column(name = "ICON")
	private String icon;

	@Column(name = "STATUS")
	private Boolean status;

	@Column(name = "BACKGROUND_COLOR")
	private String backgroundColor;


	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", description=" + description + ", icon=" + icon + ", status=" + status + "]";
	}
	
	
}
