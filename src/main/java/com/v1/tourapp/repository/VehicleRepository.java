package com.v1.tourapp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.v1.tourapp.entity.Vehicle;

@Repository
public interface VehicleRepository extends JpaRepository<Vehicle, Long>{
	@Query(value="SELECT * FROM vehicles WHERE active_staus = TRUE;", nativeQuery = true)
	 List<Object[]>getAllActiveVehicles();
}
