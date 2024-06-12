/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.eduprog.anhoescolar.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import pe.edu.pucp.eduprog.anhoescolar.model.AnhoEscolar;
import java.util.ArrayList;
import pe.edu.pucp.eduprog.anhoescolar.dao.AnhoEscolarDAO;
import pe.edu.pucp.eduprog.config.DBManager;
import java.sql.SQLException;

/**
 *
 * @author fransua
 */
public class AnhoEscolarMySQL implements AnhoEscolarDAO{
    private Connection con;
    private Statement st;
    private PreparedStatement pst;
    private CallableStatement cs;
    private ResultSet rs;
    
    @Override
    public int insertar(AnhoEscolar anhoEscolar) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_ANHOESCOLAR"
                    + "(?,?,?)}");
            cs.setInt("_id_anho",anhoEscolar.getAnho());
            cs.setDate("_fecha_inicio", new java.sql.Date(
                    anhoEscolar.getFechaInicio().getTime()));
            cs.setDate("_fecha_fin", new java.sql.Date(
                    anhoEscolar.getFechaFin().getTime()));
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
    public int modificar(AnhoEscolar anhoEScolar) {
        int resultado=0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_PERIODO(?,?,?,?,?,?,?,?)}");
            cs.setInt("_id_cliente", anhoEScolar.getAnho());  
            cs.setDate("_fecha_inicio", new java.sql.Date(anhoEScolar.getFechaInicio().getTime()));
            cs.setDate("_fecha_fin", new java.sql.Date(anhoEScolar.getFechaFin().getTime()));         
            resultado = cs.executeUpdate();
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
    public int eliminar(int anho) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_PERIODO (?)}");
            cs.setInt("_id_anho", anho);
            resultado = cs.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){
                System.out.println(ex.getMessage());
            }
        }
        return resultado;
    }

    @Override
    public ArrayList<AnhoEscolar> listarTodas() {
        ArrayList<AnhoEscolar> anhos =  new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_ANHOS()}");
            rs = cs.executeQuery();
            while(rs.next()){
                AnhoEscolar anho = new AnhoEscolar();
                anho.setAnho(rs.getInt("anho"));
                anho.setFechaInicio(rs.getDate("fecha_inicio"));
                anho.setFechaFin(rs.getDate("fecha_fin"));
                anho.setActivo(rs.getInt("activo"));
                anhos.add(anho);
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return anhos;
    }
    
}
