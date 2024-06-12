/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.eduprog.anhoescolar.model;

import java.util.Date;

/**
 *
 * @author fransua
 */
public class Periodo {
    private int idPeriodo;
    private AnhoEscolar anho;
    private TipoPeriodo tipoPeriodo;
    private Date fechaInicio;
    private Date fechaFin;
    private int activo;

    public Periodo(AnhoEscolar anho, TipoPeriodo tipoPeriodo, Date fechaInicio, Date fechaFin) {
        this.anho = anho;
        this.tipoPeriodo = tipoPeriodo;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.activo=1;
    }
    public Periodo(){}
    
    public int getActivo() {
        return activo;
    }
    public int getIdPeriodo() {
        return idPeriodo;
    }

    public void setIdPeriodo(int idPeriodo) {
        this.idPeriodo = idPeriodo;
    }
    public void setActivo(int activo) {
        this.activo = activo;
    }

    public AnhoEscolar getAnho() {
        return anho;
    }

    public void setAnho(AnhoEscolar anho) {
        this.anho = anho;
    }

    public TipoPeriodo getTipoPeriodo() {
        return tipoPeriodo;
    }

    public void setTipoPeriodo(TipoPeriodo tipoPeriodo) {
        this.tipoPeriodo = tipoPeriodo;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }
    
    
}
