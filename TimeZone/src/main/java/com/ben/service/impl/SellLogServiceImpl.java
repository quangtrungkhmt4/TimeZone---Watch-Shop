package com.ben.service.impl;

import com.ben.model.SellLogModel;
import com.ben.repository.SellLogRepository;
import com.ben.service.base.SellLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SellLogServiceImpl implements SellLogService {

    @Autowired
    private SellLogRepository sellLogRepository;

    @Override
    public SellLogModel insertEntity(SellLogModel sellLogModel) {
        return sellLogRepository.save(sellLogModel);
    }

    @Override
    public SellLogModel updateEntity(SellLogModel sellLogModel) {
        return sellLogRepository.save(sellLogModel);
    }

    @Override
    public void removeEntity(Long id) {
        sellLogRepository.delete(id);
    }

    @Override
    public List<SellLogModel> insertMany(List<SellLogModel> models) {
        return sellLogRepository.save(models);
    }

    @Override
    public int countAll() {
        return (int)sellLogRepository.count();
    }

    @Override
    public List<SellLogModel> getAll(int page, int limit) {
        Pageable pageable = new PageRequest(page - 1, limit
                , new Sort(Sort.Direction.DESC, "createdDate"));
        return sellLogRepository.findAll(pageable).getContent();
    }
}
