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
import pe.edu.pucp.eduprog.planestudios.model.Tarea;
import pe.edu.pucp.eduprog.planestudios.model.TipoTarea;
import java.sql.CallableStatement;
import pe.edu.pucp.eduprog.planesestudio.dao.TareaDAO;

/**
 *
 * @author josep
 */
public class TareaMySQL implements TareaDAO{
    
    private Connection con;
    private Statement st;
    private ResultSet rs;
    private CallableStatement cs;
    
    @Override
    public int insertar(Tarea tarea, ArrayList<Integer> idsAlumno, int idDocente){
        
        int resultado = 0;
        try{
            String cadena;
            if(tarea.getTipoTarea()==TipoTarea.DESARROLLAR) cadena = "Desarrollar";
            else if(tarea.getTipoTarea()==TipoTarea.MARCAR_COMPLETADA) cadena = "Completado";
            else cadena = "Enviar solucionario";
            
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call InsertarTareaYActividad"
                    + "(?,?,?,?,?,?,?)}");
            cs.registerOutParameter("p_idActividad",
                    java.sql.Types.INTEGER);
            cs.registerOutParameter("p_idTarea",
                    java.sql.Types.INTEGER);
            cs.setInt("p_idCurso", tarea.getCurso().getIdCurso());
            cs.setString("p_descripcion", tarea.getDescripcion());
            cs.setDate("p_fechaRegistro", new java.sql.Date(tarea.getFechaRegistro().getTime()));
            cs.setString("p_tipoTarea", cadena);
            cs.setString("p_estado", tarea.getEstado());
            cs.executeUpdate();
            tarea.setIdActividad(cs.getInt("p_idActividad"));
            tarea.setIdTarea(cs.getInt("p_idTarea"));
            for(int idAlumno : idsAlumno){
                cs = con.prepareCall("{call insertarActividadAlumno"
                    + "(?,?)}");
                cs.setInt("_idActividad",tarea.getIdActividad());
                cs.setInt("_idAlumno", idAlumno);
                resultado = cs.executeUpdate();
            }   
            
            cs = con.prepareCall("{call insertarDocenteActividad"+ "(?,?)}");
            cs.setInt("_idDocente", idDocente);
            cs.setInt("_idActividad", tarea.getIdActividad());
            cs.executeUpdate();
            
            resultado = tarea.getIdActividad();
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
    public int modificar(Tarea tarea, ArrayList<Integer> idsAlumno, int idDocente, boolean estado){
        
        int resultado = 0;
        try{
            String cadena;
            if(tarea.getTipoTarea()==TipoTarea.DESARROLLAR) cadena = "Desarrollar";
            else if(tarea.getTipoTarea()==TipoTarea.MARCAR_COMPLETADA) cadena = "Completado";
            else cadena = "Enviar solucionario";
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ActualizarTareaYActividad"
                    + "(?,?,?,?,?,?,?)}");
            cs.setInt("p_idTarea", tarea.getIdTarea());
            cs.setString("p_descripcion", tarea.getDescripcion());
            cs.setDate("p_fechaRegistro", new java.sql.Date(tarea.getFechaRegistro().getTime()));
            cs.setString("p_tipoTarea", cadena);
            cs.setString("p_estado",tarea.getEstado());
            cs.setInt("p_idActividad", tarea.getIdActividad());
            cs.setInt("p_idCurso",tarea.getCurso().getIdCurso());
            
            
//            cs.setString("p_tipoTarea", cadena);
//            cs.setString("p_estado", tarea.getEstado());
            
            cs.executeUpdate();
            resultado = tarea.getIdActividad();
            
            cs = con.prepareCall("{call modificarDocenteActividad"+ "(?,?,?)}");
            cs.setInt("_idDocente", idDocente);
            cs.setInt("_idActividad", tarea.getIdActividad());
            cs.setBoolean("_estado", estado);
            cs.executeUpdate();
            
            cs = con.prepareCall("{call modificarActividadAlumnoPrimeraParte"+ "(?)}");
            cs.setInt("_idActividad", tarea.getIdActividad());
            cs.executeUpdate();
            for(int idAlumno : idsAlumno){
                cs = con.prepareCall("{call modificarActividadAlumnoSegundaParte"
                    + "(?,?)}");
                cs.setInt("_idActividad",tarea.getIdActividad());
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
        
    }
    
    @Override
    public int eliminar(int tarea){
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call eliminarActividadAlumno"+ "(?)}");
            cs.setInt("_idActividad", tarea);
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
    public ArrayList<Tarea> listarTodas(){
        
        ArrayList<Tarea> tareas = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_TAREA()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Tarea tarea = new Tarea();
                tarea.setIdActividad(rs.getInt("idTarea"));
                tarea.setFechaRegistro(rs.getDate("fechaRegistro"));
                String cadena = rs.getString("tipoTarea");
                tarea.setDescripcion(rs.getString("descripcion"));
                if(cadena == "Desarrollar") tarea.setTipoTarea(TipoTarea.DESARROLLAR);
                else if(cadena == "Completado" ) tarea.setTipoTarea(TipoTarea.MARCAR_COMPLETADA);
                else tarea.setTipoTarea(TipoTarea.ENVIAR_SOLUCIONARIO);
//                tarea.setDescripcion(rs.getString("descripcion"));
                tarea.setEstado(rs.getString("estado"));
                
                tareas.add(tarea);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return tareas;
        
        
    }
    
    @Override
    public ArrayList<Tarea> listarTareasXAlumnoId(int idUsuario) {
        ArrayList<Tarea> tareas = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call listarTareasXAlumnoId(?)}");
            cs.setInt("_idUsuario", idUsuario);
            rs = cs.executeQuery();
            while(rs.next()){
                Tarea tarea = new Tarea();
                tarea.setFechaRegistro(rs.getDate("fechaRegistro"));
                String cadena = rs.getString("tipoTarea");
                tarea.setDescripcion(rs.getString("descripcion"));
                if(cadena == "Desarrollar") tarea.setTipoTarea(TipoTarea.DESARROLLAR);
                else if(cadena == "Completado" ) tarea.setTipoTarea(TipoTarea.MARCAR_COMPLETADA);
                else tarea.setTipoTarea(TipoTarea.ENVIAR_SOLUCIONARIO);
                tarea.setEstado(rs.getString("estado"));
                tareas.add(tarea);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return tareas;
    }

    @Override
    public ArrayList<Tarea> listarTareasXDocenteId(int idUsuario) {
        ArrayList<Tarea> tareas = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call listarTareasXDocenteId(?)}");
            cs.setInt("_idUsuario", idUsuario);
            rs = cs.executeQuery();
            while(rs.next()){
                Tarea tarea = new Tarea();
                tarea.setFechaRegistro(rs.getDate("fechaRegistro"));
                String cadena = rs.getString("tipoTarea");
                tarea.setDescripcion(rs.getString("descripcion"));
                if(cadena == "Desarrollar") tarea.setTipoTarea(TipoTarea.DESARROLLAR);
                else if(cadena == "Completado" ) tarea.setTipoTarea(TipoTarea.MARCAR_COMPLETADA);
                else tarea.setTipoTarea(TipoTarea.ENVIAR_SOLUCIONARIO);
                tarea.setEstado(rs.getString("estado"));
                tareas.add(tarea);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return tareas;
    }
    
}
