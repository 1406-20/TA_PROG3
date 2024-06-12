package pe.edu.pucp.eduprog.planestudios.model;

public class Actividad {
    private int idActividad;
    private Curso curso;
    
    public Actividad(){
        
    }

    public Actividad(int idActividad, Curso curso) {
        this.idActividad = idActividad;
        this.curso = curso;
    }

    public int getIdActividad() {
        return idActividad;
    }

    public Curso getCurso() {
        return curso;
    }

    public void setIdActividad(int idActividad) {
        this.idActividad = idActividad;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }
    
    
}
