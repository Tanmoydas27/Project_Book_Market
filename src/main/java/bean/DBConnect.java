package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	public static Connection connct() throws SQLException
	{
		DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		String url = "jdbc:mysql://localhost:3306/bookmarketdb";
		String user ="root";
		String password = "";
		
		Connection conn = DriverManager.getConnection(url, user, password);
		
		return conn;
	}
}
