package com.ben.repository;

import com.ben.model.BillLogModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BillLogRepository extends JpaRepository<BillLogModel, Long> {
}
