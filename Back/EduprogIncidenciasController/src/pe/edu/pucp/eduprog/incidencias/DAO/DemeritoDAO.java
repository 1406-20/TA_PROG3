/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.eduprog.incidencias.DAO;

import java.util.ArrayList;
import pe.edu.pucp.eduprog.incidencias.model.Demerito;
import pe.edu.pucp.eduprog.incidencias.model.Incidencia;
import pe.edu.pucp.eduprog.incidencias.model.Merito;

/**
 *
 * @author dolso
 */
public interface DemeritoDAO {
    int insertarDemerito(Demerito demerito,int idAlumno);
    
    int borrarDemerito(int idDemerito);
    
    int modificaDemerito(int idDemerito,Demerito demerito);
    
    ArrayList<Demerito> listarDemerito();
}
