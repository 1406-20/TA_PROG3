/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.eduprog.planesestudio.mysql;

import pe.edu.pucp.eduprog.planesestudio.dao.CursoDAO;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.eduprog.config.DBManager;
import pe.edu.pucp.eduprog.planestudios.model.Curso;
import java.sql.CallableStatement;

/**
 *
 * @author josep
 */
public class CursoMySQL implements CursoDAO{
    
    private Connection con;
    private Statement st;
    private ResultSet rs;
    private CallableStatement cs;
    
    @Override
    public int insertar(Curso curso, int idDocente){

        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call InsertarCurso"
                    + "(?,?,?,?,?,?)}");
            cs.registerOutParameter("p_idCurso",java.sql.Types.INTEGER);
            cs.setString("p_nombreCurso", curso.getNombreCurso());
            cs.setString("p_Descripcion", curso.getDescripcion());
            cs.setString("p_Estado",curso.getEstado());
            cs.setInt("p_idDocente", idDocente);
            cs.setDate("p_fechaCreacion", new java.sql.Date(curso.getFechaCreacion().getTime()));
            cs.executeUpdate();
            curso.setIdCurso(cs.getInt("p_idCurso"));
            resultado = curso.getIdCurso();
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
    public int modificar(Curso curso){
        
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ActualizarCurso"
                    + "(?,?,?,?,?)}");
            cs.setInt("p_idCurso", curso.getIdCurso());
            cs.setString("p_nombreCurso", curso.getNombreCurso());
            cs.setString("p_Descripcion",curso.getDescripcion());
            cs.setString("p_Estado", curso.getEstado());
            cs.setDate("p_fechaCreacion", new java.sql.Date(curso.getFechaCreacion().getTime()));
            cs.execute();
            resultado = curso.getIdCurso();
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
    public int eliminar(int curso){
        return 0;
    }
    
    @Override
    public ArrayList<Curso> listarTodas(){
        
        ArrayList<Curso> cursos = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_CURSO()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Curso curso = new Curso();
                curso.setIdCurso(rs.getInt("idCurso"));
                curso.setNombreCurso(rs.getString("nombreCurso"));
                curso.setDescripcion( rs.getString("Descripcion"));
                curso.setEstado(rs.getString("Estado"));
                curso.setFechaCreacion(rs.getDate("fechaCreacion"));
                
                cursos.add(curso);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return cursos;
    }
    @Override
    public Curso obtenerCursoXId(int idCurso) {
        Curso curso = new Curso();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call obtenerCursoXId(?)}");
            cs.setInt("_idCurso", idCurso);
            rs = cs.executeQuery();
            while(rs.next()){
                curso.setIdCurso(rs.getInt("idCurso"));
                curso.setDescripcion(rs.getString("descripcion"));
                curso.setEstado(rs.getString("estado"));
                curso.setNombreCurso(rs.getString("nombreCurso"));
                curso.setFechaCreacion(rs.getDate("fechaCreacion"));
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return curso;
    }
    
}
