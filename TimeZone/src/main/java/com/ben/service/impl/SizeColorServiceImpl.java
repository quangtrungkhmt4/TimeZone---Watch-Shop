package com.ben.service.impl;

import com.ben.model.ProductModel;
import com.ben.model.SizeColorModel;
import com.ben.repository.SizeColorRepository;
import com.ben.service.base.SizeColorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SizeColorServiceImpl implements SizeColorService {

    @Autowired
    private SizeColorRepository sizeColorRepository;

    @Override
    public List<SizeColorModel> getByProduct(ProductModel model) {
        return sizeColorRepository.findAllByProduct(model);
    }

    @Override
    public SizeColorModel getById(Long id) {
        return sizeColorRepository.findSizeColorModelById(id);
    }

    @Override
    public SizeColorModel insertEntity(SizeColorModel sizeColorModel) {
        return sizeColorRepository.save(sizeColorModel);
    }

    @Override
    public SizeColorModel updateEntity(SizeColorModel sizeColorModel) {
        return sizeColorRepository.save(sizeColorModel);
    }

    @Override
    public void removeEntity(Long id) {
        sizeColorRepository.delete(id);
    }
}
