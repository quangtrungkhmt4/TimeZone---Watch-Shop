package com.ben.service.base;

import com.ben.model.BillLogModel;

import java.util.List;

public interface BillLogService extends Service<BillLogModel> {
    int count();
    List<BillLogModel> getAll(int page, int limit);
}
