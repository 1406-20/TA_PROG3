package pe.edu.pucp.eduprog.usuarios.model;

import java.util.Date;

public abstract class Usuario {
    private int idUsuario;
    private static int correspondiente = 1000;
    private String nombre;
    private String apellidoPaterno;
    private String apellidoMaterno;
    private String correoElectronico;
    private String contrasenha;
    private Date fechaCreacion;
    private boolean activo;
    private byte[] foto;

    public Usuario(String nombre, String apellidoPaterno, String apellidoMaterno, 
            String correoElectronico, String contrasenha) {
        this.idUsuario = correspondiente++;
        this.nombre = nombre;
        this.apellidoPaterno = apellidoPaterno;
        this.apellidoMaterno = apellidoMaterno;
        this.correoElectronico = correoElectronico;
        this.contrasenha = contrasenha;
        this.fechaCreacion = new Date();
        activo = true;
    }

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }
    
    

    public Usuario(){};
    
    public int getIdUsuario() {
        return idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidoPaterno() {
        return apellidoPaterno;
    }

    public String getApellidoMaterno() {
        return apellidoMaterno;
    }
    
    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public String getContrasenha() {
        return contrasenha;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellidoPaterno(String apellido) {
        this.apellidoPaterno = apellido;
    }
    
    public void setApellidoMaterno(String apellido) {
        this.apellidoMaterno = apellido;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public void setContrasenha(String contrasenha) {
        this.contrasenha = contrasenha;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public boolean getActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }
    
    
    
}