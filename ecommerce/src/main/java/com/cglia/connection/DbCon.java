package com.cglia.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 * 
 * @author venkata.marni
 * @since 22-05-2023
 * @version 1.0
 */
public class DbCon {
	 private static Connection connection;
	 /**
	  * 
	  * @return An URL that is used for connecting to the database
	  * @throws ClassNotFoundException
	  * @throws SQLException
	  */
	 public static Connection getConnection() throws ClassNotFoundException, SQLException{
		 if(connection == null) {
			 Class.forName("com.mysql.cj.jdbc.Driver");
			 connection = DriverManager.getConnection("jdbc:mysql://venkatcart.c9e8mus6uomn.us-east-1.rds.amazonaws.com:3306/venkat","root","7093702308");
		 }
		 return connection;
	 }
}
