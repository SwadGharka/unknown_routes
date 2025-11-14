package com.v1.tourapp.service;

import java.util.List;

import com.v1.tourapp.entity.Packages;

public interface PackageService {
	
	List<Packages> getAllPackages();
	Packages getPackageById(Long id);
	Packages save(Packages packages);
}
