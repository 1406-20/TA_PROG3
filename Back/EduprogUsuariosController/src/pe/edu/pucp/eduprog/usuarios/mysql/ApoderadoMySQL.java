package pe.edu.pucp.eduprog.usuarios.mysql;

import java.io.ByteArrayInputStream;
import java.sql.Blob;
import java.util.ArrayList;
import pe.edu.pucp.eduprog.usuarios.dao.ApoderadoDAO;
import pe.edu.pucp.eduprog.usuarios.model.Apoderado;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import pe.edu.pucp.eduprog.config.DBManager;
import java.sql.CallableStatement;
import pe.edu.pucp.eduprog.usuarios.model.RelacionAlumno;
import java.sql.SQLException;

public class ApoderadoMySQL implements ApoderadoDAO{
    
    private Connection con;
    private PreparedStatement pst;
    private CallableStatement cs;
    private ResultSet rs;
    
    
    @Override
    public int insertar(Apoderado apoderado){
        int resultado = 0;
        try{
            Blob fotoUsuarioBlob = null;
            if (apoderado.getFoto() != null){
                ByteArrayInputStream fotoUsuarioStream = new ByteArrayInputStream(apoderado.getFoto());
                fotoUsuarioBlob = new javax.sql.rowset.serial.SerialBlob((Blob) fotoUsuarioStream);
            }
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_APODERADO"
                    + "(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_apoderado",
                    java.sql.Types.INTEGER);
            cs.setString("_nombre", apoderado.getNombre());
            cs.setString("_apellido_paterno", apoderado.getApellidoPaterno());
            cs.setString("_apellido_materno", apoderado.getApellidoMaterno());
            cs.setString("_correo_electronico",apoderado.getCorreoElectronico());
            cs.setString("_contrasenha", apoderado.getContrasenha());
            cs.setDate("_fecha_creacion", new java.sql.Date(
                    apoderado.getFechaCreacion().getTime()));
            cs.setBoolean("_activo", true);
            cs.setString("_ocupacion", apoderado.getOcupacion());
            cs.setString("_telefono", String.valueOf(apoderado.getTelefono()));
            cs.setString("_direccion", apoderado.getDireccion());
            cs.setString("_relacion_alumno", String.valueOf(apoderado.getRelacionAlumno()));
            cs.setBlob("_foto", fotoUsuarioBlob);
            cs.executeUpdate();
            apoderado.setIdUsuario(cs.getInt("_id_apoderado"));
            resultado = apoderado.getIdUsuario();
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
    public int modificar(Apoderado apoderado, byte[]nuevaFoto) {
        int resultado = 0;
        try{
            Blob fotoUsuarioBlob = null;
             if (nuevaFoto != null){
                ByteArrayInputStream fotoUsuarioStream = new ByteArrayInputStream(nuevaFoto);
                fotoUsuarioBlob = new javax.sql.rowset.serial.SerialBlob((Blob) fotoUsuarioStream);
            }else if(apoderado.getFoto() != null){
                ByteArrayInputStream fotoUsuarioStream = new ByteArrayInputStream(apoderado.getFoto());
                fotoUsuarioBlob = new javax.sql.rowset.serial.SerialBlob((Blob) fotoUsuarioStream);
            }
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_APODERADO (?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setInt("_id_apoderado", apoderado.getIdApoderado());
            cs.setString("_nombre", apoderado.getNombre());
            cs.setString("_apellido_paterno", apoderado.getApellidoPaterno());
            cs.setString("_apellido_materno", apoderado.getApellidoMaterno());
            cs.setString("_correo_electronico",apoderado.getCorreoElectronico());
            cs.setString("_contrasenha", apoderado.getContrasenha());
            cs.setString("_ocupacion", apoderado.getOcupacion());
            cs.setBoolean("_activo", true);
            cs.setString("_telefono", String.valueOf(apoderado.getTelefono()));
            cs.setString("_direccion", apoderado.getDireccion());
            cs.setString("_relacion_alumno", String.valueOf(apoderado.getRelacionAlumno()));
            cs.setBlob("_foto", fotoUsuarioBlob);
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }
    
    @Override
    public int eliminar(int idApoderado) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_APODERADO (?)}");
            cs.setInt("_id_apoderado", idApoderado);
            resultado = cs.executeUpdate();
            }catch(Exception ex){
                System.out.println(ex.getMessage());
            }finally{
                try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
            }
        return resultado;
    }
    
