package com.ben.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "product")
@Data
public class ProductModel extends AbstractModel{
    @Column(name = "title")
    private String title;

    @Column(name = "thumbnail")
    private String thumbnail;

    @Column(name = "price")
    private Float price;

    @Column(name = "shortdescription", columnDefinition = "TEXT")
    private String shortDescription;

    @Column(name = "status")
    private Integer status;

    @Column(name = "content", columnDefinition = "TEXT")
    private String content;
}
