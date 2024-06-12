package pe.edu.pucp.eduprog.planestudios.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class Tarea extends Actividad{
    private int idTarea;
    private String descripcion;
    private Date fechaRegistro;
    private TipoTarea tipoTarea;
    private String estado;

    public Tarea(String descripcion, Date fechaRegistro, TipoTarea tipoTarea, String estado, int idActividad, Curso curso) {
        super(idActividad,curso);
        this.descripcion = descripcion;
        this.fechaRegistro = fechaRegistro;
        this.tipoTarea = tipoTarea;
        this.estado = estado;
    }

    public Tarea(){}

    public int getIdTarea() {
        return idTarea;
    }

    public void setIdTarea(int idTarea) {
        this.idTarea = idTarea;
    }

    
    
    public String getDescripcion() {
        return descripcion;
    }

    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    public TipoTarea getTipoTarea() {
        return tipoTarea;
    }

    public String getEstado() {
        return estado;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public void setTipoTarea(TipoTarea tipoTarea) {
        this.tipoTarea = tipoTarea;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    public void mostrarDatos(){
        SimpleDateFormat sdf = new SimpleDateFormat();
        System.out.println("Descripcion: " + descripcion + " fecha de Registro: "+ sdf.format(fechaRegistro) + " Estado: " + estado);
    }
    
}
