package com.ben.service.impl;

import com.ben.model.BillLogModel;
import com.ben.repository.BillLogRepository;
import com.ben.service.base.BillLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BillLogServiceImpl implements BillLogService {

    @Autowired
    private BillLogRepository billLogRepository;

    @Override
    public BillLogModel insertEntity(BillLogModel billLogModel) {
        return billLogRepository.save(billLogModel);
    }

    @Override
    public BillLogModel updateEntity(BillLogModel billLogModel) {
        return billLogRepository.save(billLogModel);
    }

    @Override
    public void removeEntity(Long id) {
        billLogRepository.delete(id);
    }

    @Override
    public int count() {
        return (int)billLogRepository.count();
    }

    @Override
    public List<BillLogModel> getAll(int page, int limit) {
        Pageable pageable = new PageRequest(page - 1, limit
                , new Sort(Sort.Direction.DESC, "createdDate"));
        return billLogRepository.findAll(pageable).getContent();
    }
}
