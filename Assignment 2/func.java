import java.sql.*;
public class func {

    void simpleview(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/te_31239?allowPublicKeyRetrieval=true&useSSL=false","root","mrunal20");
            Statement stmt = con.createStatement();

            String st = "create or replace view customerview1 as select cust_no,cust_fname,cust_lname from customer";
            stmt.executeUpdate(st);
            ResultSet rs = stmt.executeQuery("select * from customerview1");
            while(rs.next()){
                System.out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getString(3));
            }
            con.close();
            stmt.close();


        }catch (Exception e){
            System.out.println(e);
        }
    }

    void complexview(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/te_31239?allowPublicKeyRetrieval=true&useSSL=false", "root", "mrunal20");
            Statement stmt = con.createStatement();

            String st = "create or replace view book_name as select b.title,p.publisher_name from publisher p,book b where p.publisher_no = b.publisher_no";
            stmt.executeUpdate((st));
            ResultSet rs = stmt.executeQuery("select * from book_name");
            while(rs.next()){
                System.out.println(rs.getString(1) + "\t\t" + rs.getString(2));
            }
            con.close();
            stmt.close();
        }catch (Exception e){
            System.out.println(e);
        }
    }

    void drop_simpleview(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/te_31239?allowPublicKeyRetrieval=true&useSSL=false", "root", "mrunal20");
            Statement stmt = con.createStatement();
            stmt.executeUpdate("DROP VIEW IF EXISTS customerview1");

            con.close();
            stmt.close();
        }catch (Exception e){
            System.out.println(e);
        }
    }

    void drop_compleview(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/te_31239?allowPublicKeyRetrieval=true&useSSL=false", "root", "mrunal20");
            Statement stmt = con.createStatement();
            stmt.executeUpdate("DROP VIEW IF EXISTS book_name");

            con.close();
            stmt.close();
        }catch (Exception e){
            System.out.println(e);
        }
    }

    void create_index(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/te_31239?allowPublicKeyRetrieval=true&useSSL=false", "root", "mrunal20");
            String s = "create index index1 on Book(title)";

            Statement stmt = con.createStatement();
            stmt.executeUpdate((s));
            con.close();
            stmt.close();
        }catch (Exception e){
            System.out.println(e);
        }
    }

    void create_uniindex(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/te_31239?allowPublicKeyRetrieval=true&useSSL=false", "root", "mrunal20");
            String s = "create UNIQUE index index2 on Book(ISBN)";

            Statement stmt = con.createStatement();
            stmt.executeUpdate((s));
            con.close();
            stmt.close();
        }catch (Exception e){
            System.out.println(e);
        }
    }

    void composit_index(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/te_31239?allowPublicKeyRetrieval=true&useSSL=false", "root", "mrunal20");
            String s = "create index index3 on Book(ISBN,title)";

            Statement stmt = con.createStatement();
            stmt.executeUpdate((s));
            con.close();
            stmt.close();
        }catch (Exception e){
            System.out.println(e);
        }
    }

    void drop_simpleindex(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/te_31239?allowPublicKeyRetrieval=true&useSSL=false", "root", "mrunal20");
            String s = "drop index index1 on book";
            Statement stmt = con.createStatement();
            stmt.executeUpdate((s));
            con.close();
            stmt.close();
        }catch (Exception e){
            System.out.println(e);
        }
    }

    void drop_uniqueindex(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/te_31239?allowPublicKeyRetrieval=true&useSSL=false", "root", "mrunal20");
            String s = "drop index index2 on book";

            Statement stmt = con.createStatement();
            stmt.executeUpdate((s));
            con.close();
            stmt.close();
        }catch (Exception e){
            System.out.println(e);
        }
    }

    void drop_compositeindex(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/te_31239?allowPublicKeyRetrieval=true&useSSL=false", "root", "mrunal20");
            String s = "drop index index3 on book";

            Statement stmt = con.createStatement();
            stmt.executeUpdate((s));
            con.close();
            stmt.close();
        }catch (Exception e){
            System.out.println(e);
        }
    }

    void create_table(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/te_31239?allowPublicKeyRetrieval=true&useSSL=false", "root", "mrunal20");
            Statement stmt = con.createStatement();
            stmt.executeUpdate("create table sequence(id int auto_increment,name varchar(20),primary key(id))");
            stmt.executeUpdate( "insert into sequence(id,name) values(NULL,'A')");
            stmt.executeUpdate( "insert into sequence(id,name) values(NULL,'B')");
            stmt.executeUpdate( "insert into sequence(id,name) values(NULL,'C')");
            stmt.executeUpdate( "insert into sequence(id,name) values(NULL,'D')");
            stmt.executeUpdate( "insert into sequence(id,name) values(NULL,'E')");

            con.close();
            stmt.close();
        }catch (Exception e){
            System.out.println(e);
        }
    }

    void display_table(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/te_31239?allowPublicKeyRetrieval=true&useSSL=false", "root", "mrunal20");
            Statement stmt = con.createStatement();
            ResultSet rs11=stmt.executeQuery("select * from sequence");
            while(rs11.next()) {
                System.out.println(rs11.getInt(1)+" -"+rs11.getString(2));
            }
            con.close();
            stmt.close();
        }catch (Exception e){
            System.out.println(e);
        }
    }
}
