/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.eduprog.publicaciones.model;

import java.util.Date;
import pe.edu.pucp.eduprog.usuarios.model.Usuario;

/**
 *
 * @author josep
 */
public class Publicaciones {
    private int idPublicacion;
    private String titulo;
    private String descripcion;
    private boolean activo;
    private byte[] fotoPrincipal;
    private byte[] fotoDescripcion;
    private int idUsuario;
    private Date fechaPublicacion;

    public Publicaciones(String titulo, String descripcion, boolean activo, byte[] fotoPrincipal, byte[] fotoDescripcion, Date fechaPublicacion) {
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.activo = activo;
        this.fotoPrincipal = fotoPrincipal;
        this.fotoDescripcion = fotoDescripcion;
//        this.fotoAutor = fotoAutor;
        this.fechaPublicacion = fechaPublicacion;
    }
    
    public Publicaciones(){}

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdPublicacion() {
        return idPublicacion;
    }

    public void setIdPublicacion(int idPublicacion) {
        this.idPublicacion = idPublicacion;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public byte[] getFotoPrincipal() {
        return fotoPrincipal;
    }

    public void setFotoPrincipal(byte[] fotoPrincipal) {
        this.fotoPrincipal = fotoPrincipal;
    }

    public byte[] getFotoDescripcion() {
        return fotoDescripcion;
    }

    public void setFotoDescripcion(byte[] fotoDescripcion) {
        this.fotoDescripcion = fotoDescripcion;
    }


    public Date getFechaPublicacion() {
        return fechaPublicacion;
    }

    public void setFechaPublicacion(Date fechaPublicacion) {
        this.fechaPublicacion = fechaPublicacion;
    }
    
    
}
