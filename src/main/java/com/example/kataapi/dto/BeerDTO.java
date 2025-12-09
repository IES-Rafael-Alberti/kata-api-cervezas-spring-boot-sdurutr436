package com.example.kataapi.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BeerDTO {
    
    private Integer id;
    
    @NotNull(message = "El ID de la cervecera es obligatorio")
    private Integer breweryId;
    
    @NotBlank(message = "El nombre de la cerveza es obligatorio")
    private String name;
    
    @NotNull(message = "El ID de la categoría es obligatorio")
    private Integer catId;
    
    @NotNull(message = "El ID del estilo es obligatorio")
    private Integer styleId;
    
    @NotNull(message = "El ABV es obligatorio")
    private Float abv;
    
    @NotNull(message = "El IBU es obligatorio")
    private Float ibu;
    
    @NotNull(message = "El SRM es obligatorio")
    private Float srm;
    
    private Integer upc;
    private String filepath;
    private String descript;
    private Integer addUser;
}
