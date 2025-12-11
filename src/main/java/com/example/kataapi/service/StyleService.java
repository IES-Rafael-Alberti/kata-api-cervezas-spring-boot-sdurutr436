package com.example.kataapi.service;

import com.example.kataapi.exception.ResourceNotFoundException;
import com.example.kataapi.model.Style;
import com.example.kataapi.repository.StyleRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class StyleService {
    
    private final StyleRepository styleRepository;
    
    public List<Style> getAllStyles() {
        return styleRepository.findAll();
    }
    
    public Style getStyleById(Integer id) {
        return styleRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Estilo no encontrado con id: " + id));
    }
}
