package com.ben.repository;

import com.ben.model.UserModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserModel, Long> {
    UserModel findUserModelByUserNameAndStatus(String userName, int Status);
}
