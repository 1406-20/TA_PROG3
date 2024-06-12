/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.eduprog.planesestudio.dao;

import java.util.ArrayList;
import pe.edu.pucp.eduprog.planestudios.model.Tarea;

/**
 *
 * @author josep
 */
public interface TareaDAO {
    int insertar(Tarea tarea,ArrayList<Integer> idsAlumno,int idDocente);
    int modificar(Tarea tarea, ArrayList<Integer> idsAlumno, int idDocente, boolean estado);
    int eliminar(int tarea);
    ArrayList<Tarea> listarTodas();
    ArrayList<Tarea> listarTareasXAlumnoId(int idUsuario);
    ArrayList<Tarea> listarTareasXDocenteId(int idUsuario);
}
