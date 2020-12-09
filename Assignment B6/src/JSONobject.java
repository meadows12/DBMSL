import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;
import org.bson.Document;
import org.bson.json.JsonWriterSettings;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONString;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

public class JSONobject {

    static final MongoClient mongoclient = new MongoClient(new MongoClientURI("mongodb://localhost:27017"));
    static final MongoDatabase db = mongoclient.getDatabase("assignC1");
    static final MongoCollection<Document> mongoCollection = db.getCollection("users");


    static Scanner sc = new Scanner(System.in);
    public static void main(String args[]) throws JSONException {


//        JSONObject obj = new JSONObject();
//        System.out.println("Enter name: ");
//        String name = sc.next();
//        System.out.println("Enter age: ");
//        String age = sc.next();
//        obj.put("name",name);
//        obj.put("age",age);
//        System.out.println(obj);
//
//        JSONObject obj1=new JSONObject();
//        System.out.println("Enter Name:");
//        String name1=sc.next();
//        System.out.println("Enter age:");
//        String age1=sc.next();
//        obj1.put("Name", name1);
//        obj1.put("age",age1);
//        System.out.println(obj1);
//
//        JSONArray arr=new JSONArray();
//        arr.put(obj);
//        arr.put(obj1);
//
//        System.out.println(arr);
//
//        for(int i=0;i<2;i++)
//        {
//            Document d1=Document.parse(arr.get(i).toString());
//            mongoCollection.insertOne(d1);
//        }
//
//        FindIterable<Document> iter=mongoCollection.find();
//        Iterator<Document> i=iter.iterator();
//        while(i.hasNext())
//        {
//            System.out.println(i.next());
//        }

        int n;
        System.out.println("Enter the number of documnets to be inserted");
        n=sc.nextInt();
        JSONArray arr=new JSONArray();

        for(int i=0;i<n;i++)
        {
            JSONObject obj=new JSONObject();
            System.out.println("Enter name: ");
            String name=sc.next();
            System.out.println("Enter class: ");
            String classname=sc.next();
            obj.put("Name", name);
            obj.put("Class", classname);
            System.out.println(obj);
            arr.put(obj);
        }

        System.out.println("The array of json objects is:\n"+ arr);

        //inserting into collection a single document at a time
        for(int i=0;i<n;i++)
        {
            Document d1=Document.parse(arr.get(i).toString());
            mongoCollection.insertOne(d1);
        }

        
        //Displaying the data from col
        FindIterable<Document>iter=mongoCollection.find();
        Iterator<Document>i=iter.iterator();
        while(i.hasNext())
        {
            System.out.println(i.next());
        }




    }


}
