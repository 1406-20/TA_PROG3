package pe.edu.pucp.eduprog.usuarios.dao;
import pe.edu.pucp.eduprog.usuarios.model.Alumno;
import java.util.ArrayList;

public interface AlumnoDAO {
    int insertar(Alumno alumno);
    int modificar(Alumno alumno, byte[]nuevaFoto);
    int eliminar(int idAlumno);
    ArrayList<Alumno> listarTodos();
    ArrayList<Alumno> listarActividad(int idActividad);
    Alumno obtenerUsuarioPorID(int idUsuario);
    String[] obtenerUsuarioPorCE(String correo);
    ArrayList<Alumno> listarSinSalon();
    String obtenerUsuarioIncidencia(int idIncidencia);
}