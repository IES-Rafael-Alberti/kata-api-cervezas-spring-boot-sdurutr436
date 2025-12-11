package com.example.kataapi.controller;

import com.example.kataapi.dto.BeerDTO;
import com.example.kataapi.model.Beer;
import com.example.kataapi.service.BeerService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class BeerController {
    
    private final BeerService beerService;
    
    /**
     * GET /beers - Obtener todas las cervezas
     */
    @GetMapping("/beers")
    public ResponseEntity<List<Beer>> getAllBeers() {
        List<Beer> beers = beerService.getAllBeers();
        return ResponseEntity.ok(beers);
    }
    
    /**
     * GET /beer/{id} - Obtener una cerveza por ID
     */
    @GetMapping("/beer/{id}")
    public ResponseEntity<Beer> getBeerById(@PathVariable Integer id) {
        Beer beer = beerService.getBeerById(id);
        return ResponseEntity.ok(beer);
    }
    
    /**
     * POST /beer - Crear una nueva cerveza
     */
    @PostMapping("/beer")
    public ResponseEntity<Beer> createBeer(@Valid @RequestBody BeerDTO beerDTO) {
        Beer createdBeer = beerService.createBeer(beerDTO);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdBeer);
    }
    
    /**
     * PUT /beer/{id} - Actualizar completamente una cerveza
     */
    @PutMapping("/beer/{id}")
    public ResponseEntity<Beer> updateBeer(@PathVariable Integer id, @Valid @RequestBody BeerDTO beerDTO) {
        Beer updatedBeer = beerService.updateBeer(id, beerDTO);
        return ResponseEntity.ok(updatedBeer);
    }
    
    /**
     * PATCH /beer/{id} - Actualizar parcialmente una cerveza
     */
    @PatchMapping("/beer/{id}")
    public ResponseEntity<Beer> partialUpdateBeer(@PathVariable Integer id, @RequestBody BeerDTO beerDTO) {
        Beer updatedBeer = beerService.partialUpdateBeer(id, beerDTO);
        return ResponseEntity.ok(updatedBeer);
    }
    
    /**
     * DELETE /beer/{id} - Eliminar una cerveza
     */
    @DeleteMapping("/beer/{id}")
    public ResponseEntity<Void> deleteBeer(@PathVariable Integer id) {
        beerService.deleteBeer(id);
        return ResponseEntity.noContent().build();
    }
}
