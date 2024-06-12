/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.eduprog.anhoescolar.dao;
import pe.edu.pucp.eduprog.anhoescolar.model.Periodo;
import java.util.ArrayList;
/**
 *
 * @author fransua
 */
public interface PeriodoDAO {
    int insertar(Periodo periodo);
    int modificar(Periodo periodo);
    int eliminar(int idPeriodo);
    ArrayList<Periodo>listarTodas();
}
