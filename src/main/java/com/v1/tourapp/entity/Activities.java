package com.v1.tourapp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

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
@Table(name = "activities")
public class Activities {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "activities_seq")
    @SequenceGenerator(name = "activities_seq", sequenceName = "activities_seq", allocationSize = 1)
    @Column(name = "id")
    private Long id;

    @Column(name = "package_id")
    private Long packageId;

    @Column(name = "day")
    private Integer day;
    
    @Column(name = "header")
    private String header;

    @Column(name = "points")
    private String points;
}
