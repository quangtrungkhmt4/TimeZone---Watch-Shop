package com.ben.service.impl;

import com.ben.model.ImageModel;
import com.ben.model.ProductModel;
import com.ben.repository.ImageRepository;
import com.ben.service.base.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImageServiceImpl implements ImageService{

    @Autowired
    private ImageRepository imageRepository;

    @Override
    public List<ImageModel> getImageByProduct(ProductModel model) {
        return imageRepository.findAllByProduct(model);
    }

    @Override
    public List<ImageModel> insertMany(List<ImageModel> imageModels) {
        return imageRepository.save(imageModels);
    }

    @Override
    public void removeEntities(List<ImageModel> imageModels) {
        imageRepository.delete(imageModels);
    }

    @Override
    public List<ImageModel> updateEntities(ProductModel model, List<ImageModel> imageModels, List<Long> idsIgnore) {
        if (idsIgnore.isEmpty()) idsIgnore.add(-100L);
        List<ImageModel> images = imageRepository.findAllByProductAndIdNotIn(model, idsIgnore);
        removeEntities(images);
        return insertMany(imageModels);
    }

    @Override
    public ImageModel insertEntity(ImageModel imageModel) {
        return imageRepository.save(imageModel);
    }

    @Override
    public ImageModel updateEntity(ImageModel imageModel) {
        return imageRepository.save(imageModel);
    }

    @Override
    public void removeEntity(Long id) {
        imageRepository.delete(id);
    }
}
