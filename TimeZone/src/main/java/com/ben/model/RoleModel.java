package com.ben.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "role")
@Data
public class RoleModel extends AbstractModel{

        @Column(name = "name")
        private String name;

        @Column(name = "code")
        private String code;

}
