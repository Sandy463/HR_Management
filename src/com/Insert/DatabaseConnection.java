package com.Insert;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
	public class DatabaseConnection {

		private static Connection con;
	    public DatabaseConnection() {

	    }
	    public static Connection loadDriver() throws SQLException {
	    	try {
	    		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    	} catch (ClassNotFoundException ex) {
	    			System.out.println(ex.getMessage());
	    	}
	    	con = DriverManager.getConnection("jdbc:sqlserver://sandy\\sqlexpress;databaseName=Userinfo;user=superuser;password=muppet123");
	    	return con;

	    }
	}