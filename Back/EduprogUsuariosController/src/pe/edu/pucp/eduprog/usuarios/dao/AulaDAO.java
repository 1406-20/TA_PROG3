
package pe.edu.pucp.eduprog.usuarios.dao;
import pe.edu.pucp.eduprog.usuarios.model.Aula;
import java.util.ArrayList;
import pe.edu.pucp.eduprog.usuarios.model.Alumno;

public interface AulaDAO {
    int insertar(Aula aula);
    int modificar(Aula aula, byte[]nuevaFoto, byte[]nuevoHorario);
    int eliminar(int grado, char seccion, int nivel);
    ArrayList<Aula> listarTodos();
    ArrayList<Integer> listarAlumnosAulaXId(int idAula);
    int insertarAlumnoEnAula(Aula aula, int idAlumno);
    ArrayList<Alumno> listarAlumnosAula(int idAula);
    Aula obtener_aula_id_alumno(int idAlumno);
    Aula ObtenerAulaxAlumnoID(int idUsuario);
}