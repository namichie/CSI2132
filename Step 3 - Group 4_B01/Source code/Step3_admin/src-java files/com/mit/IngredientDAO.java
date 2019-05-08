package com.mit;
import java.sql.*;
import java.util.Date;
public class IngredientDAO {
	static Connection conn3;
	static PreparedStatement pst3;
	
	public static java.sql.Date convertJavaDateToSqlDate(java.util.Date date) {
	    return new java.sql.Date(date.getTime());
	}
	
	public static int insertIngredient(IngredientBean u){
		int status3 = 0;
		try{
			conn3=ConnectionProvider.getCon();
			pst3=conn3.prepareStatement("insert into ingredient(name, threshold, price_per_item, count, category, available) values(?,?,?,?,?::category_type,?)");
			pst3.setString(1, u.getName());
			pst3.setDate(2, convertJavaDateToSqlDate(new Date()));
			//pst3.setDate(2, convertJavaDateToSqlDate(u.getThreshold()));
			pst3.setDouble(3, u.getPrice_per_item());
			pst3.setInt(4, u.getCount());
			pst3.setString(5, u.getCategory());
			pst3.setBoolean(6, u.isAvailable());
			status3=pst3.executeUpdate();
			conn3.close();
		}catch(Exception ex){
			System.out.println(ex);
		}
		return status3;
	}
}
