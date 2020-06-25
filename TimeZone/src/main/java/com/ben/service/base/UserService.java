package com.ben.service.base;

import com.ben.model.UserModel;

public interface UserService extends Service<UserModel> {
    UserModel getUserByUserNameAndStatus(String userName, int status);
}
