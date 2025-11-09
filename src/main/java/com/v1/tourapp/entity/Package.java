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

    // --- Getters and Setters ---
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getMajorAttractionsList() {
        return majorAttractionsList;
    }

    public void setMajorAttractionsList(String majorAttractionsList) {
        this.majorAttractionsList = majorAttractionsList;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public String getDayAndNight() {
        return dayAndNight;
    }

    public void setDayAndNight(String dayAndNight) {
        this.dayAndNight = dayAndNight;
    }

    public String getActivitiesList() {
        return activitiesList;
    }

    public void setActivitiesList(String activitiesList) {
        this.activitiesList = activitiesList;
    }

    public Integer getNumberOfAdult() {
        return numberOfAdult;
    }

    public void setNumberOfAdult(Integer numberOfAdult) {
        this.numberOfAdult = numberOfAdult;
    }

    public Integer getNumberOfChild() {
        return numberOfChild;
    }

    public void setNumberOfChild(Integer numberOfChild) {
        this.numberOfChild = numberOfChild;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }
}
