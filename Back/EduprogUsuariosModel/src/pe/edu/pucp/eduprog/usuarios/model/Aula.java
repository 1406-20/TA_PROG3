package pe.edu.pucp.eduprog.usuarios.model;
import java.util.ArrayList;
import pe.edu.pucp.eduprog.anhoescolar.model.AnhoEscolar;

public class Aula {
    private int idAula;
    private int grado;
    private char seccion;
    private int nivel;
    private ArrayList<Alumno> alumnos;
    private Docente tutor;
    private AnhoEscolar anhoEscolar;
    private byte[] foto;
    private byte[] horario;

    public Aula(int grado, char seccion, int nivel, Docente tutor, AnhoEscolar anhoEscolar) {
        this.grado = grado;
        this.nivel = nivel;
        this.seccion = seccion;
        alumnos = new ArrayList<Alumno>();
        this.tutor = tutor;
        this.anhoEscolar = anhoEscolar;
    }
    
    public Aula(){};

    public int getIdAula() {
        return idAula;
    }

    public void setIdAula(int idAula) {
        this.idAula = idAula;
    }

    public int getGrado() {
        return grado;
    }
    
    public int getNivel() {
        return nivel;
    }
    
    public char getSeccion() {
        return seccion;
    }

    public ArrayList<Alumno> getAlumnos() {
        return alumnos;
    }
    

    public Docente getTutor() {
        return tutor;
    }

    public AnhoEscolar getAnhoEscolar() {
        return anhoEscolar;
    }

    public void setGrado(int grado) {
        this.grado = grado;
    }
    
    public void setNivel(int nivel) {
        this.nivel = nivel;
    }
    
    public void setSeccion(char seccion) {
        this.seccion = seccion;
    }

    public void setAlumnos(ArrayList<Alumno> alumnos) {
        this.alumnos = alumnos;
    }

    public void setTutor(Docente tutor) {
        this.tutor = tutor;
    }

    public void setAnhoEscolar(AnhoEscolar anhoEscolar) {
        this.anhoEscolar = anhoEscolar;
    }
	
    public void anhadirAlumno(Alumno alumno){
        alumnos.add(alumno);
    }
    
    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }
    
    public byte[] getHorario() {
        return horario;
    }

    public void setHorario(byte[] horario) {
        this.horario = horario;
    }
    
	
}