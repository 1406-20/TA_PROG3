package pe.edu.pucp.eduprog.incidencias.model;

import java.util.Date;

public class Merito extends Incidencia{
    private int codigoMerito;
    private String comentario;

    public Merito(int codigoMerito, String comentario, String descripcion, 
            Date fechaRegistro, int docenteRegistro, int estado, char tipo){
        super(descripcion, fechaRegistro, docenteRegistro, estado, tipo);
        this.codigoMerito = codigoMerito;
        this.comentario = comentario;
    }

    public Merito() {
    }
    
    

    public int getCodigoMerito() {
        return codigoMerito;
    }

    public String getComentario() {
        return comentario;
    }

    public void setCodigoMerito(int codigoMerito) {
        this.codigoMerito = codigoMerito;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }
}
