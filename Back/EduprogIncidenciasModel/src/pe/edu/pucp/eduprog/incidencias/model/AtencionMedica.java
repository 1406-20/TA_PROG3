package pe.edu.pucp.eduprog.incidencias.model;

import java.util.Date;

public class AtencionMedica extends Incidencia{
    
    private String tipoAtencion;
    private String diagnostico;//
    private String tratamiento;//
    private Date hora;

    public AtencionMedica(String tipoAtencion, String diagnostico, 
            String tratamiento, Date hora, String descripcion, Date fechaRegistro, 
            int docenteRegistro, int estado, char tipo) {
        super(descripcion, fechaRegistro, docenteRegistro, estado, tipo);
        this.tipoAtencion = tipoAtencion;
        this.diagnostico = diagnostico;
        this.tratamiento = tratamiento;
        this.hora = hora;
    }

    public AtencionMedica() {
    }
    
    

    public String getTipoAtencion() {
        return tipoAtencion;
    }

    public String getDiagnostico() {
        return diagnostico;
    }

    public String getTratamiento() {
        return tratamiento;
    }

    public Date getHora() {
        return hora;
    }

    public void setTipoAtencion(String tipoAtencion) {
        this.tipoAtencion = tipoAtencion;
    }

    public void setDiagnostico(String diagnostico) {
        this.diagnostico = diagnostico;
    }

    public void setTratamiento(String tratamiento) {
        this.tratamiento = tratamiento;
    }

    public void setHora(Date hora) {
        this.hora = hora;
    }
}
