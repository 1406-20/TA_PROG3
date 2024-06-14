package pe.edu.pucp.eduprog.config;
import java.sql.DriverManager;
import java.sql.Connection;

/**
 *
 * @author josep
 */
public class DBManager {
    public static String url = "jdbc:mysql://"+"base-pruebas.ca3okvgzowf0.us-east-1.rds.amazonaws.com"+
            ":3306/Prueba_grupo?useSSL=false";
    public static String user = "master";
    public static String password = "pruebaspruebas";
    private static DBManager dbManager;
    private Connection con;
    
    public static DBManager getInstance(){
        if(dbManager == null){
            createInstance();
        }
        return dbManager;
    }
    
    public Connection getConnection(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url,user,password);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return con;
    }
    
    private static void createInstance(){
        if(dbManager == null){
            dbManager = new DBManager();    
        }
    }
}