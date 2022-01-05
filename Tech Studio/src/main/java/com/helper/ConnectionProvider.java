package com.helper;


import java.sql.Connection;
import java.sql.DriverManager;
public class ConnectionProvider{
	private static Connection con = null;
	public static Connection getConnection()
	{
		try{
			if(con == null)
			{
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/techstudio";
				String username = "root";
				String pass = "1234";
				//String sql = "select * from employee where idEmployee = 1";

				con = DriverManager.getConnection(url,username,pass);
				
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return con;
	}
	
}
