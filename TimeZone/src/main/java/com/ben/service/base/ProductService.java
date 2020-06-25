package com.ben.service.base;

import com.ben.model.ProductModel;

import java.util.List;

public interface ProductService extends Service<ProductModel> {
    int countAll();
    List<ProductModel> getAllPageable(int page, int limit);
    ProductModel getById(long id);
    List<ProductModel> getTheNewest(int limit);
    List<ProductModel> getByIds(Iterable<Long> ids);
}
