package com.mit;
import java.sql.*;
public class MealDAO {
	static Connection conn;
	static PreparedStatement pst;
	
	public static int insertMeal(MealBean u){
		int status = 0;
		try{
			conn=ConnectionProvider.getCon();
			pst=conn.prepareStatement("insert into meals(name, description, cuisine, available) values(?,?,?,?)");
			//pst.setString(1, u.getMeal_id());
			pst.setString(1, u.getMeal_name());
			pst.setString(2, u.getMeal_description());
			pst.setString(3, u.getMeal_cuisine());
			pst.setBoolean(4, u.getMeal_availability());
			status=pst.executeUpdate();
			conn.close();
		}catch(Exception ex){
			System.out.println(ex);
		}
		return status;
	}
}
