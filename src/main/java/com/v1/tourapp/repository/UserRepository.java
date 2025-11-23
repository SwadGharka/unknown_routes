package com.v1.tourapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.v1.tourapp.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{

    @Query(value = "SELECT * FROM USER WHERE USER_NAME = ?1",nativeQuery = true)
    User getUserByUserName(String userName);

    @Query(value = "SELECT * FROM USER WHERE ID = ?1",nativeQuery = true)
    User getUserById(Integer userId);
}
