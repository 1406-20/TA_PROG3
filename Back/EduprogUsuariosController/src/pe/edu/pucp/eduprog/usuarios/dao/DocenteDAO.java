/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.eduprog.usuarios.dao;

import java.util.ArrayList;
import pe.edu.pucp.eduprog.usuarios.model.Docente;

/**
 *
 * @author dolso
 */
public interface DocenteDAO {
    int insertar (Docente docente);
    int modificar (Docente docente, byte[]nuevaFoto);
    int eliminar (int idDocente);
    ArrayList<Docente> listarTodos();
    Docente obtenerUsuarioPorID(int idUsuario);
    byte [] obtenerFotoHorario(int idDocente);
}
