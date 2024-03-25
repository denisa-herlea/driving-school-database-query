package database;

import java.sql.DriverManager;

public class ConnectionDatabase {
	
    private String driver;
    private String url;
    private String username;
    private String password;
    private java.sql.Connection conn;
    
    public ConnectionDatabase() throws Exception {
        try {
            driver="com.mysql.cj.jdbc.Driver";
            url="jdbc:mysql://localhost:3306/sys";
            username="root";
            password="root";
            Class.forName(driver);
            conn=DriverManager.getConnection(url, username, password);
        }
        catch(Exception e) {
            System.out.println(e);
        }
    }
    public java.sql.Connection getConn() {
        return conn;
    }
    public void setConn(java.sql.Connection conn) {
        this.conn = conn;
    }
}