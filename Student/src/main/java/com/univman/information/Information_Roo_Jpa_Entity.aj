// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.univman.information;

import com.univman.information.Information;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Information_Roo_Jpa_Entity {
    
    declare @type: Information: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Information.id;
    
    @Version
    @Column(name = "version")
    private Integer Information.version;
    
    public Long Information.getId() {
        return this.id;
    }
    
    public void Information.setId(Long id) {
        this.id = id;
    }
    
    public Integer Information.getVersion() {
        return this.version;
    }
    
    public void Information.setVersion(Integer version) {
        this.version = version;
    }
    
}
