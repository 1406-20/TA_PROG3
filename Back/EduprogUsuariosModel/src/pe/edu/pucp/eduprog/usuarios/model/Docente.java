package pe.edu.pucp.eduprog.usuarios.model;
import java.util.ArrayList;
import java.util.Date;
import pe.edu.pucp.eduprog.planestudios.model.Actividad;

public class Docente extends Personal{
    private int idDocente;
    private String especialidad;
    private TipoDocente tipoDocente;
    private ArrayList<Actividad> listaActividades;

    public Docente(){
        
    }

    public Docente(String nombre,String apellidoPaterno,String apellidoMaterno,
            String correoElectronico,String contrasenha,double sueldo,
            Date fechaContrato,String especialidad,TipoDocente tipoDocente){
        super(nombre,apellidoPaterno,apellidoMaterno,correoElectronico,contrasenha,
                sueldo,fechaContrato);
        this.especialidad=especialidad;
        this.tipoDocente=tipoDocente; 
    }

    public int getIdDocente() {
        return idDocente;
    }

    public void setIdDocente(int idDocente) {
        this.idDocente = idDocente;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public TipoDocente getTipoDocente() {
        return tipoDocente;
    }

    public void setTipoDocente(TipoDocente tipoDocente) {
        this.tipoDocente = tipoDocente;
    }

    public ArrayList<Actividad> getListaActividades() {
        return listaActividades;
    }

    public void setListaActividades(ArrayList<Actividad> listaActividades) {
        this.listaActividades = listaActividades;
    }
    
    
}
