package pe.edu.pucp.eduprog.planestudios.model;

public class Evaluacion extends Actividad{
    private int idEvaluacion;
    private TipoEvaluacion tipoEvaluacion;
    private double puntajeTotal;
    private double puntajeObtenido;

    public Evaluacion(TipoEvaluacion tipoEvaluacion, double puntajeTotal, double puntajeObtenido, int idActividad, Curso curso) {
        super(idActividad,curso);
        this.tipoEvaluacion = tipoEvaluacion;
        this.puntajeTotal = puntajeTotal;
        this.puntajeObtenido = puntajeObtenido;
    }

    public Evaluacion()
    {
        
    }

    public int getIdEvaluacion() {
        return idEvaluacion;
    }

    public void setIdEvaluacion(int idEvaluacion) {
        this.idEvaluacion = idEvaluacion;
    }
    
    
    
    public TipoEvaluacion getTipoEvaluacion() {
        return tipoEvaluacion;
    }

    public double getPuntajeTotal() {
        return puntajeTotal;
    }

    public double getPuntajeObtenido() {
        return puntajeObtenido;
    }

    public void setTipoEvaluacion(TipoEvaluacion tipoEvaluacion) {
        this.tipoEvaluacion = tipoEvaluacion;
    }

    public void setPuntajeTotal(double puntajeTotal) {
        this.puntajeTotal = puntajeTotal;
    }

    public void setPuntajeObtenido(double puntajeObtenido) {
        this.puntajeObtenido = puntajeObtenido;
    }
    
    public void mostrarDatos(){
        String cadena;
        if(tipoEvaluacion==TipoEvaluacion.Practica) cadena = "Práctica"; else cadena = "Examen";
        System.out.println("Puntaje obtenido: " + puntajeObtenido + " Puntaje total: " + puntajeTotal + " " + cadena);
    }

    
}
