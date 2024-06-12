package pe.edu.pucp.eduprog.planestudios.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Sesion extends Actividad{
    private int idSesion;
    private Date fechaInicio;
    private Date fechaFin;
    private char asistencia;

    public Sesion(Date fechaInicio, Date fechaFin, char asistencia, int idActividad, Curso curso) {
        super(idActividad, curso);
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.asistencia = asistencia;
    }

    
    public Sesion(){
        
    }

    public int getIdSesion() {
        return idSesion;
    }

    public void setIdSesion(int idSesion) {
        this.idSesion = idSesion;
    }
    
    

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public char getAsistencia() {
        return asistencia;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public void setAsistencia(char asistencia) {
        this.asistencia = asistencia;
    }
    
    public void mostrarDatos(){
        SimpleDateFormat sdf = new SimpleDateFormat();
        System.out.println("Fecha de inicio: " + sdf.format(fechaInicio) + " Fecha de fin: "+ sdf.format(fechaInicio));
    }
}
