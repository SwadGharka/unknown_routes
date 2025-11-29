package com.v1.tourapp.service;

import java.util.List;

import com.v1.tourapp.entity.Packages;

public interface PackageService {
	Packages getPackageById(Long id);
	Packages save(Packages packages);
	List<Packages> getAllPackages(List<Boolean> status);
	int updatePackageStatus(Boolean status, Long packageId);
	Packages getIncompletedPackage();
}
