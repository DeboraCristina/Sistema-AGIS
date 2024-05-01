package edu.fatec.Avaliacao2_LBD.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Presenca {
    private int id;
    private boolean presenca1;
    private boolean presenca2;
    private boolean presenca3;
    private boolean presenca4;
    private String data;
    private int semestre;
}
