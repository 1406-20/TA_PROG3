package pe.edu.pucp.eduprog.usuarios.model;
import java.util.Date;

abstract public class Personal extends Usuario{
    private int idPersonal;
    private double sueldo;
    private Date fechaContrato;
    
    public Personal(){
        
    }
    
    public Personal(String nombre,String apellidoPaterno,String apellidoMaterno,
            String correoElectronico,String contrasenha,double sueldo,
            Date fechaContrato){
        super(nombre,apellidoPaterno,apellidoMaterno,correoElectronico,contrasenha);
        this.sueldo=sueldo;
        this.fechaContrato=fechaContrato;
    }

    public int getIdPersonal() {
        return idPersonal;
    }

    public void setIdPersonal(int idPersonal) {
        this.idPersonal = idPersonal;
    }   

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public Date getFechaContrato() {
        return fechaContrato;
    }

    public void setFechaContrato(Date fechaContrato) {
        this.fechaContrato = fechaContrato;
    }
	
    
    
    
}
