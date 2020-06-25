package com.ben.service.impl;

import com.ben.constant.SortType;
import com.ben.model.ProductModel;
import com.ben.repository.ProductRepository;
import com.ben.service.base.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Override
    public int countAll() {
        return (int) productRepository.count();
    }

    @Override
    public List<ProductModel> getAllPageable(int page, int limit) {
        Pageable pageable = new PageRequest(page - 1, limit, new Sort(Sort.Direction.DESC, "createdDate"));
        Page<ProductModel> productModels = productRepository.findAll(pageable);
        return productModels.getContent();
    }

    @Override
    public ProductModel getById(long id) {
        return productRepository.findProductModelById(id);
    }

    @Override
    public List<ProductModel> getTheNewest(int limit) {
        Pageable pageable = new PageRequest(0, limit
                , new Sort(Sort.Direction.DESC, "createdDate"));
        Page<ProductModel> productModels = productRepository.findAll(pageable);
        return productModels.getContent();
    }

    @Override
    public List<ProductModel> getByIds(Iterable<Long> ids) {
        return productRepository.findAll(ids);
    }

    @Override
    public ProductModel insertEntity(ProductModel productModel) {
        return productRepository.save(productModel);
    }

    @Override
    public ProductModel updateEntity(ProductModel productModel) {
        return productRepository.save(productModel);
    }

    @Override
    public void removeEntity(Long id) {
        productRepository.delete(id);
    }
}
