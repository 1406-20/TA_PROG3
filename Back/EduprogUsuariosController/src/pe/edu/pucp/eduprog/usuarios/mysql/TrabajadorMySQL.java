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
import pe.edu.pucp.eduprog.usuarios.dao.TrabajadorDAO;
import pe.edu.pucp.eduprog.usuarios.model.TipoTrabajador;
import pe.edu.pucp.eduprog.usuarios.model.Trabajador;

/**
 *
 * @author dolso
 */
public class TrabajadorMySQL implements TrabajadorDAO{

    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    
    @Override
    public int insertar(Trabajador trabajador) {
        int resultado = 0;
        try{
            Blob fotoUsuarioBlob = null;
            if (trabajador.getFoto() != null){
                ByteArrayInputStream fotoUsuarioStream = new ByteArrayInputStream(trabajador.getFoto());
                fotoUsuarioBlob = new javax.sql.rowset.serial.SerialBlob((Blob) fotoUsuarioStream);
            }
            con=DBManager.getInstance().getConnection();
            cs=con.prepareCall("{call insertar_trabajador (?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_trabajador", java.sql.Types.INTEGER);
            cs.setString("_nombre", trabajador.getNombre());
            cs.setString("_apellido_paterno", trabajador.getApellidoPaterno());
            cs.setString("_apellido_materno", trabajador.getApellidoPaterno());
            cs.setString("_correo_electronico", trabajador.getCorreoElectronico());
            cs.setString("_contrasenha", trabajador.getContrasenha());
            cs.setDate("_fecha_Creacion", new java.sql.Date(trabajador.getFechaCreacion().getTime()));
            cs.setBoolean("_activo", true);
            cs.setDouble("_sueldo", trabajador.getSueldo());
            cs.setDate("_fecha_contrato", new java.sql.Date(trabajador.getFechaContrato().getTime()));
            cs.setString("_cargo", trabajador.getCargo());
            cs.setString("_tipo_trabajador", trabajador.getTipoTrabajador().toString());
            cs.setBlob("_foto", fotoUsuarioBlob);
            cs.executeUpdate();
            trabajador.setIdTrabajador(cs.getInt("_id_trabajador"));
            trabajador.setIdPersonal(cs.getInt("_id_trabajador"));
            trabajador.setIdUsuario(cs.getInt("_id_trabajador"));
            resultado=trabajador.getIdUsuario();
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
    public int modificar(Trabajador trabajador, byte[]nuevaFoto) {
        int resultado = 0;
        try{
            Blob fotoUsuarioBlob=null;
             if (nuevaFoto != null){
                ByteArrayInputStream fotoUsuarioStream = new ByteArrayInputStream(nuevaFoto);
                fotoUsuarioBlob = new javax.sql.rowset.serial.SerialBlob((Blob) fotoUsuarioStream);
            }else if(trabajador.getFoto() != null){
                ByteArrayInputStream fotoUsuarioStream = new ByteArrayInputStream(trabajador.getFoto());
                fotoUsuarioBlob = new javax.sql.rowset.serial.SerialBlob((Blob) fotoUsuarioStream);
            }
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call actualizar_trabajador (?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setInt("_id_trabajador", trabajador.getIdTrabajador());
            cs.setString("_nombre", trabajador.getNombre());
            cs.setString("_apellido_paterno", trabajador.getApellidoPaterno());
            cs.setString("_apellido_materno", trabajador.getApellidoMaterno());
            cs.setString("_correo_electronico", trabajador.getCorreoElectronico());
            cs.setString("_contrasenha", trabajador.getContrasenha());
            cs.setDate("_fecha_Creacion", new java.sql.Date(trabajador.getFechaCreacion().getTime()));
            cs.setDouble("_sueldo",trabajador.getSueldo());        
            cs.setDate("_fecha_contrato", new java.sql.Date(trabajador.getFechaContrato().getTime())); 
            cs.setString("_cargo",trabajador.getCargo()); 
            cs.setString("_tipo_trabajador",trabajador.getTipoTrabajador().toString());
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
    public int eliminar(int idtrabajador) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call eliminar_trabajador (?)}");
            cs.setInt("_id_trabajador", idtrabajador);
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
    public ArrayList<Trabajador> listarTodos() {
        ArrayList<Trabajador> trabajadores = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call mostrar_trabajadores()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Trabajador trabajador = new Trabajador();
                trabajador.setIdTrabajador(rs.getInt("id_trabajador"));
                trabajador.setIdPersonal(rs.getInt("id_trabajador"));
                trabajador.setIdUsuario(rs.getInt("id_trabajador"));
                trabajador.setNombre(rs.getString("nombre"));
                trabajador.setApellidoPaterno(rs.getString("apellido_paterno"));
                trabajador.setApellidoMaterno(rs.getString("apellido_materno"));
                trabajador.setCorreoElectronico(rs.getString("correo_electronico"));
                trabajador.setContrasenha(rs.getString("contrasenha"));
                trabajador.setFechaCreacion(rs.getDate("fecha_Creacion"));
                trabajador.setActivo(rs.getBoolean("activo"));
                trabajador.setSueldo(rs.getDouble("sueldo"));
                trabajador.setFechaContrato(rs.getDate("fecha_contrato"));
                trabajador.setCargo(rs.getString("cargo"));
                trabajador.setTipoTrabajador(TipoTrabajador.valueOf(rs.getString("tipo_trabajador")));
                Blob blob = rs.getBlob("foto");
                byte[] fotoBytes=null;
                if(blob!=null)
                    fotoBytes = blob.getBytes(1, (int) blob.length());
                trabajador.setFoto(fotoBytes);
                trabajadores.add(trabajador);
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return trabajadores;
    }
    
    @Override
    public Trabajador obtenerUsuarioPorID(int idUsuario){
        Trabajador trabajador = new Trabajador();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call obtenerUsuarioPorID(?,?)}");
            cs.setInt("_idUsuario", idUsuario);
            cs.setString("_tipoUsuario", "trabajador");
            rs = cs.executeQuery();
            while(rs.next()){
                trabajador.setIdTrabajador(rs.getInt("id_trabajador"));
                trabajador.setIdPersonal(rs.getInt("id_trabajador"));
                trabajador.setIdUsuario(rs.getInt("id_trabajador"));
                trabajador.setNombre(rs.getString("nombre"));
                trabajador.setApellidoPaterno(rs.getString("apellido_paterno"));
                trabajador.setApellidoMaterno(rs.getString("apellido_materno"));
                trabajador.setTipoTrabajador(TipoTrabajador.valueOf(rs.getString("tipo_trabajador")));
                trabajador.setCorreoElectronico(rs.getString("correo_electronico"));
                trabajador.setContrasenha(rs.getString("contrasenha"));
                trabajador.setSueldo(rs.getDouble("sueldo"));
                trabajador.setFechaContrato(rs.getDate("fecha_contrato"));
                trabajador.setCargo(rs.getString("cargo"));
                trabajador.setTipoTrabajador(TipoTrabajador.valueOf(rs.getString("tipo_trabajador")));
                Blob blob = rs.getBlob("foto");
                byte[] fotoBytes=null;
                if(blob!=null)
                    fotoBytes = blob.getBytes(1, (int) blob.length());
                trabajador.setFoto(fotoBytes);
            }
            
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return trabajador;
    }
    
}
