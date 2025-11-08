package com.v1.tourapp.service;

import java.util.List;

import com.v1.tourapp.entity.TourPackage;

public interface PackageService {
    List<TourPackage> getAllPackages();
    TourPackage getPackageById(Long id);
}