   @Override
   public ArrayList<Apoderado> listarTodos() {
        ArrayList<Apoderado> apoderados = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_APODERADOS()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Apoderado apoderado = new Apoderado();
                apoderado.setIdApoderado(rs.getInt("id_apoderado"));
                apoderado.setIdUsuario(rs.getInt("id_apoderado"));
                apoderado.setNombre(rs.getString("nombre"));
                apoderado.setApellidoPaterno(rs.getString("apellido_paterno"));
                apoderado.setApellidoMaterno(rs.getString("apellido_materno"));
                apoderado.setCorreoElectronico(rs.getString("correo_electronico"));
                apoderado.setContrasenha(rs.getString("contrasenha"));
                apoderado.setFechaCreacion(rs.getDate("fecha_Creacion"));
                apoderado.setActivo(rs.getBoolean("activo"));
                apoderado.setOcupacion(rs.getString("ocupacion"));
                apoderado.setTelefono(rs.getInt("telefono"));
                apoderado.setDireccion(rs.getString("direccion"));
                apoderado.setRelacionAlumno(RelacionAlumno.valueOf(rs.getString("relacion_alumno")));
                Blob blob = rs.getBlob("foto");
                byte[] fotoBytes=null;
                if(blob!=null)
                    fotoBytes = blob.getBytes(1, (int) blob.length());
                apoderado.setFoto(fotoBytes);
                apoderados.add(apoderado);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return apoderados;
    }
   
    @Override
    public Apoderado obtenerUsuarioPorID(int idUsuario){
        Apoderado apoderado = new Apoderado();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call obtenerUsuarioPorID(?,?)}");
            cs.setInt("_idUsuario", idUsuario);
            cs.setString("_tipoUsuario", "apoderado");
            rs = cs.executeQuery();
            while(rs.next()){
                apoderado.setIdApoderado(rs.getInt("id_apoderado"));
                apoderado.setIdUsuario(rs.getInt("id_usuario"));
                apoderado.setNombre(rs.getString("nombre"));
                apoderado.setApellidoPaterno(rs.getString("apellido_paterno"));
                apoderado.setApellidoMaterno(rs.getString("apellido_materno"));
                apoderado.setCorreoElectronico(rs.getString("correo_electronico"));
                Blob blob = rs.getBlob("foto");
                apoderado.setOcupacion(rs.getString("ocupacion"));
                apoderado.setTelefono(rs.getInt("telefono"));
                apoderado.setDireccion(rs.getString("direccion"));
                apoderado.setRelacionAlumno(RelacionAlumno.valueOf(rs.getString("relacion_alumno")));
                byte[] fotoBytes=null;
                if(blob!=null)
                    fotoBytes = blob.getBytes(1, (int) blob.length());
                apoderado.setFoto(fotoBytes);
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return apoderado;
    }
    
    @Override
    public ArrayList<String> listar_Alumnos_apoderado(int idApoderado) {
        ArrayList<String> listaAlumnos = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_ALUMNOS_APODERADO(?)}");
            cs.setInt("idApoderado", idApoderado);
            rs = cs.executeQuery();
            while(rs.next()){
                String cadena = new String();
                String id = rs.getString("idAlumno");
                String nombre = rs.getString("nombre");
                String apaterno = rs.getString("apellido_paterno");
                String amaterno = rs.getString("apellido_materno");
                cadena = id + ";" + nombre + " " + apaterno + " " + amaterno;
                listaAlumnos.add(cadena);
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return listaAlumnos;
    }
    
}
