package org.nlt.controller;

import java.sql.Connection;
import java.sql.DriverManager;

public interface ParentInterface {
	public static Connection con = getConnection();

	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/app1","root","");
			return con;
		} catch (Exception ex) {
			System.out.println("Connectivity Issue");
			return null;
		}		
	}
}