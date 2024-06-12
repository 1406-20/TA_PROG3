/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.eduprog.planesestudio.mysql;

import java.util.ArrayList;
import pe.edu.pucp.eduprog.config.DBManager;
import pe.edu.pucp.eduprog.planestudios.model.Evaluacion;
import pe.edu.pucp.eduprog.planesestudio.dao.EvaluacionDAO;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import pe.edu.pucp.eduprog.planestudios.model.TipoEvaluacion;
import java.sql.CallableStatement;

/**
 *
 * @author josep
 */
public class EvaluacionMySQL implements EvaluacionDAO{
    
    private Connection con;
    private Statement st;
    private ResultSet rs;
    private CallableStatement cs;
    
    @Override
    public int insertar(Evaluacion evaluacion, ArrayList<Integer> idsAlumno, int idDocente){
        
        int resultado = 0;
        try{
            String cadena;
            if(evaluacion.getTipoEvaluacion()==TipoEvaluacion.Practica) cadena = "Práctica"; else cadena = "Examen";
            
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call InsertarEvaluacionYActividad"
                    + "(?,?,?,?,?,?)}");
            cs.registerOutParameter("p_idActividad",
                    java.sql.Types.INTEGER);
            cs.registerOutParameter("p_idEvaluacion",
                    java.sql.Types.INTEGER);
            cs.setInt("p_idCurso", evaluacion.getCurso().getIdCurso());
            cs.setString("p_tipoEvaluacion", cadena);
            cs.setDouble("p_puntajeTotal", evaluacion.getPuntajeTotal());
            cs.setDouble("p_puntajeObtenido", evaluacion.getPuntajeObtenido());
            cs.execute();
            evaluacion.setIdActividad(cs.getInt("p_idActividad"));
            evaluacion.setIdEvaluacion(cs.getInt("p_idEvaluacion"));
            
            for(int idAlumno : idsAlumno){
                cs = con.prepareCall("{call insertarActividadAlumno"
                    + "(?,?)}");
                cs.setInt("_idActividad",evaluacion.getIdActividad());
                cs.setInt("_idAlumno", idAlumno);
                cs.executeUpdate();
            }
            
            cs = con.prepareCall("{call insertarDocenteActividad"+ "(?,?)}");
            cs.setInt("_idDocente", idDocente);
            cs.setInt("_idActividad", evaluacion.getIdActividad());
            cs.executeUpdate();
            
            resultado = evaluacion.getIdActividad();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            
            try{con.close();}catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return resultado;
        
    }
    
    @Override
    public int modificar(Evaluacion evaluacion,ArrayList<Integer> idsAlumno, int idDocente, boolean estado){
        
        int resultado = 0;
        try{
            String cadena;
            if(evaluacion.getTipoEvaluacion()==TipoEvaluacion.Practica) cadena = "Práctica"; else cadena = "Examen";
            
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ActualizarEvaluacionYActividad"
                    + "(?,?,?,?,?,?)}");
            cs.setInt("p_idEvaluacion", evaluacion.getIdEvaluacion());
            cs.setString("p_tipoEvaluacion", cadena);
            cs.setDouble("p_puntajeTotal", evaluacion.getPuntajeTotal());
            cs.setDouble("p_puntajeObtenido", evaluacion.getPuntajeObtenido());
            cs.setInt("p_idActividad", evaluacion.getIdActividad());
            cs.setInt("p_idCurso", evaluacion.getCurso().getIdCurso());
            cs.execute();
            
            resultado = evaluacion.getIdActividad();
            
            cs = con.prepareCall("{call modificarDocenteActividad"+ "(?,?,?)}");
            cs.setInt("_idDocente", idDocente);
            cs.setInt("_idActividad", evaluacion.getIdActividad());
            cs.setBoolean("_estado", estado);
            cs.executeUpdate();
            
            cs = con.prepareCall("{call modificarActividadAlumnoPrimeraParte"+ "(?)}");
            cs.setInt("_idActividad", evaluacion.getIdActividad());
            cs.executeUpdate();
            for(int idAlumno : idsAlumno){
                cs = con.prepareCall("{call modificarActividadAlumnoSegundaParte"
                    + "(?,?)}");
                cs.setInt("_idActividad",evaluacion.getIdActividad());
                cs.setInt("_idAlumno", idAlumno);
                cs.executeUpdate();
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            
            try{con.close();}catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return resultado;
        
        
    }
    
    @Override
    public int eliminar(int evaluacion){
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call eliminarActividadAlumno"+ "(?)}");
            cs.setInt("_idActividad", evaluacion);
            resultado=cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            
            try{con.close();}catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return resultado;
    }
    
    @Override
    public ArrayList<Evaluacion> listarTodas(){
        
        ArrayList<Evaluacion> evaluaciones = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_EVALUACION()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Evaluacion evaluacion = new Evaluacion();
                evaluacion.setIdEvaluacion(rs.getInt("idEvaluacion"));
                String cadena = rs.getString("tipoEvaluacion");
                //if (cadena=="Práctica") evaluacion = TipoEvaluacion.Practica;
                //else evaluacion.TipoEvaluacion = TipoEvaluacion.Examen;
                evaluacion.setPuntajeTotal(rs.getDouble("puntajeTotal"));
                evaluacion.setPuntajeObtenido(rs.getDouble("puntajeObtenido"));
                
                evaluaciones.add(evaluacion);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return evaluaciones;
        
    }
    
    @Override
    public ArrayList<String> listarNotasxAlumno(int id) {
       ArrayList<String> notasxalumno = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_NOTAS_ID(?)}");
            cs.setInt("_id_alumno", id);
            rs = cs.executeQuery();
            while(rs.next()){
                String Curso = rs.getString("CURSO");
                String Criterio = rs.getString("CRITERIO");
                String Nota = String.valueOf(rs.getInt("NOTA"));
                String Cadena = new String();
                Cadena = Curso + "-" + Criterio + "-" + Nota;
                notasxalumno.add(Cadena);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return notasxalumno;
    }
//        ArrayList<Evaluacion> evaluaciones =  new ArrayList<>();
//        try{
//            con = DBManager.getInstance().getConnection();
//            String sql = "SELECT * FROM Evaluacion WHERE puntajeTotal >= 1";
//            st = con.createStatement();
//            rs = st.executeQuery(sql);
//            while(rs.next()){
//                Evaluacion evaluacion = new Evaluacion();
//                evaluacion.setPuntajeObtenido(rs.getDouble("puntajeObtenido"));
//                evaluacion.setPuntajeTotal(rs.getDouble("puntajeTotal"));
//                String cadena = rs.getString("tipoEvaluacion");
//                if(cadena == "Practica") evaluacion.setTipoEvaluacion(TipoEvaluacion.Practica);
//                else evaluacion.setTipoEvaluacion(TipoEvaluacion.Examen);
//                evaluaciones.add(evaluacion);
//            }
//        }catch(Exception ex){
//            System.out.println(ex.getMessage());
//        }finally{
//            try{rs.close();}catch(Exception ex){System.out.println(ex.getMessage());}
//            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
//        }
//        return evaluaciones;
//    }
    
    
}
