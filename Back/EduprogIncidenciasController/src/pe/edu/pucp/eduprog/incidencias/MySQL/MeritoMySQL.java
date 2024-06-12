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
import pe.edu.pucp.eduprog.incidencias.DAO.MeritoDAO;
import pe.edu.pucp.eduprog.incidencias.model.Demerito;
import pe.edu.pucp.eduprog.incidencias.model.Incidencia;
import pe.edu.pucp.eduprog.incidencias.model.Merito;

/**
 *
 * @author dolso
 */
public class MeritoMySQL implements MeritoDAO{
    private Connection con;
    private PreparedStatement pst;
    private CallableStatement cs;
    private ResultSet rs;

    @Override
    public int insertarMerito(Merito merito,int idAlumno){
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call registraMeritoDemerito"
                    + "(?,?,?,?,?,?,?)}");
            String tipoString = String.valueOf(merito.getTipo());
            cs.setString("d_tipo",String.valueOf(merito.getTipo()));
            cs.setString("d_descripcion",merito.getDescripcion());//listo
            cs.setDate("d_fechaRegistro",new java.sql.Date(merito.getFechaRegistro().getTime()));//listo
            cs.setInt("d_estado",merito.getEstado());//listo
            cs.setInt("d_docenteRegistro",merito.getDocenteRegistro());//listo
            cs.setString("d_comentario",merito.getComentario());   //listo
            result = cs.executeUpdate();
            
            merito.setIdIncidencia(cs.getInt("d_idIncidencia"));
            cs = con.prepareCall("{call insertarIncidenciaAlumno"
                    + "(?,?)}");
            cs.setInt("_idIncidencia",merito.getIdIncidencia());
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
    public int borrarMerito(int idMerito) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call borrarIncidencia"
                    + "(?)}");
            cs.setInt("d_idIncidencia",idMerito);
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
    public int modificaMerito(int identificador,Merito merito) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call actualizaMeriDemeri"
                    + "(?,?,?)}");
            cs.setInt("d_idIncidencia",identificador);
            String tipoString = String.valueOf(merito.getTipo());
            cs.setString("d_tipo",String.valueOf(merito.getTipo()));
            cs.setString("d_comentario",merito.getComentario());
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
    
    public ArrayList<Merito> listarMerito(){
        ArrayList<Merito> meritos = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ConsultarMerito()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Merito merito = new Merito();
                merito.setIdIncidencia(rs.getInt("i.idIncidencia"));
                merito.setDescripcion(rs.getString("i.descripcion"));
                merito.setDocenteRegistro(rs.getInt("i.docenteRegistro"));
                merito.setFechaRegistro(rs.getDate("i.fechaRegistro"));
                merito.setEstado(rs.getInt("i.estado"));
                merito.setTipo(rs.getString("i.tipo").charAt(0));
                
                meritos.add(merito);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return meritos;
    }
}
