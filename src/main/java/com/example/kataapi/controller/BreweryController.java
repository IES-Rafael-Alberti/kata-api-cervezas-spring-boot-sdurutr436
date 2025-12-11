package com.example.kataapi.controller;

import com.example.kataapi.model.Brewery;
import com.example.kataapi.service.BreweryService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class BreweryController {
    
    private final BreweryService breweryService;
    
    /**
     * GET /breweries - Obtener todas las cerveceras
     */
    @GetMapping("/breweries")
    public ResponseEntity<List<Brewery>> getAllBreweries() {
        List<Brewery> breweries = breweryService.getAllBreweries();
        return ResponseEntity.ok(breweries);
    }
    
    /**
     * GET /brewerie/{id} - Obtener una cervecera por ID
     * Nota: El endpoint usa 'brewerie' (sin 's') según especificación del README
     */
    @GetMapping("/brewerie/{id}")
    public ResponseEntity<Brewery> getBreweryById(@PathVariable Integer id) {
        Brewery brewery = breweryService.getBreweryById(id);
        return ResponseEntity.ok(brewery);
    }
}
