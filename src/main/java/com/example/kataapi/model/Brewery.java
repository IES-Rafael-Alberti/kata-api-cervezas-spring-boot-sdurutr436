package com.example.kataapi.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "breweries")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Brewery {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    @Column(nullable = false)
    private String name;
    
    @Column(name = "address1")
    private String address1;
    
    @Column(name = "address2")
    private String address2;
    
    @Column
    private String city;
    
    @Column
    private String state;
    
    @Column
    private String code;
    
    @Column
    private String country;
    
    @Column
    private String phone;
    
    @Column
    private String website;
    
    @Column
    private String filepath;
    
    @Column(columnDefinition = "TEXT")
    private String descript;
    
    @Column(name = "add_user")
    private Integer addUser;
    
    @Column(name = "last_mod", nullable = false)
    private LocalDateTime lastMod;
    
    @PrePersist
    @PreUpdate
    protected void onUpdate() {
        this.lastMod = LocalDateTime.now();
    }
}
