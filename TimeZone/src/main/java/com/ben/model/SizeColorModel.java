package com.ben.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "size_color")
@Data
public class SizeColorModel extends AbstractModel {
    @Column(name = "size")
    private String size;

    @Column(name = "color")
    private String color;

    @Column(name = "count")
    private Integer count;

    @Column(name = "status")
    private Integer status;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id")
    private ProductModel product;
}
