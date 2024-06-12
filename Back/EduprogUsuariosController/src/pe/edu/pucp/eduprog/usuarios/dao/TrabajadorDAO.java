/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.eduprog.usuarios.dao;

import java.util.ArrayList;
import pe.edu.pucp.eduprog.usuarios.model.Trabajador;

/**
 *
 * @author dolso
 */
public interface TrabajadorDAO {
    int insertar (Trabajador trabajador);
    int modificar (Trabajador trabajador, byte[]nuevaFoto);
    int eliminar (int idtrabajador);
    ArrayList<Trabajador> listarTodos();
    Trabajador obtenerUsuarioPorID(int idUsuario);
}
