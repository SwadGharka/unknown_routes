package com.v1.tourapp.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.v1.tourapp.entity.Vehicle;
import com.v1.tourapp.repository.VehicleRepository;

public class VehicleServiceImpl implements VehicleService{


	@Autowired
	VehicleRepository vehicleRepository;
	
	@Override
	public Vehicle save(Vehicle vehicle) {
		return vehicleRepository.saveAndFlush(vehicle);
	}

}
