package pe.edu.pucp.eduprog.usuarios.mysql;

import java.io.ByteArrayInputStream;
import java.sql.Blob;
import java.util.ArrayList;
import pe.edu.pucp.eduprog.usuarios.dao.AulaDAO;
import pe.edu.pucp.eduprog.usuarios.model.Aula;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import pe.edu.pucp.eduprog.config.DBManager;
import java.sql.CallableStatement;
import pe.edu.pucp.eduprog.usuarios.model.Docente;
import pe.edu.pucp.eduprog.usuarios.dao.DocenteDAO;
import pe.edu.pucp.eduprog.usuarios.model.Alumno;

public class AulaMySQL implements AulaDAO{
     private Connection con;
    private PreparedStatement pst;
    private CallableStatement cs;
    private ResultSet rs;
    private DocenteDAO daoDocente;
    
    @Override
    public int insertar(Aula aula){
        int resultado = 0, resultado2 =0;
        try{
           
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_AULA"
                    + "(?,?,?,?,?,?,?,?,?)}");
            cs.registerOutParameter("_idAula",
                    java.sql.Types.INTEGER);
            cs.setInt("_grado", aula.getGrado());
            cs.setString("_seccion", String.valueOf(aula.getSeccion()));
            cs.setInt("_nivel", aula.getNivel());
            cs.setInt("_tutor",aula.getTutor().getIdDocente());
            cs.setInt("_anho_escolar", aula.getAnhoEscolar().getAnho());
            cs.setInt("_estado", 1);
            cs.setBytes("_fotoAula", aula.getFoto());
            cs.setBytes("_fotoHorario", aula.getHorario());
            resultado = cs.executeUpdate();
            aula.setIdAula(cs.getInt("_idAula"));
            if(resultado != 0){
                //insercion de Alumnos
                if(aula.getAlumnos() != null)
                    for(Alumno alumno : aula.getAlumnos()){
                        resultado2 = insertarAlumnoEnAula(aula, alumno.getIdAlumno());
                        if (resultado2 == 0)
                            break;
                    }
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            
            try{con.close();}catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return (resultado * resultado2);
    }
    
    @Override
    public int modificar(Aula aula, byte[]nuevaFoto, byte[]nuevoHorario) {
        int resultado = 0, resultado2=0, resultado3 = 0;
        try{
            
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_AULA (?,?,?,?,?,?,?)}");
            cs.setInt("_grado", aula.getGrado());
            cs.setString("_seccion", String.valueOf(aula.getSeccion()));
            cs.setInt("_nivel", aula.getNivel());
            cs.setInt("_tutor",aula.getTutor().getIdDocente());
            cs.setInt("_anho_escolar", aula.getAnhoEscolar().getAnho());
            cs.setBytes("_fotoAula", nuevaFoto);
            cs.setBytes("_fotoHorario", nuevoHorario);
            resultado = cs.executeUpdate();
            cs = con.prepareCall("{call restaurarAula (?)}");
            cs.setInt("_idAula", aula.getIdAula());
            resultado3 = cs.executeUpdate();
            if(resultado != 0){
                //insercion de Alumnos
                if(aula.getAlumnos() != null)
                    for(Alumno alumno : aula.getAlumnos()){
                        resultado2 = insertarAlumnoEnAula(aula, alumno.getIdAlumno());
                        if (resultado2 == 0)
                            break;
                    }
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return (resultado*resultado3*resultado2);
    }
    
    @Override
    public int eliminar(int grado, char seccion, int nivel) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_AULA (?,?,?)}");
            cs.setInt("_grado", grado);
            cs.setString("_seccion", String.valueOf(seccion));
            cs.setInt("_nivel", nivel);
            resultado = cs.executeUpdate();
            }catch(Exception ex){
                System.out.println(ex.getMessage());
            }finally{
                try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
            }
        return resultado;
    }
    
   @Override
   public ArrayList<Aula> listarTodos() {
        ArrayList<Aula> aulas = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_AULAS()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Aula aula = new Aula();
                aula.setIdAula(rs.getInt("idAula"));
                aula.setGrado(rs.getInt("grado"));
                aula.setSeccion(rs.getString("seccion").charAt(0));
                aula.setNivel(rs.getInt("nivel"));
                aula.setFoto(rs.getBytes("fotoAula"));
                daoDocente = new DocenteMySQL();
                Docente docente = daoDocente.obtenerUsuarioPorID(rs.getInt("tutor"));
                aula.setTutor(docente);
                aulas.add(aula);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return aulas;
    }
   
   
    @Override
    public ArrayList<Integer> listarAlumnosAulaXId(int idAula) {
        ArrayList<Integer> idSAlumnosAula = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call listarAlumnoAula(?)}");
            cs.setInt("_idAula", idAula);
            rs = cs.executeQuery();
            while(rs.next()){
                int id=rs.getInt("idAlumno");
                idSAlumnosAula.add(id);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return idSAlumnosAula;
    }
    
    @Override
    public ArrayList<Alumno> listarAlumnosAula(int idAula) {
        ArrayList<Alumno> alumnos = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call listadoAula(?)}");
            cs.setInt("_idAula", idAula);
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
    public int insertarAlumnoEnAula(Aula aula, int idAlumno){
        int resultado = 0;
        try{  
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_ALUMNO_X_AULA"
                    + "(?,?,?,?)}");
            cs.setInt("_idAula", aula.getIdAula());
            cs.setInt("_idAlumno", idAlumno);
            cs.setInt("_grado", aula.getGrado());
            cs.setInt("_nivel", aula.getNivel());
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
    public Aula obtener_aula_id_alumno(int idAlumno) {
        Aula aula = new Aula();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call OBTENER_AULA_ID_ALUMNO (?)}");
            cs.setInt("_id_alumno", idAlumno);
            rs = cs.executeQuery();
            while(rs.next()){
                aula.setIdAula(rs.getInt("idAula"));
                aula.setGrado(rs.getInt("grado"));
                aula.setSeccion((rs.getString("seccion")).charAt(0));
                aula.setNivel(rs.getInt("nivel"));
                Blob blob1 = rs.getBlob("fotoAula");
                Blob blob2 = rs.getBlob("fotoHorario");
                byte[] fotoBytes1 = null;
                byte[] fotoBytes2 = null;
                if(blob1!=null)
                    fotoBytes1 = blob1.getBytes(1, (int) blob1.length());
                if(blob2!=null)
                    fotoBytes2 = blob2.getBytes(1, (int) blob2.length());
                aula.setFoto(fotoBytes1);
                aula.setHorario(fotoBytes2);
            }
            }catch(Exception ex){
                System.out.println(ex.getMessage());
            }finally{
                try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
            }
        return aula;
    }
    
    @Override
    public Aula ObtenerAulaxAlumnoID(int idUsuario) {
        Aula aula = new Aula();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ObtenerAulaxAlumnoID(?)}");
            cs.setInt("_idUsuario", idUsuario);
            rs = cs.executeQuery();
            while(rs.next()){
                aula.setGrado(rs.getInt("grado"));
                aula.setSeccion(rs.getString("seccion").charAt(0));
                aula.setNivel(rs.getInt("nivel"));
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return aula;
    }
    
}
