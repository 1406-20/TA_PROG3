package pe.edu.pucp.eduprog.planestudios.model;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Reunion extends Actividad{
    private int idReunion;
    private Date fechaHora;
    private String lugar;
    private String asunto;
    private String descripcion;
    private ArrayList<String> participantes;
    private int duracionMinutos;
    private String estado;
    private String organizador;

    public Reunion(Date fechaHora, String lugar, String asunto, String descripcion, ArrayList<String> participantes, int duracionMinutos, String estado, String organizador, int idActividad, Curso curso) {
        super(idActividad,curso);
        this.fechaHora = fechaHora;
        this.lugar = lugar;
        this.asunto = asunto;
        this.descripcion = descripcion;
        this.participantes = participantes;
        this.duracionMinutos = duracionMinutos;
        this.estado = estado;
        this.organizador = organizador;
    }
    
    public Reunion(){
        
    }

    public int getIdReunion() {
        return idReunion;
    }

    public void setIdReunion(int idReunion) {
        this.idReunion = idReunion;
    }

    

    public Date getFechaHora() {
        return fechaHora;
    }

    public String getLugar() {
        return lugar;
    }

    public String getAsunto() {
        return asunto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public List<String> getParticipantes() {
        return participantes;
    }

    public int getDuracionMinutos() {
        return duracionMinutos;
    }

    public String getEstado() {
        return estado;
    }

    public String getOrganizador() {
        return organizador;
    }

    public void setFechaHora(Date fechaHora) {
        this.fechaHora = fechaHora;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setParticipantes(ArrayList<String> participantes) {
        this.participantes = participantes;
    }

    public void setDuracionMinutos(int duracionMinutos) {
        this.duracionMinutos = duracionMinutos;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public void setOrganizador(String organizador) {
        this.organizador = organizador;
    }

    public void mostrarDatos(){
        SimpleDateFormat sdf = new SimpleDateFormat();
        System.out.println("Asunto de la runion: " + asunto + " Descripcion: "+ descripcion + " Lugar: " + lugar + " Duracion: " + duracionMinutos);
    }
    
    
    
}
