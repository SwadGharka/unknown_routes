package com.v1.tourapp.service;

import java.util.List;

import com.v1.tourapp.entity.Package;

public interface PackageService {
    List<Package> getAllPackages();
    Package getPackageById(Long id);
}
