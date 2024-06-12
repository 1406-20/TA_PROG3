/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.eduprog.anhoescolar.mysql;
import pe.edu.pucp.eduprog.anhoescolar.model.Periodo;
import java.util.ArrayList;
import pe.edu.pucp.eduprog.anhoescolar.dao.PeriodoDAO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.Statement;
import pe.edu.pucp.eduprog.anhoescolar.model.TipoPeriodo;
import pe.edu.pucp.eduprog.config.DBManager;
/**
 *
 * @author fransua
 */
public class PeriodoMySQL implements PeriodoDAO{
    private Statement st;
    private Connection con;
    private PreparedStatement pst;
    private CallableStatement cs;
    private ResultSet rs;
    
    @Override
    public int insertar(Periodo periodo) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_PERIODO"
                    + "(?,?,?,?)}");
            cs.registerOutParameter("_id_periodo",
                    java.sql.Types.INTEGER);
            cs.setInt("_anho",periodo.getAnho().getAnho());
            cs.setDate("_fecha_inicio", new java.sql.Date(
                    periodo.getFechaInicio().getTime()));
            cs.setDate("_fecha_fin", new java.sql.Date(
                    periodo.getFechaFin().getTime()));
            periodo.setIdPeriodo(cs.getInt("_id_periodo"));
            resultado = periodo.getIdPeriodo() ;
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
    public int modificar(Periodo periodo) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_PERIODO(?,?,?,?,?,?,?,?)}");
            cs.setInt("_id_cliente", periodo.getIdPeriodo());
            cs.setString("_tipo", periodo.getTipoPeriodo().toString());   
            cs.setDate("_fecha_inicio", new java.sql.Date(periodo.getFechaInicio().getTime()));
            cs.setDate("_fecha_fin", new java.sql.Date(periodo.getFechaFin().getTime()));         
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int eliminar(int idPeriodo) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_PERIODO (?)}");
            cs.setInt("_id_periodo", idPeriodo);
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
    public ArrayList<Periodo> listarTodas() {
        ArrayList<Periodo> periodos =  new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_PERIODOS()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Periodo periodo = new Periodo();
                periodo.setIdPeriodo(rs.getInt("id_periodo"));
                periodo.setFechaInicio(rs.getDate("fecha_inicio"));
                periodo.setFechaFin(rs.getDate("fecha_fin"));
                periodo.setTipoPeriodo(TipoPeriodo.valueOf(rs.getString("tipo")));
                periodo.getAnho().setAnho(rs.getInt("anho"));
                periodo.setActivo(rs.getInt("activo"));
                periodos.add(periodo);
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return periodos;
    }

    
}
