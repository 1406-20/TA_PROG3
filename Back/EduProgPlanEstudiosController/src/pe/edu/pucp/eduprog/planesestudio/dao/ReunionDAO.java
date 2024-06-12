/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.eduprog.planesestudio.dao;

import java.util.ArrayList;
import pe.edu.pucp.eduprog.planestudios.model.Reunion;

/**
 *
 * @author josep
 */
public interface ReunionDAO {
    int insertar(Reunion reunion, ArrayList<Integer> idsAlumno, int idDocente);
    int modificar(Reunion reunion, ArrayList<Integer> idsAlumno, int idDocente, boolean estado);
    int eliminar(int reunion);
    ArrayList<Reunion> listarTodas();
}
