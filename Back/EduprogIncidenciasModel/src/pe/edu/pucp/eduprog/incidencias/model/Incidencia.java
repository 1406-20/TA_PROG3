package pe.edu.pucp.eduprog.incidencias.model;

import java.util.Date;

public abstract class Incidencia {
    
    private static int idIncidencia;
    private int idAlumno;
    private String nombreAlumno;
    private String descripcion;
    private Date fechaRegistro;
    private int docenteRegistro;
    private int estado;
    private char tipo;

    public Incidencia(String descripcion, Date fechaRegistro, int docenteRegistro, int estado, char tipo) {
        this.descripcion = descripcion;
        this.fechaRegistro = fechaRegistro;
        this.docenteRegistro = docenteRegistro;
        this.estado = estado;
        this.tipo = tipo;
    }

    public Incidencia() {
    }

    public String getNombreAlumno() {
        return nombreAlumno;
    }

    public void setNombreAlumno(String nombreAlumno) {
        this.nombreAlumno = nombreAlumno;
    }
    
    

    public int getIdAlumno() {
        return idAlumno;
    }

    public void setIdAlumno(int idAlumno) {
        this.idAlumno = idAlumno;
    }
    
    

    public void setIdIncidencia(int idIncidencia) {
        Incidencia.idIncidencia = idIncidencia;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public void setDocenteRegistro(int docenteRegistro) {
        this.docenteRegistro = docenteRegistro;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public void setTipo(char tipo) {
        this.tipo = tipo;
    }

    public int getIdIncidencia() {
        return idIncidencia;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    public int getDocenteRegistro() {
        return docenteRegistro;
    }

    public int getEstado() {
        return estado;
    }

    public char getTipo() {
        return tipo;
    }    
}
