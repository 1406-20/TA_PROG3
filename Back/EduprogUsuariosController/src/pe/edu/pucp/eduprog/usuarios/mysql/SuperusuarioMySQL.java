/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.eduprog.usuarios.mysql;

import java.io.ByteArrayInputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.CallableStatement;
import java.sql.SQLException;
import pe.edu.pucp.eduprog.config.DBManager;
import pe.edu.pucp.eduprog.usuarios.dao.SuperusuarioDAO;
import pe.edu.pucp.eduprog.usuarios.model.SuperUsuario;
import pe.edu.pucp.eduprog.usuarios.model.TipoTrabajador;
import pe.edu.pucp.eduprog.usuarios.model.Trabajador;
/**
 *
 * @author dolso
 */
public class SuperusuarioMySQL implements SuperusuarioDAO{
    
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;

    @Override
    public int insertar(SuperUsuario superusuario) {
        int resultado = 0;
        try{
            Blob fotoUsuarioBlob = null;
            if (superusuario.getFoto() != null){
                ByteArrayInputStream fotoUsuarioStream = new ByteArrayInputStream(superusuario.getFoto());
                fotoUsuarioBlob = new javax.sql.rowset.serial.SerialBlob((Blob) fotoUsuarioStream);
            }
            con=DBManager.getInstance().getConnection();
            cs=con.prepareCall("{call insertar_superusuario (?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_superusuario", java.sql.Types.INTEGER);
            cs.setString("_nombre", superusuario.getNombre());
            cs.setString("_apellido_paterno", superusuario.getApellidoPaterno());
            cs.setString("_apellido_materno", superusuario.getApellidoMaterno());
            cs.setString("_correo_electronico", superusuario.getCorreoElectronico());
            cs.setString("_contrasenha", superusuario.getContrasenha());
            cs.setDate("_fecha_Creacion", new java.sql.Date(superusuario.getFechaCreacion().getTime()));
            cs.setBoolean("_activo", true);
            cs.setDouble("_sueldo", superusuario.getSueldo());
            cs.setDate("_fecha_contrato", new java.sql.Date(superusuario.getFechaContrato().getTime()));
            cs.setString("_cargo", superusuario.getCargo());
            cs.setString("_area_administrativa", superusuario.getAreaAdministrativa());
            cs.setBlob("_foto", fotoUsuarioBlob);
            cs.executeUpdate();
            superusuario.setIdSuperUsuario(cs.getInt("_id_superusuario"));
            superusuario.setIdPersonal(cs.getInt("_id_superusuario"));
            superusuario.setIdUsuario(cs.getInt("_id_superusuario"));
            resultado=superusuario.getIdUsuario();
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
    public int modificar(SuperUsuario superusuario, byte[]nuevaFoto) {
        int resultado = 0;
        try{
            Blob fotoUsuarioBlob=null;
             if (nuevaFoto != null){
                ByteArrayInputStream fotoUsuarioStream = new ByteArrayInputStream(nuevaFoto);
                fotoUsuarioBlob = new javax.sql.rowset.serial.SerialBlob((Blob) fotoUsuarioStream);
            }else if (superusuario.getFoto() != null){
                ByteArrayInputStream fotoUsuarioStream = new ByteArrayInputStream(superusuario.getFoto());
                fotoUsuarioBlob = new javax.sql.rowset.serial.SerialBlob((Blob) fotoUsuarioStream);
            }
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call actualizar_superusuario (?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setInt("_id_superusuario", superusuario.getIdSuperUsuario());
            cs.setString("_nombre", superusuario.getNombre());
            cs.setString("_apellido_paterno", superusuario.getApellidoPaterno());
            cs.setString("_apellido_materno", superusuario.getApellidoMaterno());
            cs.setString("_correo_electronico", superusuario.getCorreoElectronico());
            cs.setString("_contrasenha", superusuario.getContrasenha());
            cs.setDate("_fecha_Creacion", new java.sql.Date(superusuario.getFechaCreacion().getTime()));
            cs.setDouble("_sueldo",superusuario.getSueldo());        
            cs.setDate("_fecha_contrato", new java.sql.Date(superusuario.getFechaContrato().getTime())); 
            cs.setString("_cargo",superusuario.getCargo()); 
            cs.setString("_area_administrativa",superusuario.getAreaAdministrativa().toString());
            cs.setBlob("_foto", fotoUsuarioBlob);
            resultado = cs.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int eliminar(int idsuperusuario) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call eliminar_superusuario (?)}");
            cs.setInt("_id_superusuario", idsuperusuario);
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
    public ArrayList<SuperUsuario> listarTodos() {
        ArrayList<SuperUsuario> superusuarios = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call mostrar_superusuarios()}");
            rs = cs.executeQuery();
            while(rs.next()){
                SuperUsuario superusuario = new SuperUsuario();
                superusuario.setIdSuperUsuario(rs.getInt("id_superusuario"));
                superusuario.setIdPersonal(rs.getInt("id_superusuario"));
                superusuario.setIdUsuario(rs.getInt("id_superusuario"));
                superusuario.setNombre(rs.getString("nombre"));
                superusuario.setApellidoPaterno(rs.getString("apellido_paterno"));
                superusuario.setApellidoMaterno(rs.getString("apellido_materno"));
                superusuario.setCorreoElectronico(rs.getString("correo_electronico"));
                superusuario.setContrasenha(rs.getString("contrasenha"));
                superusuario.setFechaCreacion(rs.getDate("fecha_Creacion"));
                superusuario.setActivo(rs.getBoolean("activo"));
                superusuario.setSueldo(rs.getDouble("sueldo"));
                superusuario.setFechaContrato(rs.getDate("fecha_contrato"));
                superusuario.setCargo(rs.getString("cargo"));
                superusuario.setAreaAdministrativa(rs.getString("area_administrativa"));
                Blob blob = rs.getBlob("foto");
                byte[] fotoBytes=null;
                if(blob!=null)
                    fotoBytes = blob.getBytes(1, (int) blob.length());
                superusuario.setFoto(fotoBytes);
                superusuarios.add(superusuario);
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return superusuarios;
    }
    
    @Override
    public SuperUsuario obtenerUsuarioPorID(int idUsuario){
        SuperUsuario superUsuario = new SuperUsuario();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call obtenerUsuarioPorID(?,?)}");
            cs.setInt("_idUsuario", idUsuario);
            cs.setString("_tipoUsuario", "superusuario");
            rs = cs.executeQuery();
            while(rs.next()){
                superUsuario.setIdSuperUsuario(rs.getInt("id_superusuario"));
                superUsuario.setIdPersonal(rs.getInt("id_superusuario"));
                superUsuario.setIdUsuario(rs.getInt("id_superusuario"));
                superUsuario.setNombre(rs.getString("nombre"));
                superUsuario.setApellidoPaterno(rs.getString("apellido_paterno"));
                superUsuario.setApellidoMaterno(rs.getString("apellido_materno"));
                superUsuario.setCorreoElectronico(rs.getString("correo_electronico"));
                superUsuario.setContrasenha(rs.getString("contrasenha"));
                superUsuario.setSueldo(rs.getDouble("sueldo"));
                superUsuario.setFechaContrato(rs.getDate("fecha_contrato"));
                superUsuario.setCargo(rs.getString("cargo"));
                superUsuario.setAreaAdministrativa(rs.getString("area_administrativa"));
                Blob blob = rs.getBlob("foto");
                byte[] fotoBytes=null;
                if(blob!=null)
                    fotoBytes = blob.getBytes(1, (int) blob.length());
                superUsuario.setFoto(fotoBytes);
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return superUsuario;
    }
    
}
