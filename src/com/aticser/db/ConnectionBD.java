package com.aticser.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ConnectionBD {

String url = "jdbc:mysql://localhost:3306/";
	
    /**
     * The MySQL user.
     */
	
	// SERVER USER
//    String user = "cencat_user";
    
//    //LOCAL USER
    String user = "root";

    /**
     * Password for the above MySQL user. If no password has been 
     * set (as is the default for the root user in XAMPP's MySQL),
     * an empty string can be used.
     */
    
    // SERVER PASSWORD
//    String password = "cencat.2017";
    
    // LOCAL PASSWORD
    String password = "";
	

    public Connection getConnection(String url,String user_name,String password)
    {
    	Connection conn=null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(url, user_name, password);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        return conn;        
    }
    
    public List<String> selectMunicipality() {
		
    	List<String> municipalities = new ArrayList<>();
    	
        try
        {
            Connection conn = getConnection(url,user,password);
            
            System.out.println("Conn " + conn);

            Statement stt = conn.createStatement();
            
            stt.execute("CREATE DATABASE IF NOT EXISTS tsystemas");
            stt.execute("USE tsystemas");
            
//            String query = "SELECT DESCRIPCIO FROM tblMunicipios WHERE MUNICIPI_CATALA = ?";
            String query = "SELECT DESCRIPCIO FROM tblMunicipios";

			PreparedStatement preparedStmt = conn.prepareStatement(query);
//			preparedStmt.setString (1, "S");
			
			ResultSet rs = preparedStmt.executeQuery();
			
			while(rs.next()) {
			    String municipaliti = rs.getString(1);
			    municipalities.add(municipaliti);
			}
            
			preparedStmt.close();
            stt.close();
            conn.close();

        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
		return municipalities;
		
	}
	
}
