package com.ben.service.base;

import com.ben.model.AbstractModel;

public interface Service<T extends AbstractModel> {
    T insertEntity(T t);
    T updateEntity(T t);
    void removeEntity(Long id);
}
