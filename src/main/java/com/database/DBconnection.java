package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {
	public static Connection conn;
	
	public static Connection getconn() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/todowebapplication","root","AjiT@2206");
		
		return conn;	
	}
	
}
