package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	private static final String CONNECTION_USER = "";
	private static final String CONNECTION_PWD = "";
	private static final String CONNECTION_URL = "jdbc:postgresql://web0.site.uottawa.ca:15432/" + CONNECTION_USER;

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
	   	// Load the database driver
		Class.forName("org.postgresql.Driver");
		// Get a Connection to the database
		return DriverManager.getConnection(CONNECTION_URL, CONNECTION_USER, CONNECTION_PWD);
	}
	
}
