import java.util.*;
import java.sql.*;
public class jdbc {
    static Scanner sc = new Scanner(System.in);
    static func f = new func();
    public static void main(String[] args){
        String choice;
        String t;
        while(true){
            System.out.println("1.Create view\n2.Create index\n3.Show index\n4.Drop index\n5.Sequence");
            t = sc.next();
            switch(t){
                case "1": while(true){
                    System.out.println("1.Simple view\n2.Complex view\n3.Drop Simple view\n4.Drop complex\n0.Exit");
                    choice = sc.next();
                    if (choice.equals("0")) {
                        break;
                    }
                    switch(choice){
                        case "1": f.simpleview();break;
                        case "2": f.complexview();break;
                        case "3":f.drop_simpleview();break;
                        case "4":f.drop_compleview();break;
                    }

                }break;
                case "2": while(true){
                    System.out.println("1.Simple index\n2.Unique index\n3.Composite index\n0.Exit");
                    choice = sc.next();
                    if (choice.equals("0")) {
                        break;
                    }
                    switch(choice) {
                        case "1":
                            f.create_index();
                            break;
                        case "2": f.create_uniindex();break;
                        case "3": f.composit_index();break;
                    }

                }break;
                case "3":try {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/te_31239?allowPublicKeyRetrieval=true&useSSL=false", "root", "mrunal20");
                                Statement stmt = con.createStatement();
                                ResultSet rs = stmt.executeQuery("show indexes from Book");
                            while(rs.next()){
                                System.out.println(rs.getString(1) + "\t\t" + rs.getString(2) + "\t\t" + rs.getString(3) +
                                        "\t\t\t\t" + rs.getString(4) + "\t\t" + rs.getString(5) + "\t\t" + rs.getString(6) + "\t\t" + rs.getString(11));
                            }

                                con.close();
                                stmt.close();
                            }catch (Exception e){
                                System.out.println(e);
                            }
                            break;

                case "4": while(true){
                    System.out.println("1.Simple index\n2.Unique index\n3.Composite index\n0.Exit");
                    choice = sc.next();
                    if (choice.equals("0")) {
                        break;
                    }
                    switch(choice) {
                        case "1":f.drop_simpleindex();

                            break;
                        case "2":f.drop_uniqueindex();break;
                        case "3":f.drop_compositeindex();break;
                    }

                }break;
                case "5":while(true){
                    System.out.println("1.Create table\n2.Show table\n3.drop table\n0.Exit");
                    choice = sc.next();
                    if (choice.equals("0")) {
                        break;
                    }
                    switch(choice) {
                        case "1":f.create_table();

                            break;
                        case "2":f.display_table();break;
                        case "3": try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/te_31239?allowPublicKeyRetrieval=true&useSSL=false", "root", "mrunal20");
                            Statement stmt = con.createStatement();
                            stmt.executeUpdate("drop table sequence");

                            con.close();
                            stmt.close();
                        }catch (Exception e){
                            System.out.println(e);
                        }break;
                    }

                }break;

            }

            System.out.println("Do you want to continue?");
            String a = sc.next();
            if(a.equals("Y")) {
                continue;
            } else {
                break;
            }
        }
    }
}
