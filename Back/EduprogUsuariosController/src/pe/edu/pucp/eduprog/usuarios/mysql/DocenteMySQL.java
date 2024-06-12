package pe.edu.pucp.eduprog.usuarios.mysql;

import java.io.ByteArrayInputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.CallableStatement;
import java.sql.SQLException;
import pe.edu.pucp.eduprog.config.DBManager;
import pe.edu.pucp.eduprog.usuarios.dao.DocenteDAO;
import pe.edu.pucp.eduprog.usuarios.model.Docente;
import pe.edu.pucp.eduprog.usuarios.model.TipoDocente;

public class DocenteMySQL implements DocenteDAO{

    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    
    @Override
    public int insertar(Docente docente) {
        int resultado = 0;
        try{
            Blob fotoUsuarioBlob = null;
            if (docente.getFoto() != null){
                ByteArrayInputStream fotoUsuarioStream = new ByteArrayInputStream(docente.getFoto());
                fotoUsuarioBlob = new javax.sql.rowset.serial.SerialBlob((Blob) fotoUsuarioStream);
            }
            con=DBManager.getInstance().getConnection();
            cs=con.prepareCall("{call insertar_docente (?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_docente", java.sql.Types.INTEGER);
            cs.setString("_nombre", docente.getNombre());
            cs.setString("_apellido_paterno", docente.getApellidoPaterno());
            cs.setString("_apellido_materno", docente.getApellidoMaterno());
            cs.setString("_correo_electronico", docente.getCorreoElectronico());
            cs.setString("_contrasenha", docente.getContrasenha());
            cs.setDate("_fecha_Creacion", new java.sql.Date(docente.getFechaCreacion().getTime()));
            cs.setBoolean("_activo", true);
            cs.setDouble("_sueldo", docente.getSueldo());
            cs.setDate("_fecha_contrato", new java.sql.Date(docente.getFechaContrato().getTime()));
            cs.setString("_especialidad", docente.getEspecialidad());
            cs.setString("_tipo_docente", docente.getTipoDocente().toString());
            cs.setBytes("_foto", docente.getFoto());
            cs.executeUpdate();
            docente.setIdDocente(cs.getInt("_id_docente"));
            docente.setIdPersonal(cs.getInt("_id_docente"));
            docente.setIdUsuario(cs.getInt("_id_docente"));
            resultado=docente.getIdUsuario();
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
    public int modificar(Docente docente, byte[]nuevaFoto) {
        int resultado = 0;
        try{
            Blob fotoUsuarioBlob=null;
             if (nuevaFoto != null){
                ByteArrayInputStream fotoUsuarioStream = new ByteArrayInputStream(nuevaFoto);
                fotoUsuarioBlob = new javax.sql.rowset.serial.SerialBlob((Blob) fotoUsuarioStream);
            }else if(docente.getFoto() != null){
                ByteArrayInputStream fotoUsuarioStream = new ByteArrayInputStream(docente.getFoto());
                fotoUsuarioBlob = new javax.sql.rowset.serial.SerialBlob((Blob) fotoUsuarioStream);
            }
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call actualizar_docente (?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setInt("_id_docente", docente.getIdDocente());
            cs.setString("_nombre", docente.getNombre());
            cs.setString("_apellido_paterno", docente.getApellidoPaterno());
            cs.setString("_apellido_materno", docente.getApellidoMaterno());
            cs.setString("_correo_electronico", docente.getCorreoElectronico());
            cs.setString("_contrasenha", docente.getContrasenha());
            cs.setDate("_fecha_Creacion", new java.sql.Date(docente.getFechaCreacion().getTime()));
            cs.setDouble("_sueldo",docente.getSueldo());        
            cs.setDate("_fecha_contrato", new java.sql.Date(docente.getFechaContrato().getTime())); 
            cs.setString("_especialidad",docente.getEspecialidad()); 
            cs.setString("_tipo_docente",docente.getTipoDocente().toString());
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
    public int eliminar(int idDocente) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call eliminar_docente (?)}");
            cs.setInt("_id_docente", idDocente);
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
    public ArrayList<Docente> listarTodos() {
        ArrayList<Docente> docentes = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call mostrar_docentes()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Docente docente = new Docente();
                docente.setIdDocente(rs.getInt("id_docente"));
                docente.setIdPersonal(rs.getInt("id_docente"));
                docente.setIdUsuario(rs.getInt("id_docente"));
                docente.setNombre(rs.getString("nombre"));
                docente.setApellidoPaterno(rs.getString("apellido_paterno"));
                docente.setApellidoMaterno(rs.getString("apellido_materno"));
                docente.setCorreoElectronico(rs.getString("correo_electronico"));
                docente.setContrasenha(rs.getString("contrasenha"));
                docente.setFechaCreacion(rs.getDate("fecha_Creacion"));
                docente.setActivo(rs.getBoolean("activo"));
                docente.setSueldo(rs.getDouble("sueldo"));
                docente.setFechaContrato(rs.getDate("fecha_contrato"));
                docente.setEspecialidad(rs.getString("especialidad"));
                docente.setTipoDocente(TipoDocente.valueOf(rs.getString("tipo_Docente")));
                Blob blob = rs.getBlob("foto");
                byte[] fotoBytes=null;
                if(blob!=null)
                    fotoBytes = blob.getBytes(1, (int) blob.length());
                docente.setFoto(fotoBytes);
                docentes.add(docente);
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return docentes;
    }
    
    @Override
    public Docente obtenerUsuarioPorID(int idUsuario){
        Docente docente = new Docente();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call obtenerUsuarioPorID(?,?)}");
            cs.setInt("_idUsuario", idUsuario);
            cs.setString("_tipoUsuario", "docente");
            rs = cs.executeQuery();
            while(rs.next()){
                docente.setIdDocente(rs.getInt("id_docente"));
                docente.setIdPersonal(rs.getInt("id_docente"));
                docente.setIdUsuario(rs.getInt("id_docente"));
                docente.setNombre(rs.getString("nombre"));
                docente.setApellidoPaterno(rs.getString("apellido_paterno"));
                docente.setApellidoMaterno(rs.getString("apellido_materno"));
                docente.setCorreoElectronico(rs.getString("correo_electronico"));
                docente.setContrasenha(rs.getString("contrasenha"));
                docente.setSueldo(rs.getDouble("sueldo"));
                docente.setFechaContrato(rs.getDate("fecha_contrato"));
                docente.setEspecialidad(rs.getString("especialidad"));
                docente.setTipoDocente(TipoDocente.valueOf(rs.getString("tipo_Docente")));
                Blob blob = rs.getBlob("foto");
                byte[] fotoBytes=null;
                if(blob!=null)
                    fotoBytes = blob.getBytes(1, (int) blob.length());
                docente.setFoto(fotoBytes);
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return docente;
    }
    
}