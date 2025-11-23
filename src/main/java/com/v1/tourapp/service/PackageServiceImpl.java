package com.v1.tourapp.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.v1.tourapp.entity.Packages;
import com.v1.tourapp.repository.PackageRepository;

@Service
public class PackageServiceImpl implements PackageService {

    @Autowired
    PackageRepository packageRepository;

    @Override
    public Packages save(Packages packages){
        return packageRepository.saveAndFlush(packages);
    }

    @Override
    public List<Packages> getAllPackages(List<Boolean> status) {
        return packageRepository.getAllPackages(status);
    }

    @Override
    public Packages getPackageById(Long id) {
        return packageRepository.findById(id).orElse(null);
    }

    @Override
    public int updatePackageStatus(Boolean status, Long packageId) {
        return packageRepository.updatePackageStatus(status, packageId);
    }
}
