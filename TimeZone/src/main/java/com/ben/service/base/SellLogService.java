package com.ben.service.base;

import com.ben.model.SellLogModel;

import java.util.List;

public interface SellLogService extends Service<SellLogModel> {

    List<SellLogModel> insertMany(List<SellLogModel> models);

    int countAll();

    List<SellLogModel> getAll(int page, int limit);

}
