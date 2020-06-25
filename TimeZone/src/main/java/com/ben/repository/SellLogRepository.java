package com.ben.repository;

import com.ben.model.SellLogModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SellLogRepository extends JpaRepository<SellLogModel, Long> {
}
