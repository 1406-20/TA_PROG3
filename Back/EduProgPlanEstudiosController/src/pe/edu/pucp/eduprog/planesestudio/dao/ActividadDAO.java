/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.eduprog.planesestudio.dao;

import java.util.ArrayList;
import pe.edu.pucp.eduprog.planestudios.model.Actividad;

/**
 *
 * @author josep
 */
public interface ActividadDAO {
    int insertar(Actividad actividad);
    int modificar(Actividad actividad);
    int eliminar(int actividad);
    ArrayList<Actividad> listarTodas();
}
