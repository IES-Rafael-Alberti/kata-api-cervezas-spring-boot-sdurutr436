package com.example.kataapi.controller;

import com.example.kataapi.model.Style;
import com.example.kataapi.service.StyleService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class StyleController {
    
    private final StyleService styleService;
    
    /**
     * GET /styles - Obtener todos los estilos
     */
    @GetMapping("/styles")
    public ResponseEntity<List<Style>> getAllStyles() {
        List<Style> styles = styleService.getAllStyles();
        return ResponseEntity.ok(styles);
    }
    
    /**
     * GET /style/{id} - Obtener un estilo por ID
     */
    @GetMapping("/style/{id}")
    public ResponseEntity<Style> getStyleById(@PathVariable Integer id) {
        Style style = styleService.getStyleById(id);
        return ResponseEntity.ok(style);
    }
}
