package pe.edu.pucp.eduprog.usuarios.mysql;

import java.io.ByteArrayInputStream;
import java.sql.Blob;
import java.util.ArrayList;
import pe.edu.pucp.eduprog.usuarios.dao.AlumnoDAO;
import pe.edu.pucp.eduprog.usuarios.model.Alumno;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import pe.edu.pucp.eduprog.config.DBManager;
import java.sql.CallableStatement;
import java.sql.SQLException;
import pe.edu.pucp.eduprog.usuarios.model.Apoderado;

public class AlumnoMySQL implements AlumnoDAO{
    
    private Connection con;
    private PreparedStatement pst;
    private CallableStatement cs;
    private ResultSet rs;
    
    
    @Override
    public int insertar(Alumno alumno){
        int resultado = 0;
        try{
            Blob fotoUsuarioBlob = null;
            if (alumno.getFoto() != null){
                ByteArrayInputStream fotoUsuarioStream = new ByteArrayInputStream(alumno.getFoto());
                fotoUsuarioBlob = new javax.sql.rowset.serial.SerialBlob((Blob) fotoUsuarioStream);
            }
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_ALUMNO"
                    + "(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_alumno",
                    java.sql.Types.INTEGER);
            cs.setString("_nombre", alumno.getNombre());
            cs.setString("_apellido_paterno", alumno.getApellidoPaterno());
            cs.setString("_apellido_materno", alumno.getApellidoMaterno());
            cs.setString("_correo_electronico",alumno.getCorreoElectronico());
            cs.setString("_contrasenha", alumno.getContrasenha());
            cs.setDate("_fecha_creacion", new java.sql.Date(
                    alumno.getFechaCreacion().getTime()));
            cs.setBoolean("_activo", true);
            cs.setDate("_fecha_nacimiento", new java.sql.Date(
                    alumno.getFechaNacimiento().getTime()));
            cs.setString("_genero", String.valueOf(alumno.getGenero()));
            cs.setString("_direccion", alumno.getDireccion());
            cs.setInt("_grado_actual", alumno.getGradoActual());
            cs.setInt("_nivel_actual", alumno.getNivelActual());
            cs.setBlob("_foto", fotoUsuarioBlob);
            cs.executeUpdate();
            alumno.setIdUsuario(cs.getInt("_id_alumno"));
            resultado = alumno.getIdUsuario();
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
    public int modificar(Alumno alumno, byte[]nuevaFoto) {
        int resultado = 0;
        try{
            Blob fotoUsuarioBlob=null;
             if (nuevaFoto != null){
                ByteArrayInputStream fotoUsuarioStream = new ByteArrayInputStream(nuevaFoto);
                fotoUsuarioBlob = new javax.sql.rowset.serial.SerialBlob((Blob) fotoUsuarioStream);
            }else if(alumno.getFoto() != null){
                ByteArrayInputStream fotoUsuarioStream = new ByteArrayInputStream(alumno.getFoto());
                fotoUsuarioBlob = new javax.sql.rowset.serial.SerialBlob((Blob) fotoUsuarioStream);
            }
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_ALUMNO (?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setInt("_id_usuario", alumno.getIdAlumno());
            cs.setString("_nombre", alumno.getNombre());
            cs.setString("_apellido_paterno", alumno.getApellidoPaterno());
            cs.setString("_apellido_materno", alumno.getApellidoMaterno());
            cs.setString("_correo_electronico",alumno.getCorreoElectronico());
            cs.setString("_contrasenha", alumno.getContrasenha());
            cs.setString("_genero", String.valueOf(alumno.getGenero()));
            cs.setString("_direccion", alumno.getDireccion());
            cs.setInt("_grado_actual", alumno.getGradoActual());
            cs.setInt("_nivel_actual", alumno.getNivelActual());
            cs.setDate("_fecha_nacimiento", new java.sql.Date(
                    alumno.getFechaNacimiento().getTime()));
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
    public int eliminar(int idAlumnno) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_ALUMNO (?)}");
            cs.setInt("_id_alumno",idAlumnno);
            resultado = cs.executeUpdate();
            }catch(Exception ex){
                System.out.println(ex.getMessage());
            }finally{
                try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
            }
        return resultado;
    }
    
   @Override
   public ArrayList<Alumno> listarTodos() {
        ArrayList<Alumno> alumnos = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_ALUMNOS()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Alumno alumno = new Alumno();
                alumno.setIdAlumno(rs.getInt("id_alumno"));
                alumno.setIdUsuario(rs.getInt("id_alumno"));
                alumno.setNombre(rs.getString("nombre"));
                alumno.setApellidoPaterno(rs.getString("apellido_paterno"));
                alumno.setApellidoMaterno(rs.getString("apellido_materno"));
                alumno.setCorreoElectronico(rs.getString("correo_electronico"));
                alumno.setContrasenha(rs.getString("contrasenha"));
                alumno.setFechaCreacion(rs.getDate("fecha_Creacion"));
                alumno.setActivo(rs.getBoolean("activo"));
                alumno.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
                alumno.setGenero((rs.getString("genero")).charAt(0));
                alumno.setDireccion(rs.getString("direccion"));
                alumno.setGradoActual(rs.getInt("grado_actual"));
                alumno.setNivelActual(rs.getInt("nivel_actual"));
                Blob blob = rs.getBlob("foto");
                byte[] fotoBytes=null;
                if(blob!=null)
                    fotoBytes = blob.getBytes(1, (int) blob.length());
                alumno.setFoto(fotoBytes);
                alumnos.add(alumno);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return alumnos;
    }
   
   @Override
   public ArrayList<Alumno> listarActividad(int idActividad) {
        ArrayList<Alumno> alumnos = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call alumnosActividad(?)}");
            cs.setInt("_idActividad", idActividad);
            rs = cs.executeQuery();
            while(rs.next()){
                Alumno alumno = new Alumno();
                alumno.setIdAlumno(rs.getInt("id_alumno"));
                alumno.setNombre(rs.getString("nombre"));
                alumno.setApellidoPaterno(rs.getString("apellido_paterno"));
                alumno.setApellidoMaterno(rs.getString("apellido_materno"));
                alumno.setCorreoElectronico(rs.getString("correo_electronico"));
                alumno.setContrasenha(rs.getString("contrasenha"));
                alumno.setFechaCreacion(rs.getDate("fecha_Creacion"));
                alumno.setActivo(rs.getBoolean("activo"));
                alumno.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
                alumno.setGenero((rs.getString("genero")).charAt(0));
                alumno.setDireccion(rs.getString("direccion"));
                alumno.setGradoActual(rs.getInt("grado_actual"));
                alumno.setNivelActual(rs.getInt("nivel_actual"));
                Blob blob = rs.getBlob("foto");
                byte[] fotoBytes=null;
                if(blob!=null)
                    fotoBytes = blob.getBytes(1, (int) blob.length());
                alumno.setFoto(fotoBytes);
                alumnos.add(alumno);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return alumnos;
    }
   
    @Override
    public Alumno obtenerUsuarioPorID(int idUsuario){
        Alumno alumno = new Alumno();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call obtenerUsuarioPorID(?,?)}");
            cs.setInt("_idUsuario", idUsuario);
            cs.setString("_tipoUsuario", "alumno");
            rs = cs.executeQuery();
            while(rs.next()){
                alumno.setIdAlumno(rs.getInt("id_alumno"));
                alumno.setIdUsuario(rs.getInt("id_usuario"));
                alumno.setNombre(rs.getString("nombre"));
                alumno.setApellidoPaterno(rs.getString("apellido_paterno"));
                alumno.setApellidoMaterno(rs.getString("apellido_materno"));
                alumno.setCorreoElectronico(rs.getString("correo_electronico"));
                alumno.setContrasenha(rs.getString("contrasenha"));
                Blob blob = rs.getBlob("foto");
                alumno.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
                alumno.setGenero((rs.getString("genero")).charAt(0));
                alumno.setDireccion(rs.getString("direccion"));
                alumno.setGradoActual(rs.getInt("grado_actual"));
                alumno.setNivelActual(rs.getInt("nivel_actual"));
                byte[] fotoBytes=null;
                if(blob!=null)
                    fotoBytes = blob.getBytes(1, (int) blob.length());
                alumno.setFoto(fotoBytes);
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return alumno;
    }
        

   @Override
   public String[] obtenerUsuarioPorCE(String correo){
        String[] datos=new String[4];
        try{
             con = DBManager.getInstance().getConnection();
             cs = con.prepareCall("{call obtenerUsuarioPorCE(?,?)}");
             cs.registerOutParameter("_tipo_usuario",
                    java.sql.Types.VARCHAR);
             cs.setString("_correo", correo);
             rs = cs.executeQuery();
             while(rs.next()){
                datos[0]=rs.getString("id_usuario");
                datos[1]=rs.getString("correo_electronico");
                datos[2]=rs.getString("contrasenha");
                datos[3]=cs.getString("_tipo_usuario");
             }
        }
        catch(SQLException ex){
             System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
       return datos;
   }
   
    @Override
    public ArrayList<Alumno> listarSinSalon(){
        ArrayList<Alumno> alumnos = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_ALUMNOS_SIN_SALON()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Alumno alumno = new Alumno();
                alumno.setIdAlumno(rs.getInt("id_alumno"));
                alumno.setIdUsuario(rs.getInt("id_alumno"));
                alumno.setNombre(rs.getString("nombre"));
                alumno.setApellidoPaterno(rs.getString("apellido_paterno"));
                alumno.setApellidoMaterno(rs.getString("apellido_materno"));
                alumno.setCorreoElectronico(rs.getString("correo_electronico"));
                alumno.setContrasenha(rs.getString("contrasenha"));
                alumno.setFechaCreacion(rs.getDate("fecha_Creacion"));
                alumno.setActivo(rs.getBoolean("activo"));
                alumno.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
                alumno.setGenero((rs.getString("genero")).charAt(0));
                alumno.setDireccion(rs.getString("direccion"));
                alumno.setGradoActual(rs.getInt("grado_actual"));
                alumno.setNivelActual(rs.getInt("nivel_actual"));
                Blob blob = rs.getBlob("foto");
                byte[] fotoBytes=null;
                if(blob!=null)
                    fotoBytes = blob.getBytes(1, (int) blob.length());
                alumno.setFoto(fotoBytes);
                alumnos.add(alumno);
        }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return alumnos;

    }
    
    @Override
    public String obtenerUsuarioIncidencia(int idIncidencia){
        String cadena="";
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ObtenerAlumnoPorIncidencia(?)}");
            cs.setInt("_idIncidencia", idIncidencia);
            rs = cs.executeQuery();
            rs.next();
            cadena += rs.getString("nombre");
            cadena += " ";
            cadena += rs.getString("apellido_paterno");
            cadena += " ";
            cadena += rs.getString("apellido_materno");
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return cadena;
    }

}
