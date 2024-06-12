/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.eduprog.publicaciones.MySQL;

import java.io.ByteArrayInputStream;
import java.sql.Blob;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.eduprog.config.DBManager;
import pe.edu.pucp.eduprog.publicaciones.DAO.publicacionesDAO;
import pe.edu.pucp.eduprog.publicaciones.model.Publicaciones;

/**
 *
 * @author josep
 */
public class publicacionesMySQL implements publicacionesDAO{
    
    private Connection con;
    private PreparedStatement pst;
    private CallableStatement cs;
    private ResultSet rs;
    
    @Override
    public int insertar(Publicaciones publicacion, int idUsuario) {
        int resultado = 0;
        try{
            Blob fotoPrincipalBlob = null;
            Blob fotoDescripcionBlob = null;
            if (publicacion.getFotoPrincipal() != null){
                ByteArrayInputStream fotoPrincipalStream = new ByteArrayInputStream(publicacion.getFotoPrincipal());
                //fotoPrincipalBlob = new javax.sql.rowset.serial.SerialBlob((Blob) fotoPrincipalStream);
            }
            
            if (publicacion.getFotoDescripcion() != null){
                ByteArrayInputStream fotoDescripcionStream = new ByteArrayInputStream(publicacion.getFotoDescripcion());
                //fotoDescripcionBlob = new javax.sql.rowset.serial.SerialBlob((Blob) fotoDescripcionStream);
            }
            
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call insertarPublicacion"
                    + "(?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_idPublicacion",
                    java.sql.Types.INTEGER);
            cs.setString("_titulo", publicacion.getTitulo());
            cs.setString("_descripcion", publicacion.getDescripcion());
            cs.setBoolean("_activo", true);
            cs.setInt("_idUsuario",idUsuario);
            cs.setDate("_fecha", new java.sql.Date(publicacion.getFechaPublicacion().getTime()));
            cs.setBytes("_fotoPrincipal", publicacion.getFotoPrincipal());
            cs.setBytes("_fotoDescripcion", publicacion.getFotoDescripcion());
            resultado=cs.executeUpdate();
            publicacion.setIdPublicacion(cs.getInt("_idPublicacion"));   
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
    public int modificar(Publicaciones publicacion, int idUsuario, int idPublicacion, boolean estado) {
        int resultado = 0;
        try{
            Blob fotoPrincipalBlob = null;
            Blob fotoDescripcionBlob = null;
            if (publicacion.getFotoPrincipal() != null){
                ByteArrayInputStream fotoPrincipalStream = new ByteArrayInputStream(publicacion.getFotoPrincipal());
                //fotoPrincipalBlob = new javax.sql.rowset.serial.SerialBlob((Blob) fotoPrincipalStream);
            }
            
            if (publicacion.getFotoDescripcion() != null){
                ByteArrayInputStream fotoDescripcionStream = new ByteArrayInputStream(publicacion.getFotoDescripcion());
                //fotoDescripcionBlob = new javax.sql.rowset.serial.SerialBlob((Blob) fotoDescripcionStream);
            }
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call modificarPublicacion"
                    + "(?,?,?,?,?,?,?,?)}");
            cs.setInt("_idPublicacion", idPublicacion);
            cs.setString("_titulo", publicacion.getTitulo());
            cs.setString("_descripcion", publicacion.getDescripcion());
            cs.setBoolean("_activo", estado);
            cs.setInt("_idUsuario",idUsuario);
            cs.setDate("_fecha", new java.sql.Date(publicacion.getFechaPublicacion().getTime()));
            cs.setBlob("_fotoPrincipal", fotoPrincipalBlob);
            cs.setBlob("_fotoDescripcion", fotoDescripcionBlob);
            cs.executeUpdate();
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
    public int eliminar(int idPublicacion) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call eliminarPublicacion"
                    + "(?)}");
            cs.setInt("_idPublicacion", idPublicacion);
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
    public ArrayList<Publicaciones> listarTodos() {
        ArrayList<Publicaciones> publicaciones = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call listarPublicacion()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Publicaciones publicacion = new Publicaciones();
                publicacion.setIdPublicacion(rs.getInt("idPublicacion"));
                publicacion.setTitulo(rs.getString("titulo"));
                publicacion.setDescripcion(rs.getString("descripcion"));
                publicacion.setActivo(rs.getBoolean("activo"));
                publicacion.setFechaPublicacion(rs.getDate("fecha"));
                Blob blobFotoPrincipal = rs.getBlob("fotoPrincipal");
                if (blobFotoPrincipal != null){
                    int blobLength = (int) blobFotoPrincipal.length();
                    publicacion.setFotoPrincipal(blobFotoPrincipal.getBytes(1, blobLength)) ;
                }
                
                Blob blobFotoDescripcion = rs.getBlob("fotoDescripcion");
                if (blobFotoDescripcion != null){
                    int blobLength2 = (int) blobFotoDescripcion.length();
                    publicacion.setFotoDescripcion(blobFotoDescripcion.getBytes(1, blobLength2));
                }
                
                publicaciones.add(publicacion);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return publicaciones;
    }
    
}
