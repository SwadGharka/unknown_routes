package com.v1.tourapp.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
@Table(name = "PACKAGES_CATEGORY_MAPPING")
public class PackageAndCategoryMapping {

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;

    @Column(name = "PACKAGE_ID")
    private Long packageId;

    @Column(name = "CATEGORY_ID")
    private Long categoryId;
    
    @Column(name = "ACTIVE")
    private String active;
    
}
