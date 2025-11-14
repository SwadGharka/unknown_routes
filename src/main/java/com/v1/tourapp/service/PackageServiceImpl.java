package com.v1.tourapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.v1.tourapp.entity.Packages;
import com.v1.tourapp.repository.PackageRepository;

import java.util.List;

@Service
public class PackageServiceImpl implements PackageService {

    @Autowired
    PackageRepository packageRepository;

    @Override
    public Packages save(Packages packages){
        return packageRepository.saveAndFlush(packages);
    }

    @Override
    public List<Packages> getAllPackages() {
        return packageRepository.findAll();
    }

    @Override
    public Packages getPackageById(Long id) {
        return packageRepository.findById(id).orElse(null);
    }
}
