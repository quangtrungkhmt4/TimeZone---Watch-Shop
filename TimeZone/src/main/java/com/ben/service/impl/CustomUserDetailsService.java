package com.ben.service.impl;

import com.ben.constant.UserStatus;
import com.ben.entity.UserAuth;
import com.ben.model.UserModel;
import com.ben.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserModel userModel = userRepository
                .findUserModelByUserNameAndStatus(username, UserStatus.ACTIVE_STATUS);

        if (userModel == null) {
            throw new UsernameNotFoundException("User not found");
        }
        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(userModel.getRole().getCode()));

        UserAuth userAuth = new UserAuth(userModel.getUserName(), userModel.getPassword(),
                true, true, true, true, authorities);
        userAuth.setFullName(userModel.getFullName());
        return userAuth;
    }

}