package com.ben.repository;

import com.ben.model.ImageModel;
import com.ben.model.ProductModel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ImageRepository extends JpaRepository<ImageModel, Long> {
    List<ImageModel> findAllByProduct(ProductModel model);
    List<ImageModel> findAllByProductAndIdNotIn(ProductModel model, List<Long> ids);
}
