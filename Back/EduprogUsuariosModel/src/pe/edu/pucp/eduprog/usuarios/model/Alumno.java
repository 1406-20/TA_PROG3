package pe.edu.pucp.eduprog.usuarios.model;

import pe.edu.pucp.eduprog.planestudios.model.Actividad;
import pe.edu.pucp.eduprog.incidencias.model.Incidencia;

import java.util.ArrayList;
import java.util.Date;

public class Alumno extends Usuario{
    private int idAlumno;
    private Date fechaNacimiento;
    private char genero;
    private String direccion;
    private int gradoActual;
    private int nivelActual;
    private boolean salonAsignado;
    private ArrayList<Incidencia> incidencias;
    private ArrayList<Actividad> actividades;
	
    public Alumno(Date fechaNacimiento, char genero, int nivel, String direccion,
            int gradoActual, String nombre,
            String apellidoPaterno, String apellidoMaterno, String correoElectronico,
            String contrasenha) {
        super(nombre,apellidoPaterno,apellidoMaterno,correoElectronico,contrasenha);
        this.fechaNacimiento = fechaNacimiento;
        this.genero = genero;
        this.direccion = direccion;
        this.gradoActual = gradoActual;
        this.nivelActual = nivel;
        incidencias = new ArrayList<Incidencia>();
        this.salonAsignado = false;
        //actividades = new ArrayList<Actividad>();
    }
    
    public Alumno(){};

    public int getIdAlumno() {
        return idAlumno;
    }

    public void setIdAlumno(int idAlumno) {
        this.idAlumno = idAlumno;
    }
	
    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public int getNivelActual() {
        return nivelActual;
    }
    
    public char getGenero() {
        return genero;
    }

    public String getDireccion() {
        return direccion;
    }

    public int getGradoActual() {
        return gradoActual;
    }


    public ArrayList<Incidencia> getIncidencias() {
        return incidencias;
    }

    public ArrayList<Actividad> getActividades() {
        return actividades;
    }
            
    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public void setGenero(char genero) {
        this.genero = genero;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setGradoActual(int gradoActual) {
        this.gradoActual = gradoActual;
    }
    
    public void setNivelActual(int nivelActual) {
        this.nivelActual = nivelActual;
    }

    public void setIncidencias(ArrayList<Incidencia> incidencias) {
        this.incidencias = incidencias;
    }

    public void setActividades(ArrayList<Actividad> actividades) {
        this.actividades = actividades;
    }
    
    public void anhadirIncidencia(Incidencia incidente){
        incidencias.add(incidente);
    }
    
    public void setSalon(boolean conSalon) {
        this.salonAsignado = conSalon;
    }
    
    public boolean salonQuery() {
        return this.salonAsignado;
    }
    //Modificar
    // public String getDatosTutorActual();
	
}
