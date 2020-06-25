package com.ben.service.impl;

import com.ben.model.UserModel;
import com.ben.repository.UserRepository;
import com.ben.service.base.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserModel insertEntity(UserModel userModel) {
        return null;
    }

    @Override
    public UserModel updateEntity(UserModel userModel) {
        return null;
    }

    @Override
    public void removeEntity(Long id) {

    }

    @Override
    public UserModel getUserByUserNameAndStatus(String userName, int status) {
        return userRepository.findUserModelByUserNameAndStatus(userName, status);
    }
}
