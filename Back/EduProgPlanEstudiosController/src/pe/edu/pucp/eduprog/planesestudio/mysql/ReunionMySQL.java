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
import pe.edu.pucp.eduprog.planestudios.model.Reunion;
import pe.edu.pucp.eduprog.planesestudio.dao.ReunionDAO;
import java.sql.CallableStatement;

/**
 *
 * @author josep
 */
public class ReunionMySQL implements ReunionDAO{
    
    private Connection con;
    private Statement st;
    private ResultSet rs;
    private CallableStatement cs;
    
    @Override
    public int insertar(Reunion reunion, ArrayList<Integer> idsAlumno, int idDocente){
        
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call InsertarReunionYActividad"
                    + "(?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("p_idActividad",
                    java.sql.Types.INTEGER);
            cs.registerOutParameter("p_idReunion",
                    java.sql.Types.INTEGER);
            cs.setInt("p_idCurso", reunion.getCurso().getIdCurso());
            cs.setString("p_lugar", reunion.getLugar());
            cs.setString("p_asunto", reunion.getAsunto());
            cs.setString("p_descripcion", reunion.getDescripcion());
            cs.setInt("p_duracionMinutos", reunion.getDuracionMinutos());
            cs.setString("p_organizador", reunion.getOrganizador());
            cs.executeUpdate();
            reunion.setIdActividad(cs.getInt("p_idActividad"));
            reunion.setIdReunion(cs.getInt("p_idReunion"));
            
            for(int idAlumno : idsAlumno){
                cs = con.prepareCall("{call insertarActividadAlumno"
                    + "(?,?)}");
                cs.setInt("_idActividad",reunion.getIdActividad());
                cs.setInt("_idAlumno", idAlumno);
                resultado = cs.executeUpdate();
            }   
            
            cs = con.prepareCall("{call insertarDocenteActividad"+ "(?,?)}");
            cs.setInt("_idDocente", idDocente);
            cs.setInt("_idActividad", reunion.getIdActividad());
            cs.executeUpdate();
            
            resultado = reunion.getIdActividad();
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
    public int modificar(Reunion reunion, ArrayList<Integer> idsAlumno, int idDocente, boolean estado){
        
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ActualizarReunionYActividad"
                    + "(?,?,?,?,?,?,?,?)}");
            cs.setInt("p_idReunion", 1);
            cs.setInt("p_idActividad", reunion.getIdActividad());
            cs.setString("p_lugar",reunion.getLugar());
            cs.setString("p_asunto", reunion.getAsunto());
            cs.setString("p_descripcion", reunion.getDescripcion());
            cs.setInt("p_duracionMinutos", reunion.getDuracionMinutos());
            cs.setString("p_organizador", reunion.getOrganizador());
            cs.setInt("p_idCurso", reunion.getCurso().getIdCurso());
            cs.execute();
            resultado = reunion.getIdActividad();
            
            
            
            cs = con.prepareCall("{call modificarDocenteActividad"+ "(?,?,?)}");
            cs.setInt("_idDocente", idDocente);
            cs.setInt("_idActividad", reunion.getIdActividad());
            cs.setBoolean("_estado", estado);
            cs.executeUpdate();
            
            cs = con.prepareCall("{call modificarActividadAlumnoPrimeraParte"+ "(?)}");
            cs.setInt("_idActividad", reunion.getIdActividad());
            cs.executeUpdate();
            for(int idAlumno : idsAlumno){
                cs = con.prepareCall("{call modificarActividadAlumnoSegundaParte"
                    + "(?,?)}");
                cs.setInt("_idActividad",reunion.getIdActividad());
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
    public int eliminar(int reunion){
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call eliminarActividadAlumno"+ "(?)}");
            cs.setInt("_idActividad", reunion);
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
    public ArrayList<Reunion> listarTodas(){
        
        ArrayList<Reunion> reuniones = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_REUNION()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Reunion reunion = new Reunion();
                reunion.setIdReunion(rs.getInt("idReunion"));
                reunion.setLugar(rs.getString("lugar"));
                reunion.setAsunto(rs.getString("asunto"));
                reunion.setDescripcion(rs.getString("descripcion"));
                reunion.setDuracionMinutos(rs.getInt("duracionMinutos"));
                reunion.setOrganizador(rs.getString("organizador"));
                
                reuniones.add(reunion);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return reuniones;
        
    }
    
}
