import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;
import org.bson.Document;
import org.bson.json.JsonWriterSettings;

import javax.swing.event.DocumentListener;
import javax.swing.event.UndoableEditListener;
import javax.swing.text.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Mongoconn {

    static final MongoClient mongoclient = new MongoClient(new MongoClientURI("mongodb://localhost:27017"));
    static final MongoDatabase db = mongoclient.getDatabase("assignC1");
    static final MongoCollection<Document> mongoCollection = db.getCollection("employee");
    static final JsonWriterSettings settings = JsonWriterSettings.builder().indent(true).build();;

    static Scanner sc = new Scanner(System.in);
    public static void main(String args[]){
        int choice = 0;
            do {

                System.out.println("1.Insert\n2.Insert Many\n3.Update document\n4.Show document\n5.Delete document\n0.Exit");
                choice = sc.nextInt();
                switch(choice){
                    case 1: insert();break;
                    case 2:insertmany();break;
                    case 3:update();break;
                    case 4:find();break;
                    case 5:delete();break;
                }

            }while(choice != 0);


    }

    public static void insertmany(){
        String name,pos;
        int age,sal;
        List documents = new ArrayList();
        int n;
        System.out.println("Enter no. of document you want to enter: ");
        n = sc.nextInt();
        for (int i = 0; i < n; i++) {

            System.out.println("Enter name: ");
            name = sc.next();
            System.out.println("Enter age: ");
            age = sc.nextInt();
            System.out.println("Enter position: ");
            pos = sc.next();
            System.out.println("Enter salary");
            sal = sc.nextInt();
            documents.add(new Document ("Name", name)
                    .append("age", age)
                    .append("position", pos)
                    .append("sal", sal)
            );
        }
        mongoCollection.insertMany(documents);
    }

    public static void insert(){
        String name,pos;
        int age,sal;
//        List documents = new ArrayList();
//        int n;
//        System.out.println("Enter no. of document you want to enter: ");
//        n = sc.nextInt();
//        for (int i = 0; i < n; i++) {
//
//            System.out.println("Enter name: ");
//            name = sc.next();
//            System.out.println("Enter age: ");
//            age = sc.nextInt();
//            System.out.println("Enter position: ");
//            pos = sc.next();
//            System.out.println("Enter salary");
//            sal = sc.nextInt();
//            documents.add(new Document ("Name", name)
//                    .append("age", age)
//                    .append("creator", "")
//                    .append("pet", "")
//            );
//        }
//        mongoCollection.insertMany(documents);

        System.out.println("Enter name: ");
        name = sc.next();
        System.out.println("Enter age: ");
        age = sc.nextInt();
        System.out.println("Enter position: ");
        pos = sc.next();
        System.out.println("Enter salary");
        sal = sc.nextInt();

        Document emp = new Document();
        emp.append("Name",name);
        emp.append("age",age);
        emp.append("Position",pos);
        emp.append("salary",sal);

        try{
            mongoCollection.insertOne(emp);
            System.out.println("Successfully inserted document. \n");
        }catch (Exception e){

        }
    }

    private static void update(){
        String name;
        int salary;
        System.out.println("Enter name to update salary");
        name = sc.next();
        System.out.println("Enter New Salary");
        salary = sc.nextInt();

        mongoCollection.updateOne(Filters.eq("Name",name), Updates.set("salary",salary));
    }
    private static void find(){
        for (Document document : mongoCollection.find()) {
            System.out.println(document.toJson(settings));
        }
    }

    private static void delete(){
        String name;
        System.out.println("Enter name to delete document: ");
        name = sc.next();

        mongoCollection.deleteMany(Filters.eq("Name",name));
    }
}
