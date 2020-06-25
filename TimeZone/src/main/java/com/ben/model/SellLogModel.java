package com.ben.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "sell_log")
@Data
public class SellLogModel extends AbstractModel{

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id")
    private ProductModel product;

    @Column(name = "count")
    private Integer count;

    @Column(name = "price")
    private Float price;
}
