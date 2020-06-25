package com.ben.repository;

import com.ben.model.ProductModel;
import com.ben.model.SizeColorModel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SizeColorRepository extends JpaRepository<SizeColorModel, Long> {
    SizeColorModel findSizeColorModelByProduct(ProductModel model);
    SizeColorModel findSizeColorModelById(Long id);
}
