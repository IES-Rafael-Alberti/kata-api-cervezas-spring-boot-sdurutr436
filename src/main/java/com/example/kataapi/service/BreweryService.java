package com.example.kataapi.service;

import com.example.kataapi.exception.ResourceNotFoundException;
import com.example.kataapi.model.Brewery;
import com.example.kataapi.repository.BreweryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BreweryService {
    
    private final BreweryRepository breweryRepository;
    
    public List<Brewery> getAllBreweries() {
        return breweryRepository.findAll();
    }
    
    public Brewery getBreweryById(Integer id) {
        return breweryRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Cervecera no encontrada con id: " + id));
    }
}
