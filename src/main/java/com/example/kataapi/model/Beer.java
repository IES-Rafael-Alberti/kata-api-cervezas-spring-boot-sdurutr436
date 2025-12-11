package com.example.kataapi.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "beers")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Beer {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    @Column(name = "brewery_id", nullable = false)
    private Integer breweryId;
    
    @Column(nullable = false)
    private String name;
    
    @Column(name = "cat_id", nullable = false)
    private Integer catId;
    
    @Column(name = "style_id", nullable = false)
    private Integer styleId;
    
    @Column(nullable = false)
    private Float abv;
    
    @Column(nullable = false)
    private Float ibu;
    
    @Column(nullable = false)
    private Float srm;
    
    @Column
    private Integer upc;
    
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
