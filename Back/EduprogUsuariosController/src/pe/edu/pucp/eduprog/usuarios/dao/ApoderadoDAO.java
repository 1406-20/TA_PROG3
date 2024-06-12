package pe.edu.pucp.eduprog.usuarios.dao;
import pe.edu.pucp.eduprog.usuarios.model.Apoderado;
import java.util.ArrayList;

public interface ApoderadoDAO {
    int insertar(Apoderado apoderado);
    int modificar(Apoderado apoderado, byte[]nuevaFoto);
    int eliminar(int idApoderado);
    ArrayList<Apoderado> listarTodos();
    public Apoderado obtenerUsuarioPorID(int idUsuario);
    ArrayList<String> listar_Alumnos_apoderado(int idApoderado);
}
