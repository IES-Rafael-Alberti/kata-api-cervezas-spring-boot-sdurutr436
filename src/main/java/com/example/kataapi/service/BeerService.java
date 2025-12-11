package com.example.kataapi.service;

import com.example.kataapi.dto.BeerDTO;
import com.example.kataapi.exception.ResourceNotFoundException;
import com.example.kataapi.model.Beer;
import com.example.kataapi.repository.BeerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BeerService {
    
    private final BeerRepository beerRepository;
    
    public List<Beer> getAllBeers() {
        return beerRepository.findAll();
    }
    
    public Beer getBeerById(Integer id) {
        return beerRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Cerveza no encontrada con id: " + id));
    }
    
    @Transactional
    public Beer createBeer(BeerDTO beerDTO) {
        Beer beer = new Beer();
        beer.setBreweryId(beerDTO.getBreweryId());
        beer.setName(beerDTO.getName());
        beer.setCatId(beerDTO.getCatId());
        beer.setStyleId(beerDTO.getStyleId());
        beer.setAbv(beerDTO.getAbv());
        beer.setIbu(beerDTO.getIbu());
        beer.setSrm(beerDTO.getSrm());
        beer.setUpc(beerDTO.getUpc());
        beer.setFilepath(beerDTO.getFilepath());
        beer.setDescript(beerDTO.getDescript());
        beer.setAddUser(beerDTO.getAddUser());
        
        return beerRepository.save(beer);
    }
    
    @Transactional
    public Beer updateBeer(Integer id, BeerDTO beerDTO) {
        Beer beer = getBeerById(id);
        
        beer.setBreweryId(beerDTO.getBreweryId());
        beer.setName(beerDTO.getName());
        beer.setCatId(beerDTO.getCatId());
        beer.setStyleId(beerDTO.getStyleId());
        beer.setAbv(beerDTO.getAbv());
        beer.setIbu(beerDTO.getIbu());
        beer.setSrm(beerDTO.getSrm());
        beer.setUpc(beerDTO.getUpc());
        beer.setFilepath(beerDTO.getFilepath());
        beer.setDescript(beerDTO.getDescript());
        beer.setAddUser(beerDTO.getAddUser());
        
        return beerRepository.save(beer);
    }
    
    @Transactional
    public Beer partialUpdateBeer(Integer id, BeerDTO beerDTO) {
        Beer beer = getBeerById(id);
        
        if (beerDTO.getBreweryId() != null) beer.setBreweryId(beerDTO.getBreweryId());
        if (beerDTO.getName() != null) beer.setName(beerDTO.getName());
        if (beerDTO.getCatId() != null) beer.setCatId(beerDTO.getCatId());
        if (beerDTO.getStyleId() != null) beer.setStyleId(beerDTO.getStyleId());
        if (beerDTO.getAbv() != null) beer.setAbv(beerDTO.getAbv());
        if (beerDTO.getIbu() != null) beer.setIbu(beerDTO.getIbu());
        if (beerDTO.getSrm() != null) beer.setSrm(beerDTO.getSrm());
        if (beerDTO.getUpc() != null) beer.setUpc(beerDTO.getUpc());
        if (beerDTO.getFilepath() != null) beer.setFilepath(beerDTO.getFilepath());
        if (beerDTO.getDescript() != null) beer.setDescript(beerDTO.getDescript());
        if (beerDTO.getAddUser() != null) beer.setAddUser(beerDTO.getAddUser());
        
        return beerRepository.save(beer);
    }
    
    @Transactional
    public void deleteBeer(Integer id) {
        Beer beer = getBeerById(id);
        beerRepository.delete(beer);
    }
}
