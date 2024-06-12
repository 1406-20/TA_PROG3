/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.eduprog.publicaciones.DAO;

import java.util.ArrayList;
import pe.edu.pucp.eduprog.publicaciones.model.Publicaciones;

/**
 *
 * @author josep
 */
public interface publicacionesDAO {
    public int insertar (Publicaciones publicacion, int idUsuario);
    public int modificar (Publicaciones publicacion, int idUsuario, int idPublicacion, boolean estado);
    public int eliminar (int idPublicacion);
    ArrayList<Publicaciones> listarTodos();
}
