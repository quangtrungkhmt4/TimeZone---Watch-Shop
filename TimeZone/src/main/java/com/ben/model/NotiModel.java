package com.ben.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "noti")
@Data
public class NotiModel extends AbstractModel {

    @Column(name = "email")
    private String email;
}
