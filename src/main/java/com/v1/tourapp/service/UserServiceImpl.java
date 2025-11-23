package com.v1.tourapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import com.v1.tourapp.entity.User;
import com.v1.tourapp.repository.UserRepository;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
        
    @Autowired
    UserRepository userRepository;

    @Override
    public User saveUser(User user) {
        if(user != null){
            return userRepository.saveAndFlush(user);
        }else{
            return null;
        }
    }

    @Override
    public User getUserByUserName(String userName) {
        User user = userRepository.getUserByUserName(userName);
        return user;
    }
}
