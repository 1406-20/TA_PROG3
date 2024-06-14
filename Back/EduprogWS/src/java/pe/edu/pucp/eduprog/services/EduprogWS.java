/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/WebService.java to edit this template
 */
package pe.edu.pucp.eduprog.services;

import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import pe.edu.pucp.eduprog.anhoescolar.dao.*;
import pe.edu.pucp.eduprog.incidencias.DAO.*;
import pe.edu.pucp.eduprog.planesestudio.dao.*;
import pe.edu.pucp.eduprog.publicaciones.DAO.*;
import pe.edu.pucp.eduprog.usuarios.dao.*;
import pe.edu.pucp.eduprog.anhoescolar.mysql.*;
import pe.edu.pucp.eduprog.incidencias.MySQL.*;
import pe.edu.pucp.eduprog.planesestudio.mysql.*;
import pe.edu.pucp.eduprog.publicaciones.MySQL.*;
import pe.edu.pucp.eduprog.usuarios.mysql.*;
import pe.edu.pucp.eduprog.anhoescolar.model.*;
import pe.edu.pucp.eduprog.incidencias.model.*;
import pe.edu.pucp.eduprog.planestudios.model.*;
import pe.edu.pucp.eduprog.publicaciones.model.*;
import pe.edu.pucp.eduprog.usuarios.model.*;
import pe.edu.pucp.eduprog.publicaciones.model.Publicaciones;
import pe.edu.pucp.eduprog.incidencias.model.*;
import pe.edu.pucp.eduprog.planestudios.model.*;
import pe.edu.pucp.eduprog.anhoescolar.model.*;

