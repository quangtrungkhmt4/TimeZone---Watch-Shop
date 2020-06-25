package com.ben.service.base;

import com.ben.model.ProductModel;
import com.ben.model.SizeColorModel;

import java.util.List;

public interface SizeColorService extends Service<SizeColorModel> {
    SizeColorModel getByProduct(ProductModel model);
    SizeColorModel getById(Long id);
}
