package pe.edu.pucp.eduprog.incidencias.model;

import java.util.Date;

public class Demerito extends Incidencia{
    private int codigoDemerito;
    private String comentario;

    public Demerito(int codigoDemerito, String comentario, String descripcion, 
            Date fechaRegistro, int docenteRegistro, int estado, char tipo) {
        super(descripcion, fechaRegistro, docenteRegistro, estado, tipo);
        this.codigoDemerito = codigoDemerito;
        this.comentario = comentario;
    }

    public Demerito() {
    }
    
    

    public void setCodigoDemerito(int codigoDemerito) {
        this.codigoDemerito = codigoDemerito;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public int getCodigoDemerito() {
        return codigoDemerito;
    }

    public String getComentario() {
        return comentario;
    }
}
