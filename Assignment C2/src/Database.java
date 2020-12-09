import java.sql.*;

import java.sql.Connection;

public class Database {
    public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/assignC2?allowPublicKeyRetrieval=true&useSSL=false","root","mrunal20");
        }catch(Exception e){System.out.println(e);}
        return con;
    }
}
