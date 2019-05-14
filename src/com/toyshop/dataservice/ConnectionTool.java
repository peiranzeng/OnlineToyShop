package com.toyshop.dataservice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionTool {
	public Connection Connect() {
		Connection conn = null;
		try {
            // The newInstance() call is a work around for some
            // broken Java implementations

            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        } catch (Exception ex) {
            // handle the error
        }
		
		try {
            conn =
               DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshop?useSSL=FALSE&allowPublicKeyRetrieval=true&serverTimezone=UTC",
                                           "hbstudent","hbstudent");
            System.out.println("ok");
        } catch (SQLException ex) {
            // handle any errors
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
	}
		return conn;
	}
		
}
