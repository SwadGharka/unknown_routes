package com.v1.tourapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.v1.tourapp.entity.TourPackage;

@Repository
public interface PackageRepository extends JpaRepository<TourPackage, Long> {
}
