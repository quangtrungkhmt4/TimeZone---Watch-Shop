package com.ben.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "bill_log")
@Data
public class BillLogModel extends AbstractModel{
    @Column(name = "bill_content", columnDefinition = "TEXT")
    private String billContent;

    @Column(name = "status")
    private Integer status;

    @Column(name = "total_price")
    private Float totalPrice;
}
