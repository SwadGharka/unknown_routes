package com.v1.tourapp.repository;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.v1.tourapp.entity.Packages;

@Repository
public interface PackageRepository extends JpaRepository<Packages, Long> {

    @Query(value = "select * from packages where status in (?1) ", nativeQuery = true)
    List<Packages> getAllPackages(List<Boolean> status);

    @Modifying
	@Transactional
    @Query(value = "UPDATE PACKAGES SET STATUS = ?1 WHERE ID = ?2 ", nativeQuery = true)
    int updatePackageStatus(Boolean status, Long packageId);
}
