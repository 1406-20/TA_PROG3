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
import pe.edu.pucp.eduprog.incidencias.DAO.DemeritoDAO;
import pe.edu.pucp.eduprog.incidencias.model.Demerito;
import pe.edu.pucp.eduprog.incidencias.model.Incidencia;
import pe.edu.pucp.eduprog.incidencias.model.Merito;

/**
 *
 * @author dolso
 */
public class DemeritoMySQL implements DemeritoDAO{
    private Connection con;
    private PreparedStatement pst;
    private CallableStatement cs;
    private ResultSet rs;

    @Override
    public int insertarDemerito(Demerito demerito,int idAlumno) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call registraMeritoDemerito"
                    + "(?,?,?,?,?,?,?)}");
            String tipoString = String.valueOf(demerito.getTipo());
            cs.setString("d_tipo",String.valueOf(demerito.getTipo()));
            cs.setString("d_descripcion",demerito.getDescripcion());//listo
            cs.setDate("d_fechaRegistro",new java.sql.Date(demerito.getFechaRegistro().getTime()));//listo
            cs.setInt("d_estado",demerito.getEstado());//listo
            cs.setInt("d_docenteRegistro",demerito.getDocenteRegistro());//listo
            cs.setString("d_comentario",demerito.getComentario());//listo
            result = cs.executeUpdate();
            demerito.setIdIncidencia(cs.getInt("d_idIncidencia"));
            cs = con.prepareCall("{call insertarIncidenciaAlumno"
                    + "(?,?)}");
            cs.setInt("_idIncidencia",demerito.getIdIncidencia());
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
    public int borrarDemerito(int idDemerito) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call borrarIncidencia"
                    + "(?)}");
            cs.setInt("d_idIncidencia",idDemerito);
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
    public int modificaDemerito(int identificador,Demerito demerito) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call actualizaMeriDemeri"
                    + "(?,?,?)}");
            cs.setInt("d_idIncidencia",identificador);
            String tipoString = String.valueOf(demerito.getTipo());
            cs.setString("d_tipo",String.valueOf(demerito.getTipo()));
            cs.setString("d_comentario",demerito.getComentario());
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
    public ArrayList<Demerito> listarDemerito(){
        ArrayList<Demerito> demeritos = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ConsultarDemerito()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Demerito demerito = new Demerito();
                demerito.setIdIncidencia(rs.getInt("i.idIncidencia"));
                demerito.setDescripcion(rs.getString("i.descripcion"));
                demerito.setDocenteRegistro(rs.getInt("i.docenteRegistro"));
                demerito.setFechaRegistro(rs.getDate("i.fechaRegistro"));
                demerito.setEstado(rs.getInt("i.estado"));
                demerito.setTipo(rs.getString("md.tipo").charAt(0));
                
                demeritos.add(demerito);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return demeritos;
    }
}
