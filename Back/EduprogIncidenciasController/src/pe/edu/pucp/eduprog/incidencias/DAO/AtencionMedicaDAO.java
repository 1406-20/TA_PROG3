/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.eduprog.incidencias.DAO;

import pe.edu.pucp.eduprog.incidencias.model.AtencionMedica;
import pe.edu.pucp.eduprog.incidencias.model.Incidencia;
import java.util.ArrayList;

/**
 *
 * @author dolso
 */
public interface AtencionMedicaDAO {
    int insertarAtencion(AtencionMedica atencionMedica,int idAlumno);
    
    int modificaAtencion(int identificador, AtencionMedica atencionMedica,int idAlumno);
    
    int borrarAtencionMedica(int identificador);
    
    ArrayList<AtencionMedica> listarAtencionMedica();
    
    
}
