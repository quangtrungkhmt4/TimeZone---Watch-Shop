package com.ben.service.base;

import com.ben.model.ImageModel;
import com.ben.model.ProductModel;

import java.util.List;

public interface ImageService extends Service<ImageModel> {
    List<ImageModel> getImageByProduct(ProductModel model);
    List<ImageModel> insertMany(List<ImageModel> imageModels);
    void removeEntities(List<ImageModel> imageModels);
    List<ImageModel> updateEntities(ProductModel model, List<ImageModel> imageModels, List<Long> idsIgnore);
}
