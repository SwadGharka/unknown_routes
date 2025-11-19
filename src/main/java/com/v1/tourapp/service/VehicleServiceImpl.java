package com.v1.tourapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.v1.tourapp.entity.Vehicle;
import com.v1.tourapp.repository.VehicleRepository;

@Service
public class VehicleServiceImpl implements VehicleService{


	@Autowired
	VehicleRepository vehicleRepository;
	
	@Override
	public Vehicle save(Vehicle vehicle) {
		return vehicleRepository.saveAndFlush(vehicle);
	}
	
	@Override
    public List<Object[]> getAllActiveVehicles() {
        return vehicleRepository.getAllActiveVehicles();
    }

}
