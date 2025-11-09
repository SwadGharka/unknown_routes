package com.v1.tourapp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "TOUR_PACKAGES")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TourPackage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="ID",  length = 2000)
    private Long id;

    @Column(name="PACKAGE_NAME")
    private String packageName;

    @Column(name="DESCRIPTION", length = 2000)
    private String description;

    @Column(name="PRICE")
    private Double price;

    @Column(name="DURATION")
    private String duration;

    @Column(name="IMAGE_URL")
    private String imageUrl;

    @Column(name="LOCATION")
    private String location;
}
