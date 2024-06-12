package pe.edu.pucp.eduprog.main;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import pe.edu.pucp.eduprog.publicaciones.MySQL.publicacionesMySQL;
import pe.edu.pucp.eduprog.planesestudio.mysql.CursoMySQL;
import pe.edu.pucp.eduprog.planesestudio.mysql.EvaluacionMySQL;
import pe.edu.pucp.eduprog.planesestudio.mysql.ReunionMySQL;
import pe.edu.pucp.eduprog.planesestudio.mysql.SesionMySQL;
import pe.edu.pucp.eduprog.planesestudio.mysql.TareaMySQL;
import pe.edu.pucp.eduprog.planesestudio.dao.ReunionDAO;
import pe.edu.pucp.eduprog.planestudios.model.Reunion;
import pe.edu.pucp.eduprog.planestudios.model.Curso;
import pe.edu.pucp.eduprog.planestudios.model.Evaluacion;
import pe.edu.pucp.eduprog.planestudios.model.Reunion;
import pe.edu.pucp.eduprog.planestudios.model.Sesion;
import pe.edu.pucp.eduprog.planestudios.model.Tarea;
import pe.edu.pucp.eduprog.planestudios.model.TipoEvaluacion;
import pe.edu.pucp.eduprog.planestudios.model.TipoTarea;
import pe.edu.pucp.eduprog.usuarios.mysql.AlumnoMySQL;
import pe.edu.pucp.eduprog.usuarios.mysql.SuperusuarioMySQL;
import pe.edu.pucp.eduprog.usuarios.mysql.TrabajadorMySQL;
import pe.edu.pucp.eduprog.usuarios.dao.AlumnoDAO;
import pe.edu.pucp.eduprog.usuarios.dao.DocenteDAO;
import pe.edu.pucp.eduprog.usuarios.dao.SuperusuarioDAO;
import pe.edu.pucp.eduprog.usuarios.dao.TrabajadorDAO;
import pe.edu.pucp.eduprog.usuarios.model.Alumno;
import pe.edu.pucp.eduprog.usuarios.model.Docente;
import pe.edu.pucp.eduprog.usuarios.model.SuperUsuario;
import pe.edu.pucp.eduprog.usuarios.model.TipoDocente;
import pe.edu.pucp.eduprog.usuarios.model.TipoTrabajador;
import pe.edu.pucp.eduprog.usuarios.model.Trabajador;
import pe.edu.pucp.eduprog.usuarios.mysql.DocenteMySQL;
import pe.edu.pucp.eduprog.usuarios.mysql.ApoderadoMySQL;

import pe.edu.pucp.eduprog.incidencias.MySQL.AtencionMedicaMySQL;
import pe.edu.pucp.eduprog.incidencias.DAO.AtencionMedicaDAO;
import pe.edu.pucp.eduprog.incidencias.model.AtencionMedica;
import pe.edu.pucp.eduprog.planesestudio.dao.EvaluacionDAO;
import pe.edu.pucp.eduprog.planesestudio.dao.SesionDAO;
import pe.edu.pucp.eduprog.planesestudio.dao.TareaDAO;
import pe.edu.pucp.eduprog.planestudios.model.Actividad;
import pe.edu.pucp.eduprog.publicaciones.DAO.publicacionesDAO;
import pe.edu.pucp.eduprog.publicaciones.model.Publicaciones;
import pe.edu.pucp.eduprog.usuarios.dao.ApoderadoDAO;
import pe.edu.pucp.eduprog.usuarios.model.Apoderado;
import pe.edu.pucp.eduprog.usuarios.model.RelacionAlumno;


public class Principal {
    
    public static void main(String[] args) throws Exception{
        //Variables
        SimpleDateFormat sdf=new SimpleDateFormat("MM-dd-yyyy");
        Date fecha;
        fecha=sdf.parse("06-03-2024");
        //DAO
        AlumnoDAO daoAlumno=new AlumnoMySQL();
        ApoderadoDAO daoApoderado=new ApoderadoMySQL();
        TrabajadorDAO daoTrabajador=new TrabajadorMySQL();
        DocenteDAO daoDocente=new DocenteMySQL();
        
        //Prueba listado
        ArrayList<Alumno>alumnos=daoAlumno.listarTodos();
        
        //Objetos
        Apoderado apoderado=new Apoderado("Ingeniero", 0,
                "Av. 123", RelacionAlumno.Padre, alumnos, 0, 
                "Tommy", "Velarde", "Desposorio", "tommy32181@gmail.com", "123");
        apoderado.setFechaCreacion(fecha);
        Alumno alumno=new Alumno(sdf.parse("12-09-2000"), 'M', 0, "Av. 123", 0,
                "Tommy", "Velarde", "Desposorio", "tommy32181@gmail.com", "123");
        Trabajador trabajador=new Trabajador("Ricardo", "Gonzales", "Duran",
                "123@123.com", "123", 0, fecha, "contador", TipoTrabajador.Administrativo);
        Docente docente=new Docente("Tommy", "Velarde", "Desposorio", ""
                + "tommy32181@gmail.com", "123", 1500, fecha, "matemaica", TipoDocente.Suplente);
        
        //Prueba insertar
        
        //daoAlumno.insertar(alumno);
        //int resultado=daoApoderado.insertar(apoderado);
        //int resultado=daoTrabajador.insertar(trabajador);
        int resultado=daoDocente.insertar(docente);
    }
}
