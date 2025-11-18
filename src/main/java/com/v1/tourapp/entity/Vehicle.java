package com.v1.tourapp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.*;

@Entity
@Table(name = "VEHICLES")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Vehicle {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long id;

    @Column(name = "NAME")
    private String name;

    @Column(name = "TAGLINE")
    private String tagline;

    @Column(name = "IMAGE")
    private byte[] image;

    @Column(name = "BADGE_LABEL")
    private String badgeLabel;

    @Column(name = "BADGE_CLASS")
    private String badgeClass;

    @Column(name = "PRICE_PER_KM")
    private String pricePerKm;

    @Column(name = "MAX_PAX")
    private Integer specSeats;

    @Column(name = "MAX_NO_OF_BAGS")
    private Integer specBags;

    @Column(name = "GEAR_TYPE")
    private String specTransmission;

    @Column(name = "FUEL_TYPE")
    private String specFuel;

    @Column(name = "FEATURES")
    private String features;
}
