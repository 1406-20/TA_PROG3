/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.eduprog.usuarios.dao;

import java.util.ArrayList;
import pe.edu.pucp.eduprog.usuarios.model.SuperUsuario;



/**
 *
 * @author dolso
 */
public interface SuperusuarioDAO {
    int insertar (SuperUsuario superusuario);
    int modificar (SuperUsuario superusuario, byte[]nuevaFoto);
    int eliminar (int idsuperusuario);
    ArrayList<SuperUsuario> listarTodos();
    SuperUsuario obtenerUsuarioPorID(int idUsuario);
}
