package pe.edu.pucp.eduprog.usuarios.model;
import java.util.Date;

public class Trabajador extends Personal{
    private int idTrabajador;
    private String cargo;
    private TipoTrabajador tipoTrabajador;
    
    public Trabajador(){
        
    }
	
    public Trabajador(String nombre,String apellidoPaterno,String apellidoMaterno,
            String correoElectronico,String contrasenha,double sueldo,Date fechaContrato,
            String cargo,TipoTrabajador tipoTrabajador){
        super(nombre,apellidoPaterno,apellidoMaterno,correoElectronico,contrasenha,
                sueldo,fechaContrato);
        this.cargo=cargo;
        this.tipoTrabajador=tipoTrabajador;
    }

    public int getIdTrabajador() {
        return idTrabajador;
    }

    public void setIdTrabajador(int idTrabajador) {
        this.idTrabajador = idTrabajador;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public TipoTrabajador getTipoTrabajador() {
        return tipoTrabajador;
    }

    public void setTipoTrabajador(TipoTrabajador tipoTrabajador) {
        this.tipoTrabajador = tipoTrabajador;
    }
    
    
}
