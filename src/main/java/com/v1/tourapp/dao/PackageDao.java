package com.v1.tourapp.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.v1.tourapp.entity.Packages;

import jakarta.transaction.Transactional;

@Repository
public interface PackageDao extends JpaRepository<Packages, Long> {

    @Query(value = "SELECT * FROM PACKAGES WHERE STATUS IN (?1) ", nativeQuery = true)
    List<Packages> getAllPackages(List<Boolean> status);

    @Modifying
	@Transactional
    @Query(value = "UPDATE PACKAGES SET STATUS = ?1 WHERE ID = ?2 ", nativeQuery = true)
    int updatePackageStatus(Boolean status, Long packageId);

    @Query(value = "SELECT * FROM PACKAGES WHERE IS_COMPLETED = FALSE ORDER BY ID DESC LIMIT 0,1 ", nativeQuery = true)
    Packages getIncompletedPackage();
}
