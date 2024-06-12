/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.eduprog.planesestudio.dao;

import java.util.ArrayList;
import pe.edu.pucp.eduprog.planestudios.model.Curso;

/**
 *
 * @author josep
 */
public interface CursoDAO {
    int insertar(Curso curso, int idDocente);
    int modificar(Curso curso);
    int eliminar(int curso);
    ArrayList<Curso> listarTodas();
    public Curso obtenerCursoXId(int idCurso);
}
