/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.eduprog.planesestudio.mysql;

import java.util.ArrayList;
import pe.edu.pucp.eduprog.planestudios.model.Actividad;
import pe.edu.pucp.eduprog.planesestudio.dao.ActividadDAO;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import pe.edu.pucp.eduprog.config.DBManager;

/**
 *
 * @author josep
 */
public class ActividadMySQL implements ActividadDAO{
    private Connection con;
    private Statement st;
    private ResultSet rs;
    
    @Override
    public int insertar(Actividad actividad){
        int resultado = 0;
        try{
            //Registrar un driver conexion
            Class.forName("com.mysql.cj.jdbc.Driver");
            //Realizamos la conexion
            con = DriverManager.getConnection(DBManager.url,DBManager.user,DBManager.password);
            String sql = "INSERT INTO Actividad(idDocente, idCurso) "
                    + "VALUES(" + actividad.getIdActividad() + ", " + actividad.getCurso().getIdCurso() + ")";
            st = con.createStatement();
            resultado = st.executeUpdate(sql);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }
    
    @Override
    public int modificar(Actividad actividad){
        
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            String sql = "UPDATE Actividad SET idCurso = '" + actividad.getCurso().getIdCurso() + "' WHERE idActividad = " + actividad.getIdActividad() + ";";
            st = con.createStatement();
            resultado = st.executeUpdate(sql);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }
    
    @Override
    public int eliminar(int actividad){
        return 0;
    }
    
    @Override
    public ArrayList<Actividad> listarTodas(){
        ArrayList<Actividad> actividades =  new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            String sql = "SELECT * FROM Actividad WHERE idActividad = 1";
            st = con.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Actividad actividad = new Actividad();
                actividad.setIdActividad(rs.getInt("idActividad"));
                actividades.add(actividad);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{rs.close();}catch(Exception ex){System.out.println(ex.getMessage());}
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return actividades;
    }
    
}
