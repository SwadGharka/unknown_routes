package com.v1.tourapp.service;

import org.springframework.stereotype.Service;

import com.v1.tourapp.entity.TourPackage;
import com.v1.tourapp.repository.PackageRepository;

import java.util.List;

@Service
public class PackageServiceImpl implements PackageService {

    private final PackageRepository packageRepository;

    public PackageServiceImpl(PackageRepository packageRepository) {
        this.packageRepository = packageRepository;
    }

    @Override
    public List<TourPackage> getAllPackages() {
        return packageRepository.findAll();
    }

    @Override
    public TourPackage getPackageById(Long id) {
        return packageRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Package not found with id: " + id));
    }
}
