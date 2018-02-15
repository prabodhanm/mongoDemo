package com.thakurcollege.mongoconn;
import com.mongodb.*;
import java.net.UnknownHostException;

public class dconnect {
	final String Host = "localhost";
	final int PORT = 27017;
	final String DBName="RetailStore";
	public Mongo connection;
	public DB database;
	public static dconnect instance;
	
	@SuppressWarnings("deprecation")
	private dconnect(){
		this.connection = new Mongo(this.Host, this.PORT);
		this.database = this.connection.getDB(this.DBName);
		
		/*MongoClient mongoclient = new MongoClient("localhost",27017);
		DB db = mongoclient.getDB(this.DBName);
		DBCollection col = db.getCollection("Sales");*/
	}
	
	public static dconnect CreateInstance(){
		
		
		if(dconnect.instance == null){
			dconnect.instance = new dconnect();
		}
		return dconnect.instance;
	}
	
	public DBCollection GetCollection(String name){
		return this.database.getCollection(name);
	}
}
