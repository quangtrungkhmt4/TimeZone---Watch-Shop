package com.ben.repository;

import com.ben.model.NotiModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NotiRepository extends JpaRepository<NotiModel, Long> {

}
