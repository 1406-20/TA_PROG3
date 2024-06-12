/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.eduprog.planesestudio.mysql;

import java.util.ArrayList;
import pe.edu.pucp.eduprog.config.DBManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import pe.edu.pucp.eduprog.planestudios.model.Sesion;
import java.sql.CallableStatement;
import pe.edu.pucp.eduprog.planesestudio.dao.SesionDAO;

/**
 *
 * @author josep
 */
public class SesionMySQL implements SesionDAO{
    
    private Connection con;
    private Statement st;
    private ResultSet rs;
    private CallableStatement cs;
    
    @Override
    public int insertar(Sesion sesion, ArrayList<Integer> idsAlumno,int idDocente){
        
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call InsertarSesionYActividad"
                    + "(?,?,?,?,?,?)}");
            cs.registerOutParameter("p_idActividad",
                    java.sql.Types.INTEGER);
            cs.registerOutParameter("p_idSesion",
                    java.sql.Types.INTEGER);
            cs.setInt("p_idCurso", sesion.getCurso().getIdCurso());
            cs.setDate("p_fechaInicio", new java.sql.Date(sesion.getFechaInicio().getTime()));
            cs.setDate("p_fechaFin", new java.sql.Date(sesion.getFechaFin().getTime()));
            cs.setString("p_asistencia", "" + sesion.getAsistencia()+"");
            cs.executeUpdate();
            sesion.setIdActividad(cs.getInt("p_idActividad"));
            sesion.setIdSesion(cs.getInt("p_idSesion"));
            
            for(int idAlumno : idsAlumno){
                cs = con.prepareCall("{call insertarActividadAlumno"
                    + "(?,?)}");
                cs.setInt("_idActividad",sesion.getIdActividad());
                cs.setInt("_idAlumno", idAlumno);
                resultado = cs.executeUpdate();
            }   
            
            cs = con.prepareCall("{call insertarDocenteActividad"+ "(?,?)}");
            cs.setInt("_idDocente", idDocente);
            cs.setInt("_idActividad", sesion.getIdActividad());
            
            
            cs = con.prepareCall("{call insertarDocenteActividad"+ "(?,?)}");
            cs.setInt("_idDocente", idDocente);
            cs.setInt("_idActividad", sesion.getIdActividad());
            cs.executeUpdate();
            
            
            resultado = sesion.getIdActividad();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            
            try{con.close();}catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return resultado;
        
    }
    
    @Override
    public int modificar(Sesion sesion, ArrayList<Integer> idsAlumno, int idDocente, boolean estado){
        
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ActualizarSesionYActividad"
                    + "(?,?,?,?,?,?)}");
            cs.setInt("p_idSesion", 1);
            cs.setDate("p_fechaInicio", new java.sql.Date(sesion.getFechaInicio().getTime()));
            cs.setDate("p_fechaFin",new java.sql.Date(sesion.getFechaFin().getTime()));
            cs.setString("p_asistencia", ""+sesion.getAsistencia()+"");
            cs.setInt("p_idActividad", sesion.getIdActividad());
            cs.setInt("p_idCurso", sesion.getCurso().getIdCurso());
            
            cs.execute();
            resultado = sesion.getIdActividad();
            
            cs = con.prepareCall("{call modificarDocenteActividad"+ "(?,?,?)}");
            cs.setInt("_idDocente", idDocente);
            cs.setInt("_idActividad", sesion.getIdActividad());
            cs.setBoolean("_estado", estado);
            cs.executeUpdate();
            
            cs = con.prepareCall("{call modificarActividadAlumnoPrimeraParte"+ "(?)}");
            cs.setInt("_idActividad", sesion.getIdActividad());
            cs.executeUpdate();
            for(int idAlumno : idsAlumno){
                cs = con.prepareCall("{call modificarActividadAlumnoSegundaParte"
                    + "(?,?)}");
                cs.setInt("_idActividad",sesion.getIdActividad());
                cs.setInt("_idAlumno", idAlumno);
                cs.executeUpdate();
            }
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            
            try{con.close();}catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return resultado;
        
//        int resultado = 0;
//        try{
//            con = DBManager.getInstance().getConnection();
//            String sql = "UPDATE Sesion SET asistencia = '" + sesion.getAsistencia() + "' WHERE idActividad = " + sesion.getIdActividad() + ";";
//            st = con.createStatement();
//            resultado = st.executeUpdate(sql);
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }finally{
//            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
//        }
//        return resultado;
        
    }
    
    @Override
    public int eliminar(int sesion){
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call eliminarActividadAlumno"+ "(?)}");
            cs.setInt("_idActividad", sesion);
            resultado=cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            
            try{con.close();}catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return resultado;
    }
    
    @Override
    public ArrayList<Sesion> listarTodas(){
        
        ArrayList<Sesion> sesiones = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_SESION()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Sesion sesion = new Sesion();
                sesion.setIdSesion(rs.getInt("idSesion"));
                sesion.setFechaInicio(rs.getDate("fechaInicio"));
                sesion.setFechaFin( rs.getDate("fechaFin"));
                sesion.setAsistencia(rs.getString("asistencia").charAt(0));
                
                
                sesiones.add(sesion);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return sesiones;
        
//       
    }
    
    @Override
    public ArrayList<String> obtenerSesionDocente(int idDocente) {
        ArrayList<String> sesiones = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call OBTENER_SESION_CURSOXDOCENTE(?)}");
            cs.setInt("p_idDocente", idDocente);
            rs = cs.executeQuery();
            while(rs.next()){
                String cadena = new String();
                String fechaIni = rs.getDate("fechaInicio").toString();
                String fechaFin = rs.getDate("fechaFin").toString();
                String curso = rs.getString("nombreCurso");
                cadena = curso + ";" + fechaIni + ";" + fechaFin;
                sesiones.add(cadena);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return sesiones;
    }
    
    @Override
    public ArrayList<Sesion> listarSesionesXAlumnoId(int idUsuario) {
        ArrayList<Sesion> sesiones = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call listarSesionesXAlumnoId(?)}");
            cs.setInt("_idUsuario", idUsuario);
            rs = cs.executeQuery();
            while(rs.next()){
                Sesion sesion = new Sesion();
                sesion.setFechaInicio(rs.getDate("fechaInicio"));
                sesion.setFechaFin( rs.getDate("fechaFin"));
                sesion.setAsistencia(rs.getString("asistencia").charAt(0));
                sesiones.add(sesion);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return sesiones;
    }

    @Override
    public ArrayList<Sesion> listarSesionesXDocenteId(int idUsuario) {
        ArrayList<Sesion> sesiones = new ArrayList<>();
        try {
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call listarSesionesXDocenteId(?)}");
            cs.setInt("_idUsuario", idUsuario);
            rs = cs.executeQuery();
        
            while (rs.next()) {
                Sesion sesion = new Sesion(); 
                sesion.setFechaInicio(rs.getTimestamp("fechaInicio")); // Asumiendo que fechaInicio es de tipo TIMESTAMP en la base de datos
                sesion.setFechaFin(rs.getTimestamp("fechaFin")); // Asumiendo que fechaFin es de tipo TIMESTAMP en la base de datos
                sesion.setAsistencia(rs.getString("asistencia").charAt(0)); // Asumiendo que asistencia es un char en la base de datos
                sesiones.add(sesion);
            }
        } catch (Exception ex) {
            System.out.println("Error al listar sesiones del docente: " + ex.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (cs != null) cs.close();
                if (con != null) con.close();
            }   catch (Exception ex) {
                System.out.println("Error al cerrar recursos: " + ex.getMessage());
            }
        }
    return sesiones;
    }
    
    
}
