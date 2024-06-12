package pe.edu.pucp.eduprog.planestudios.model;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Curso {
    private int idCurso;
    private String nombreCurso;
    private String Descripcion;
    private String Estado;
    private Date fechaCreacion;

    public Curso(int idCurso, String nombreCurso, String Descripcion, String Estado, Date fechaCreacion) {
        this.idCurso = idCurso;
        this.nombreCurso = nombreCurso;
        this.Descripcion = Descripcion;
        this.Estado = Estado;
        this.fechaCreacion = fechaCreacion;
    }
    
    public Curso(){
        
    }

    public String getNombreCurso() {
        return nombreCurso;
    }
    
    

    public int getIdCurso() {
        return idCurso;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public String getEstado() {
        return Estado;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setIdCurso(int idCurso) {
        this.idCurso = idCurso;
    }

    public void setNombreCurso(String nombreCurso) {
        this.nombreCurso = nombreCurso;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
    
    public void mostrarDatos(){
     SimpleDateFormat sdf = new SimpleDateFormat();
     System.out.println("Nombre del curso: " + nombreCurso + " Descripcion: "+ Descripcion + " Estado: " + Estado + "Fecha de crecion: " + sdf.format(fechaCreacion));
    }
}
