/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.eduprog.incidencias.DAO;

import java.util.ArrayList;
import pe.edu.pucp.eduprog.incidencias.model.Merito;

/**
 *
 * @author dolso
 */
public interface MeritoDAO {
    int insertarMerito(Merito merito,int idAlumno);
    
    int borrarMerito(int idMerito);
    
    int modificaMerito(int identificador,Merito merito);
    
    ArrayList<Merito> listarMerito();
}
