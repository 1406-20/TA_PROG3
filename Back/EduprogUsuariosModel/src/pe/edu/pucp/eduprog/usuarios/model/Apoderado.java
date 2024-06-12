package pe.edu.pucp.eduprog.usuarios.model;

import java.util.ArrayList;
import java.util.Date;

public class Apoderado extends Usuario{
    private int idApoderado;
    private String ocupacion;
    private int telefono;
    private String direccion;
    private RelacionAlumno relacionAlumno;
    private ArrayList<Alumno> alumnosCargo;

    public Apoderado(String ocupacion, int telefono, String direccion, 
            RelacionAlumno relacionAlumno, ArrayList<Alumno> alumnosCargo, 
            int idUsuario, String nombre, String apellidoPaterno, 
            String apellidoMaterno, String correoElectronico, String contrasenha){
        super(nombre,apellidoPaterno,apellidoMaterno,correoElectronico,contrasenha);
        this.ocupacion = ocupacion;
        this.telefono = telefono;
        this.direccion = direccion;
        this.relacionAlumno = relacionAlumno;
        this.alumnosCargo = alumnosCargo;
    }
    
    public Apoderado(){};

    public int getIdApoderado() {
        return idApoderado;
    }

    public void setIdApoderado(int idApoderado) {
        this.idApoderado = idApoderado;
    }  

    public String getOcupacion() {
        return ocupacion;
    }

    public int getTelefono() {
        return telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public RelacionAlumno getRelacionAlumno() {
        return relacionAlumno;
    }

    public ArrayList<Alumno> getAlumnosCargo() {
        return alumnosCargo;
    }

    public void setOcupacion(String ocupacion) {
        this.ocupacion = ocupacion;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setRelacionAlumno(RelacionAlumno relacionAlumno) {
        this.relacionAlumno = relacionAlumno;
    }

    public void setAlumnosCargo(ArrayList<Alumno> alumnosCargo) {
        this.alumnosCargo = alumnosCargo;
    }
	 
    public void anhadirAlumno(Alumno alumno){
        alumnosCargo.add(alumno);
    }
}
