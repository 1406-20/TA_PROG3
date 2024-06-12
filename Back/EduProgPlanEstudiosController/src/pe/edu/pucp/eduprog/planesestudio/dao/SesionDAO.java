/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.eduprog.planesestudio.dao;

import java.util.ArrayList;
import pe.edu.pucp.eduprog.planestudios.model.Sesion;

/**
 *
 * @author josep
 */
public interface SesionDAO {
    int insertar(Sesion sesion, ArrayList<Integer> idsAlumno,int idDocente);
    int modificar(Sesion sesion, ArrayList<Integer> idsAlumno, int idDocente, boolean estado);
    int eliminar(int sesion);
    ArrayList<Sesion> listarTodas();
    ArrayList<String> obtenerSesionDocente(int idDocente);
    ArrayList<Sesion> listarSesionesXAlumnoId(int idUsuario);
    ArrayList<Sesion> listarSesionesXDocenteId(int idUsuario);
}
