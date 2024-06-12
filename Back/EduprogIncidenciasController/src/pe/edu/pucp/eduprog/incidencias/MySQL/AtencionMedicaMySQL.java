/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.eduprog.incidencias.MySQL;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.eduprog.config.DBManager;
import pe.edu.pucp.eduprog.incidencias.DAO.AtencionMedicaDAO;
import pe.edu.pucp.eduprog.incidencias.model.AtencionMedica;
import pe.edu.pucp.eduprog.incidencias.model.Incidencia;

/**
 *
 * @author dolso
 */
public class AtencionMedicaMySQL implements AtencionMedicaDAO {
    
    private Connection con;
    private PreparedStatement pst;
    private CallableStatement cs;
    private ResultSet rs;
    
    @Override
    public int insertarAtencion(AtencionMedica atencionMedica,int idAlumno) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call registraAtencionMedica"
                    + "(?,?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("d_idIncidencia", java.sql.Types.INTEGER);
            String tipoString = String.valueOf(atencionMedica.getTipo());
            cs.setString("d_tipo",String.valueOf(atencionMedica.getTipo()));//listo String.valueOf(alumno.getGenero())
            cs.setString("d_descripcion",atencionMedica.getDescripcion());//listo
            cs.setDate("d_fechaRegistro",new java.sql.Date(atencionMedica.getFechaRegistro().getTime()));//listo
            cs.setInt("d_estado",atencionMedica.getEstado());//listo
            cs.setInt("d_docenteRegistro",atencionMedica.getDocenteRegistro());//listo
            cs.setString("d_tipo_ate",atencionMedica.getTipoAtencion());//listo
            cs.setString("d_diagnostico",atencionMedica.getDiagnostico());//listo
            cs.setString("d_tratamiento",atencionMedica.getTratamiento());//listo
            result = cs.executeUpdate();
            
            atencionMedica.setIdIncidencia(cs.getInt("d_idIncidencia"));
            cs = con.prepareCall("{call insertarIncidenciaAlumno"
                    + "(?,?)}");
            cs.setInt("_idIncidencia",atencionMedica.getIdIncidencia());
            cs.setInt("_idAlumno", idAlumno);
            result = cs.executeUpdate();
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return result;
    }
    
    @Override
    public int modificaAtencion(int identificador, AtencionMedica atencionMedica,int idAlumno) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call actualizaAtencionMedica"
                    + "(?,?,?,?)}");
            cs.setInt("d_idIncidencia",identificador);
            cs.setString("d_tipo_ate", atencionMedica.getTipoAtencion());
            cs.setString("d_diagnostico", atencionMedica.getDiagnostico());
            cs.setString("d_tratamiento", atencionMedica.getTratamiento());
            result = cs.executeUpdate();
            
            cs = con.prepareCall("{call insertarIncidenciaAlumno"
                    + "(?,?)}");
            cs.setInt("_idIncidencia",atencionMedica.getIdIncidencia());
            cs.setInt("_idAlumno", idAlumno);
            result = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return result;     
    }
    
    @Override
    public int borrarAtencionMedica(int identificador) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call borrarIncidencia"
                    + "(?)}");
            cs.setInt("d_idIncidencia",identificador);
            result = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return result;
    }
    
    @Override
    public ArrayList<AtencionMedica> listarAtencionMedica(){
        ArrayList<AtencionMedica> atenciones = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ConsultarAtencionMedica()}");
            rs = cs.executeQuery();
            while(rs.next()){
                AtencionMedica atencion = new AtencionMedica();
                atencion.setIdIncidencia(rs.getInt("idIncidencia"));
                atencion.setDescripcion(rs.getString("descripcion_incidencia"));
                atencion.setDocenteRegistro(rs.getInt("docenteRegistro"));
                atencion.setFechaRegistro(rs.getDate("fecha_registro_incidencia"));
                atencion.setTipoAtencion(rs.getString("tipo_incidencia"));
                atencion.setEstado(rs.getInt("estado_incidencia"));
                atencion.setTipo(rs.getString("tipo_atencion_medica").charAt(0));
                atencion.setDiagnostico(rs.getString("diagnostico"));
                atencion.setTratamiento(rs.getString("tratamiento"));
                
                atenciones.add(atencion);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return atenciones;
    }
}
