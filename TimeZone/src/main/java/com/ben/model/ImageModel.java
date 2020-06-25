package com.ben.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "image")
@Data
public class ImageModel extends AbstractModel{

    @Column(name = "url", columnDefinition = "TEXT")
    private String url;

    @Column(name = "thumbnail", columnDefinition = "TEXT")
    private String thumbnail;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id")
    private ProductModel product;


}
