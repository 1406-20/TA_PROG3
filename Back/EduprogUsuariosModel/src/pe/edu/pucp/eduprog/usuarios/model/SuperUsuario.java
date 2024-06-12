package pe.edu.pucp.eduprog.usuarios.model;
import java.util.Date;

public class SuperUsuario extends Personal{
    private int idSuperUsuario;
    private String cargo;
    private String areaAdministrativa;
    
    public SuperUsuario(){
        
    }
	
    public SuperUsuario(String nombre,String apellidoPaterno,String apellidoMaterno,
            String correoElectronico,String contrasenha,double sueldo,
            Date fechaContrato,String cargo,String areaAdministrativa){
        super(nombre,apellidoPaterno,apellidoMaterno,correoElectronico,contrasenha,
                sueldo,fechaContrato);
        this.cargo=cargo;
        this.areaAdministrativa=areaAdministrativa;
    }

    public int getIdSuperUsuario() {
        return idSuperUsuario;
    }

    public void setIdSuperUsuario(int idSuperUsuario) {
        this.idSuperUsuario = idSuperUsuario;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getAreaAdministrativa() {
        return areaAdministrativa;
    }

    public void setAreaAdministrativa(String areaAdministrativa) {
        this.areaAdministrativa = areaAdministrativa;
    }
    
}
