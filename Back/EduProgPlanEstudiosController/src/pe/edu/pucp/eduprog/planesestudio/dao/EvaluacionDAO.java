/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.eduprog.planesestudio.dao;

import java.util.ArrayList;
import pe.edu.pucp.eduprog.planestudios.model.Evaluacion;

/**
 *
 * @author josep
 */
public interface EvaluacionDAO {
    int insertar(Evaluacion evaluacion, ArrayList<Integer> idsAlumno, int idDocente);
    int modificar(Evaluacion evaluacion, ArrayList<Integer> idsAlumno, int idDocente, boolean estado);
    int eliminar(int evaluacion);
    ArrayList<Evaluacion> listarTodas();
    ArrayList<String> listarNotasxAlumno(int id);
}
