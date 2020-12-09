import java.sql.*;
import java.util.Scanner;

public class jdbc {
    static Scanner sc = new Scanner(System.in);

    public static void main(String args[]){
        int choice=0;
        do{
            System.out.println("1.Create table\n2.Insert values into table\n3.Update\n4.Delete data\n5.Display\n0.Exit");
            choice = sc.nextInt();
            switch (choice){
                case 1:try{
                    Connection con = Database.getConnection();
                    Statement stmt = con.createStatement();
                    String sql = "CREATE TABLE Student("
                            + "ID INT PRIMARY KEY AUTO_INCREMENT, "
                            + "rollno INT, "
                            + "fName VARCHAR (20) NOT NULL, "
                            + "lName VARCHAR (20) NOT NULL, "
                            + "class varchar(5))";
                    stmt.executeUpdate(sql);
                    System.out.println("Table created successfully");
                }catch (Exception e) {
                    System.out.println(e);
                }break;

                case 2: {
                    int roll;
                    String firstn,lastn,cla;
                    System.out.println("Enter first name: ");
                    firstn = sc.next();
                    System.out.println("Enter last name: ");
                    lastn = sc.next();
                    System.out.println("Enter roll no. :");
                    roll = sc.nextInt();
                    System.out.println("Enter class: ");
                    cla = sc.next();

                    try {
                        Connection con = Database.getConnection();
                        PreparedStatement stmt = con.prepareStatement("insert into Student(rollno,fName,lName,class) values(?,?,?,?)");
                        stmt.setInt(1,roll);
                        stmt.setString(2, firstn);
                        stmt.setString(3,lastn);
                        stmt.setString(4,cla);


                        stmt.executeUpdate();
                        System.out.println("Successfully inserted into table");

                    } catch (Exception e) {
                        System.out.println(e);
                    }
                }break;

                case 3:{
                    int id,roll,status = 0;
                    System.out.println("Enter id to update roll no.: ");
                    id = sc.nextInt();
                    System.out.println("Enter roll no.: ");
                    roll = sc.nextInt();
                    try{
                        Connection con = Database.getConnection();
                        Statement stm = con.createStatement();


                        status = stm.executeUpdate("update student set rollno='"+roll+"' where id="+id);

                        con.close();
                        stm.close();

                    }catch (Exception e){
                        System.out.println(e);
                    }
                    if(status == 0){
                        System.out.println("Id not found");
                    }else{
                        System.out.println("Roll no. updated");
                    }
                }break;

                case 4:{
                    int id,status = 0;
                    System.out.println("Enter id to delete record: ");
                    id = sc.nextInt();
                    try{
                        Connection con = Database.getConnection();
                        Statement stm = con.createStatement();


                        status = stm.executeUpdate("delete from student where id="+id);

                        con.close();
                        stm.close();

                    }catch (Exception e){
                        System.out.println(e);
                    }
                    if(status == 0){
                        System.out.println("Id not found");
                    }else{
                        System.out.println("Data deleted successfully");
                    }

                }break;
                case 5:{
                    try{
                        Connection con = Database.getConnection();
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("select * from student");
                        while(rs.next()){
                            System.out.println("ID\t"+"Roll no.   "+"First Name\t"+"Last Name\t"+"Class");
                            System.out.println(
                                    rs.getInt(1) + "\t" +
                                             rs.getInt(2) + "\t   " + rs.getString(3) + "\t\t" + rs.getString(4) + "\t\t" + rs.getString(5));
                        }
                    }catch(Exception e){
                        System.out.println(e);
                    }
                    break;
                }
            }
        }while(choice != 0);
    }
}
