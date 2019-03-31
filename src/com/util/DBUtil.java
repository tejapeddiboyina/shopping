package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

	static DBUtil singleton = null;
	static Connection con = null;

	private DBUtil() {
		super();
	}

	public static DBUtil getInstance() {
		if (singleton == null)
			singleton = new DBUtil();
		return singleton;
	}

	public Connection getConnection() {
		try {
			Class.forName(DBConstants.driver);
			con = DriverManager.getConnection(DBConstants.url,
					DBConstants.username, DBConstants.password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	public void closeConnection(Connection con) {
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
