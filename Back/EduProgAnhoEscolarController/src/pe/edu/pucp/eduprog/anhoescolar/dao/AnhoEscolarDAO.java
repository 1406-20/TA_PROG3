/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.eduprog.anhoescolar.dao;

import pe.edu.pucp.eduprog.anhoescolar.model.AnhoEscolar;
import java.util.ArrayList;

/**
 *
 * @author fransua
 */
public interface AnhoEscolarDAO {
    int insertar(AnhoEscolar anhoEScolar);
    int modificar(AnhoEscolar anhoEScolar);
    int eliminar(int idAnhoEscolaar);
    ArrayList<AnhoEscolar>listarTodas();
}