@WebService(serviceName = "EduprogWS")
public class EduprogWS {
    //Docente
    private DocenteDAO daoDocente;
    @WebMethod(operationName = "insertarDocente")
    public int insertarDocente(@WebParam(name = "docente") Docente docente){
        int resultado=0;
        try{
            daoDocente=new DocenteMySQL();
            resultado=daoDocente.insertar(docente);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "modificarDocente")
    public int modificarDocente(@WebParam(name = "docente") Docente docente,@WebParam(name = "nuevaFoto") byte[]nuevaFoto){
        int resultado=0;
        try{
            daoDocente=new DocenteMySQL();
            resultado=daoDocente.modificar(docente,nuevaFoto);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminarDocente")
    public int eliminarDocente(@WebParam(name = "docente") int docente){
        int resultado=0;
        try{
            daoDocente=new DocenteMySQL();
            resultado=daoDocente.eliminar(docente);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "listarTodosDocentes")
    public ArrayList<Docente>listarTodosDocentes(){
        ArrayList<Docente> docentes=new ArrayList<>();
        try{
            daoDocente=new DocenteMySQL();
            docentes=daoDocente.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return docentes;
    }
    
    @WebMethod(operationName = "obtenerDocentePorID")
    public Docente obtenerDocentePorID(@WebParam(name = "idSUario")int idSUario){
        Docente docente=new Docente();
        try{
            daoDocente=new DocenteMySQL();
            docente=daoDocente.obtenerUsuarioPorID(idSUario);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return docente;
    }
    @WebMethod(operationName = "obtener_horario_idDocente")
    public byte[] obtener_horario_idDocente(@WebParam(name = "idDocente")int idDocente){
        byte[] horario = null;
        try{
            daoDocente=new DocenteMySQL();
            horario=daoDocente.obtenerFotoHorario(idDocente);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return horario;
    }
    
    
    //Aula
    AulaDAO daoAula;
    @WebMethod(operationName = "insertarAula")
    public int insertarAula(@WebParam(name = "aula")Aula aula){
        int resultado=0;
        try{
            daoAula=new AulaMySQL();
            resultado=daoAula.insertar(aula);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "modificarAula")
    public int modificarAula(@WebParam(name = "aula")Aula aula,
            @WebParam(name = "nuevaFoto") byte[]nuevaFoto,
            @WebParam(name = "nuevoHorario") byte[]nuevoHorario){
        int resultado=0;
        try{
            daoAula=new AulaMySQL();
            resultado=daoAula.modificar(aula, nuevaFoto, nuevoHorario);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminarAula")
    public int eliminarAula(@WebParam(name = "aula")int aula,
            @WebParam(name = "seccion") char seccion,@WebParam(name = "nivel") int nivel){
        int resultado=0;
        try{
            daoAula=new AulaMySQL();
            resultado=daoAula.eliminar(aula,seccion,nivel);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "listarTodasAulas")
    public ArrayList<Aula>listarTodasAulas(){
        ArrayList<Aula> aulas=new ArrayList<>();
        try{
            daoAula=new AulaMySQL();
            aulas=daoAula.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return aulas;
    }
    
    @WebMethod(operationName = "listarAlumnossAulasXId")
    public ArrayList<Integer>listarAlumnossAulasXId(@WebParam(name = "idAula")int idAula){
        ArrayList<Integer> idAlumnos=new ArrayList<>();
        try{
            daoAula=new AulaMySQL();
            idAlumnos=daoAula.listarAlumnosAulaXId(idAula);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return idAlumnos;
    }
    
    //Alumno
    private AlumnoDAO daoAlumno;
    @WebMethod(operationName = "insertarAlumno")
    public int insertarAlumno(@WebParam(name = "alumno")Alumno alumno){
        int resultado=0;
        try{
            daoAlumno=new AlumnoMySQL();
            resultado=daoAlumno.insertar(alumno);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "modificarAlumno")
    public int modificarAlumno(@WebParam(name = "alumno")Alumno alumno,
            @WebParam(name = "nuevaFoto") byte[]nuevaFoto){
        int resultado=0;
        try{
            daoAlumno=new AlumnoMySQL();
            resultado=daoAlumno.modificar(alumno,nuevaFoto);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminarAlumno")
    public int eliminarAlumno(@WebParam(name = "alumno")int alumno){
        int resultado=0;
        try{
            daoAlumno=new AlumnoMySQL();
            resultado=daoAlumno.eliminar(alumno);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "listarTodosAlumnos")
    public ArrayList<Alumno>listarTodosAlumnos(){
        ArrayList<Alumno> alumnos=new ArrayList<>();
        try{
            daoAlumno=new AlumnoMySQL();
            alumnos=daoAlumno.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return alumnos;
    }
    
    @WebMethod(operationName = "obtenerAlumnoPorID")
    public Alumno obtenerAlumnoPorID(@WebParam(name = "idAlumno")int idAlumno){
        Alumno alumno=new Alumno();
        try{
            daoAlumno=new AlumnoMySQL();
            alumno=daoAlumno.obtenerUsuarioPorID(idAlumno);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return alumno;
    }
    
    @WebMethod(operationName = "listarAlumnosSinSalon")
    public ArrayList<Alumno>listarAlumnosSinSalon(){
        ArrayList<Alumno> alumnos=new ArrayList<>();
        try{
            daoAlumno=new AlumnoMySQL();
            alumnos=daoAlumno.listarSinSalon();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return alumnos;
    }
    @WebMethod(operationName = "listarAlumnosEnAula")
    public ArrayList<Alumno>listarAlumnosEnAula(@WebParam(name = "salon")int salon){
        ArrayList<Alumno> alumnos=new ArrayList<>();
        try{
            daoAula=new AulaMySQL();
            alumnos=daoAula.listarAlumnosAula(salon);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return alumnos;
    }
    
    //Apoderado
    private ApoderadoDAO daoApoderado;
    @WebMethod(operationName = "insertarApoderado")
    public int insertarApoderado(@WebParam(name = "apoderado")Apoderado apoderado){
        int resultado=0;
        try{
            daoApoderado=new ApoderadoMySQL();
            resultado=daoApoderado.insertar(apoderado);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "modificarApoderado")
    public int modificarApoderado(@WebParam(name = "apoderado")Apoderado apoderado,
            @WebParam(name = "nuevaFoto") byte[]nuevaFoto){
        int resultado=0;
        try{
            daoApoderado=new ApoderadoMySQL();
            resultado=daoApoderado.modificar(apoderado,nuevaFoto);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminarApoderado")
    public int eliminarApoderado(@WebParam(name = "apoderado")int apoderado){
        int resultado=0;
        try{
            daoApoderado=new ApoderadoMySQL();
            resultado=daoApoderado.eliminar(apoderado);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "listarTodosApoderados")
    public ArrayList<Apoderado>listarTodosApoderados(){
        ArrayList<Apoderado> apoderados=new ArrayList<>();
        try{
            daoApoderado=new ApoderadoMySQL();
            apoderados=daoApoderado.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return apoderados;
    }
    @WebMethod(operationName = "obtenerApoderadoPorID")
    public Apoderado obtenerApoderadoPorID(@WebParam(name = "idApoderado")int idApoderado){
        Apoderado apoderado=new Apoderado();
        try{
            daoApoderado=new ApoderadoMySQL();
            apoderado=daoApoderado.obtenerUsuarioPorID(idApoderado);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return apoderado;
    }
    
    @WebMethod(operationName = "listarAlumnosApoderado")
    public ArrayList<String> listarAlumnosApoderado(@WebParam(name = "idApoderado")int idApoderado){
        ArrayList<String> listaAlumnos = new ArrayList<>();
        try{
            daoApoderado=new ApoderadoMySQL();
            listaAlumnos=daoApoderado.listar_Alumnos_apoderado(idApoderado);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return listaAlumnos;
    }
    
    //Superusuario
    private SuperusuarioDAO daoSuperusuario;
    @WebMethod(operationName = "insertarSuperUsuario")
    public int insertarSuperUsuario(@WebParam(name = "superusuario")SuperUsuario superusuario){
        int resultado=0;
        try{
            daoSuperusuario=new SuperusuarioMySQL();
            resultado=daoSuperusuario.insertar(superusuario);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "modificarSuperusuario")
    public int modificarSuperusuario(@WebParam(name = "superusuario")SuperUsuario superusuario,
            @WebParam(name = "nuevaFoto")byte[]nuevaFoto){
        int resultado=0;
        try{
            daoSuperusuario=new SuperusuarioMySQL();
            resultado=daoSuperusuario.modificar(superusuario,nuevaFoto);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminarSuperusuario")
    public int eliminarSuperusuario(@WebParam(name = "superusuario")int superusuario){
        int resultado=0;
        try{
            daoSuperusuario=new SuperusuarioMySQL();
            resultado=daoSuperusuario.eliminar(superusuario);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "listarTodosSuperusuarios")
    public ArrayList<SuperUsuario>listarTodosSuperusuarios(){
        ArrayList<SuperUsuario> superusuarios=new ArrayList<>();
        try{
            daoSuperusuario=new SuperusuarioMySQL();
            superusuarios=daoSuperusuario.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return superusuarios;
    }
    
    @WebMethod(operationName = "obtenerUsuarioSUperUsuarioPorID")
    public SuperUsuario obtenerUsuarioSUperUsuarioPorID(@WebParam(name = "idSUario")int idSUario){
        SuperUsuario superUsuario=new SuperUsuario();
        try{
            daoSuperusuario=new SuperusuarioMySQL();
            superUsuario=daoSuperusuario.obtenerUsuarioPorID(idSUario);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return superUsuario;
    }
    
    //Trabajador
    private TrabajadorDAO daoTrabajador;
    @WebMethod(operationName = "insertarTrabajador")
    public int insertarTrabajador(@WebParam(name = "trabajador")Trabajador trabajador){
        int resultado=0;
        try{
            daoTrabajador=new TrabajadorMySQL();
            resultado=daoTrabajador.insertar(trabajador);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "modificarTrabajador")
    public int modificarTrabajador(@WebParam(name = "trabajador")Trabajador trabajador,
            @WebParam(name = "nuevaFoto")byte[]nuevaFoto){
        int resultado=0;
        try{
            daoTrabajador=new TrabajadorMySQL();
            resultado=daoTrabajador.modificar(trabajador,nuevaFoto);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminarTrabajador")
    public int eliminarTrabajador(@WebParam(name = "trabajador")int trabajador){
        int resultado=0;
        try{
            daoTrabajador=new TrabajadorMySQL();
            resultado=daoTrabajador.eliminar(trabajador);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "listarTodosTrabajadores")
    public ArrayList<Trabajador>listarTodosTrabajadores(){
        ArrayList<Trabajador> trabajadores=new ArrayList<>();
        try{
            daoTrabajador=new TrabajadorMySQL();
            trabajadores=daoTrabajador.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return trabajadores;
    }
    
    @WebMethod(operationName = "obtenerUsuarioTrabajadorPorID")
    public Trabajador obtenerUsuarioTrabajadorPorID(@WebParam(name = "idSUario")int idSUario){
        Trabajador trabajador=new Trabajador();
        try{
            daoTrabajador=new TrabajadorMySQL();
            trabajador=daoTrabajador.obtenerUsuarioPorID(idSUario);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return trabajador;
    }
    
    //Publicaciones
    publicacionesDAO daoPublicaciones;
    @WebMethod(operationName = "insertarPublicaciones")
    public int insertarPublicaciones (@WebParam(name = "publicacion")Publicaciones publicacion,
            @WebParam(name = "idUsuario")int idUsuario){
        int resultado=0;
        try{
            daoPublicaciones=new publicacionesMySQL();
            resultado=daoPublicaciones.insertar(publicacion,idUsuario);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "modificarPublicaciones")
    public int modificarPublicaciones (@WebParam(name = "publicacion")Publicaciones publicacion, 
            @WebParam(name = "idUsuario")int idUsuario,@WebParam(name = "idPublicacion") int idPublicacion,
            @WebParam(name = "estado")boolean estado){
        int resultado=0;
        try{
            daoPublicaciones=new publicacionesMySQL();
            resultado=daoPublicaciones.modificar(publicacion,idUsuario,idPublicacion,estado);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "eliminarPublicaciones")
    public int eliminarPublicaciones (@WebParam(name = "idDocente")int idDocente){
        int resultado=0;
        try{
            daoPublicaciones=new publicacionesMySQL();
            resultado=daoPublicaciones.eliminar(idDocente);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "listarTodasPublicaciones")
    public ArrayList<Publicaciones> listarTodasPublicaciones(){
        ArrayList<Publicaciones> publicaciones=new ArrayList<>();
        try{
            daoPublicaciones=new publicacionesMySQL();
            publicaciones=daoPublicaciones.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return publicaciones;
    }
    
    @WebMethod(operationName = "eliminarPublicacion")
    public int eliminarPublicacion(@WebParam(name = "idPublicacion") int idPublicacion){
        int resultado = 0;
        try{
            daoPublicaciones=new publicacionesMySQL();
            resultado=daoPublicaciones.eliminar(idPublicacion);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    //Plan Estudios
    //Tareas
    TareaDAO daoTareas;
    @WebMethod(operationName = "listarTareas")
    public ArrayList<Tarea> listarTareas(){
        ArrayList<Tarea> tareas=new ArrayList<>();
        try{
            daoTareas=new TareaMySQL();
            tareas=daoTareas.listarTodas();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return tareas;
    }
    
    @WebMethod(operationName = "modificarTareas")
    public int modificarTareas(@WebParam(name = "tarea")Tarea tarea, @WebParam(name = "idAlumno")ArrayList<Integer> idAlumnos,
            @WebParam(name = "idDocente")int idDocente, @WebParam(name = "estado")boolean estado){
        int resultado = 0;
        try{
            daoTareas=new TareaMySQL();
            resultado=daoTareas.modificar(tarea, idAlumnos, idDocente, estado);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "insertarTareas")
    public int insertarTareas(@WebParam(name = "tarea")Tarea tarea, @WebParam(name = "idAlumno")ArrayList<Integer> idAlumnos,
            @WebParam(name = "idDocente")int idDocente){
        int resultado=0;
        try{
            daoTareas=new TareaMySQL();
            resultado=daoTareas.insertar(tarea, idAlumnos, idDocente);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminarTarea")
    public int eliminarTarea(@WebParam(name = "tarea")int tarea){
        int resultado = 0;
        try{
            daoTareas=new TareaMySQL();
            resultado=daoTareas.eliminar(tarea);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    //Sesion
    SesionDAO daoSesion;
    @WebMethod(operationName = "listarSesion")
    public ArrayList<Sesion> listarSesion(){
        ArrayList<Sesion> sesiones=new ArrayList<>();
        try{
            daoSesion=new SesionMySQL();
            sesiones=daoSesion.listarTodas();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return sesiones;
    }
    
    @WebMethod(operationName = "modificarSesion")
    public int modificarSesion(@WebParam(name = "sesion")Sesion sesion, @WebParam(name = "idAlumnos")ArrayList<Integer> idAlumnos,
            @WebParam(name = "idDocente")int idDocente, @WebParam(name = "estado")boolean estado){
        int resultado = 0;
        try{
            daoSesion=new SesionMySQL();
            resultado=daoSesion.modificar(sesion, idAlumnos, idDocente, estado);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "insertarSesion")
    public int insertarSesion(@WebParam(name = "sesion")Sesion sesion, @WebParam(name = "idAlumnos")ArrayList<Integer> idAlumnos,
            @WebParam(name = "idDocente")int idDocente){
        int resultado = 0;
        try{
            daoSesion=new SesionMySQL();
            resultado=daoSesion.insertar(sesion, idAlumnos, idDocente);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminarSesion")
    public int eliminarSesion(@WebParam(name = "sesion")int sesion){
        int resultado = 0;
        try{
            daoSesion=new SesionMySQL();
            resultado=daoSesion.eliminar(sesion);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "Obtener_sesionesxDocente")
    public ArrayList<String> Obtener_sesionesxDocente(
            @WebParam(name = "idDocente")int idDocente){
        ArrayList<String> sesiones = new ArrayList<>();
        try{
            daoSesion =new SesionMySQL();
            sesiones=daoSesion.obtenerSesionDocente(idDocente);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return sesiones;
    }
    
    //Reunion
    ReunionDAO daoReunion;
    @WebMethod(operationName = "listarReunion")
    public ArrayList<Reunion> listarReunion(){
        ArrayList<Reunion> reuniones=new ArrayList<>();
        try{
            daoReunion=new ReunionMySQL();
            reuniones=daoReunion.listarTodas();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return reuniones;
    }
    
    @WebMethod(operationName = "modificarReunion")
    public int modificarReunion(@WebParam(name = "reunion")Reunion reunion, @WebParam(name = "idAlumnos")ArrayList<Integer> idAlumnos,
            @WebParam(name = "idDocente")int idDocente, @WebParam(name = "estado")boolean estado){
        int resultado = 0;
        try{
            daoReunion=new ReunionMySQL();
            resultado=daoReunion.modificar(reunion, idAlumnos, idDocente, estado);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "insertarReunion")
    public int insertarReunion(@WebParam(name = "reunion")Reunion reunion, @WebParam(name = "idAlumnos")ArrayList<Integer> idAlumnos,
            @WebParam(name = "idDocente")int idDocente){
        int resultado = 0;
        try{
            daoReunion=new ReunionMySQL();
            resultado=daoReunion.insertar(reunion, idAlumnos, idDocente);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminarReunion")
    public int eliminarReunion(@WebParam(name = "reunion")int reunion){
        int resultado = 0;
        try{
            daoReunion=new ReunionMySQL();
            resultado=daoReunion.eliminar(reunion);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    //Evaluacion
    EvaluacionDAO daoEvaluacion;
    @WebMethod(operationName = "listarEvaluacion")
    public ArrayList<Evaluacion> listarEvaluacion(){
        ArrayList<Evaluacion> evaluaciones=new ArrayList<>();
        try{
            daoEvaluacion=new EvaluacionMySQL();
            evaluaciones=daoEvaluacion.listarTodas();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return evaluaciones;
    }
    
    @WebMethod(operationName = "modificarEvaluacion")
    public int modificarEvaluacion(@WebParam(name = "evaluacion")Evaluacion evaluacion, @WebParam(name = "idAlumnos")ArrayList<Integer> idAlumnos,
            @WebParam(name = "idDocente")int idDocente, @WebParam(name = "estado")boolean estado){
        int resultado = 0;
        try{
            daoEvaluacion=new EvaluacionMySQL();
            resultado=daoEvaluacion.modificar(evaluacion, idAlumnos, idDocente, estado);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "insertarEvaluacion")
    public int insertarEvaluacion(@WebParam(name = "evaluacion")Evaluacion evaluacion, @WebParam(name = "idAlumnos")ArrayList<Integer> idAlumnos,
            @WebParam(name = "idDocente")int idDocente){
        int resultado = 0;
        try{
            daoEvaluacion=new EvaluacionMySQL();
            resultado=daoEvaluacion.insertar(evaluacion, idAlumnos, idDocente);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminarEvaluacion")
    public int eliminarEvaluacion(@WebParam(name = "evaluacion")int evaluacion){
        int resultado = 0;
        try{
            daoEvaluacion=new EvaluacionMySQL();
            resultado=daoEvaluacion.eliminar(evaluacion);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    //Curso
    CursoDAO daoCurso;
    @WebMethod(operationName = "insertarCurso")
    public int insertarCurso(@WebParam(name = "curso")Curso curso,
            @WebParam(name = "idDocente")int idDocente){
        int resultado = 0;
        try{
            daoCurso=new CursoMySQL();
            resultado=daoCurso.insertar(curso,idDocente);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "modificarCurso")
    public int modificarCurso(@WebParam(name = "curso")Curso curso){
        int resultado = 0;
        try{
            daoCurso=new CursoMySQL();
            resultado=daoCurso.modificar(curso);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "listarCurso")
    public ArrayList<Curso> listarCurso(){
        ArrayList<Curso> cursos = new ArrayList<>();
        int resultado = 0;
        try{
            daoCurso=new CursoMySQL();
            cursos=daoCurso.listarTodas();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return cursos;
    }
    
    //Login
    
    @WebMethod(operationName = "obtenerUsuarioPorCE")
    public String[] obtenerUsuarioPorCE(@WebParam(name = "correo")String correo){
        String[] datos = new String[4];
        int resultado = 0;
        try{
            daoAlumno=new AlumnoMySQL();
            datos=daoAlumno.obtenerUsuarioPorCE(correo);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return datos;
    }
    
    //Evaluacion
    @WebMethod(operationName = "listarnotasxalumno")
    public ArrayList<String> listarnotasxalumno(@WebParam(name = "idAlumno")int idAlumno){
        ArrayList<String> cadena = new ArrayList<>();
        try{
            daoEvaluacion=new EvaluacionMySQL();
            cadena=daoEvaluacion.listarNotasxAlumno(idAlumno);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return cadena;
    }
    //Incidencias
    //Atención médica
    AtencionMedicaDAO daoAtencionMedica;
    @WebMethod(operationName = "insertarAtencionMedica")
    public int insertarAtencionMedica(@WebParam(name = "atencionMedica")AtencionMedica atencionMedica, @WebParam(name = "idAlumno")int idAlumno){
        int resultado = 0;
        try{
            daoAtencionMedica=new AtencionMedicaMySQL();
            resultado=daoAtencionMedica.insertarAtencion(atencionMedica, idAlumno);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "modificarAtencionMedica")
    public int modificarAtencionMedica(@WebParam(name = "identificador")int identificador, @WebParam(name = "atencionMedica")AtencionMedica atencionMedica, 
            @WebParam(name = "idAlumno")int idAlumno){
        int resultado = 0;
        try{
            daoAtencionMedica=new AtencionMedicaMySQL();
            resultado=daoAtencionMedica.modificaAtencion(identificador, atencionMedica, idAlumno);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminarAtencionMedica")
    public int eliminarAtencionMedica(@WebParam(name = "identificador")int identificador){
        int resultado = 0;
        try{
            daoAtencionMedica=new AtencionMedicaMySQL();
            resultado=daoAtencionMedica.borrarAtencionMedica(identificador);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "listarAtencionMedica")
    public ArrayList<AtencionMedica> listarAtencionMedica(){
        ArrayList<AtencionMedica> atenciones = new ArrayList<>();
        try{
            daoAtencionMedica=new AtencionMedicaMySQL();
            atenciones=daoAtencionMedica.listarAtencionMedica();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return atenciones;
    }
    
    //Merito
    MeritoDAO daoMerito;
    @WebMethod(operationName = "insertarMerito")
    public int insertarMerito(@WebParam(name = "merito")Merito merito, @WebParam(name = "idAlumno")int idAlumno){
        int resultado = 0;
        try{
            daoMerito=new MeritoMySQL();
            resultado=daoMerito.insertarMerito(merito, idAlumno);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "modificarMerito")
    public int modificarMerito(@WebParam(name = "identificador")int identificador, @WebParam(name = "merito")Merito merito){
        int resultado = 0;
        try{
            daoMerito=new MeritoMySQL();
            resultado=daoMerito.modificaMerito(identificador, merito);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminarMerito")
    public int eliminarMerito(@WebParam(name = "idMerito")int idMerito){
        int resultado = 0;
        try{
            daoMerito=new MeritoMySQL();
            resultado=daoMerito.borrarMerito(resultado);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "listarMerito")
    public ArrayList<Merito> listarMerito(){
        ArrayList<Merito> meritos = new ArrayList<>();
        try{
            daoMerito=new MeritoMySQL();
            meritos=daoMerito.listarMerito();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return meritos;
    }
    
    //Demérito
    DemeritoDAO daoDemerito;
    @WebMethod(operationName = "insertarDemerito")
    public int insertarDemerito(@WebParam(name = "demerito")Demerito demerito, @WebParam(name = "idAlumno")int idAlumno){
        int resultado = 0;
        try{
            daoDemerito=new DemeritoMySQL();
            resultado=daoDemerito.insertarDemerito(demerito, idAlumno);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "modificarDemerito")
    public int modificarDemerito(@WebParam(name = "identificador")int identificador, @WebParam(name = "demerito")Demerito demerito){
        int resultado = 0;
        try{
            daoDemerito=new DemeritoMySQL();
            resultado=daoDemerito.modificaDemerito(identificador, demerito);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminarDemerito")
    public int eliminarDemerito(@WebParam(name = "idMerito")int idMerito){
        int resultado = 0;
        try{
            daoDemerito=new DemeritoMySQL();
            resultado=daoDemerito.borrarDemerito(idMerito);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "listarDemerito")
    public ArrayList<Demerito> listarDemerito(){
        ArrayList<Demerito> demeritos = new ArrayList<>();
        try{
            daoDemerito=new DemeritoMySQL();
            demeritos=daoDemerito.listarDemerito();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return demeritos;
    }
    
    @WebMethod(operationName = "obtenerUsuarioIncidencia")
    public String obtenerUsuarioIncidencia(@WebParam(name = "idIncidencia")int idIncidencia){
        String cadena="";
        try{
            daoAlumno=new AlumnoMySQL();
            cadena=daoAlumno.obtenerUsuarioIncidencia(idIncidencia);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return cadena;
}
    
    //horario
    @WebMethod(operationName = "obtenerAulaxIDAlumno")
    public Aula obtenerAulaxIDAlumno(@WebParam(name = "idAlumno")int idAlumno){
        Aula aula = new Aula();
        try{
            daoAula=new AulaMySQL();
            aula=daoAula.obtener_aula_id_alumno(idAlumno);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return aula;
    }
    
    @WebMethod(operationName = "listarSesionesXAlumnoId")
    public ArrayList<Sesion> listarSesionesXAlumnoId(@WebParam(name = "idUsuario")int idUsuario){
        ArrayList<Sesion> sesiones=new ArrayList<>();
        
        try{
            daoSesion=new SesionMySQL();
            sesiones=daoSesion.listarSesionesXAlumnoId(idUsuario);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return sesiones;
    }
    @WebMethod(operationName = "listarSesionesXDocenteId")
    public  ArrayList<Sesion>  listarSesionesXDocenteId(@WebParam(name = "idUsuario")int idUsuario){
        ArrayList<Sesion> sesiones=new ArrayList<>();
        
        try{
            daoSesion=new SesionMySQL();
            sesiones=daoSesion.listarSesionesXDocenteId(idUsuario);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return sesiones;
    }
    private TareaDAO daoTarea;
    @WebMethod(operationName = "listarTareasXAlumnoId")
    public ArrayList<Tarea> listarTareasXAlumnoId(@WebParam(name = "idUsuario")int idUsuario){
        ArrayList<Tarea> tareas=new ArrayList<>();
        
        try{
            daoTarea=new TareaMySQL();
            tareas=daoTarea.listarTareasXAlumnoId(idUsuario);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return tareas;
    }
    @WebMethod(operationName = "listarTareasXDocenteId")
    public  ArrayList<Tarea>  listarTareasXDocenteId(@WebParam(name = "idUsuario")int idUsuario){
        ArrayList<Tarea> tareas=new ArrayList<>();
        try{
            daoTarea=new TareaMySQL();
            tareas=daoTarea.listarTareasXDocenteId(idUsuario);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return tareas;
    }
    @WebMethod(operationName = "obtenerCursoXId")
    public  Curso obtenerCursoXId(@WebParam(name = "idCurso")int idCurso){
        Curso curso=new Curso();
        
        try{
            daoCurso=new CursoMySQL();
            curso=daoCurso.obtenerCursoXId(idCurso);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return curso;
    }
    @WebMethod(operationName = "ObtenerAulaxAlumnoID")
    public Aula ObtenerAulaxAlumnoID(@WebParam(name = "idUsuario")int idUsuario){
        Aula aula=new Aula();
        
        try{
            daoAula=new AulaMySQL();
            aula=daoAula.ObtenerAulaxAlumnoID(idUsuario);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return aula;
    }
    
}
