package com.mit;
import java.sql.*;
public class OrderDAO {
	static Connection conn2;
	static PreparedStatement pst2;
	
	public static int insertOrder(OrderBean u){
		int status = 0;
		try{
			conn2=ConnectionProvider.getCon();
			pst2=conn2.prepareStatement("insert into orders(ingredient_id, quantity, order_approved) values(?,?,?)");
			//pst.setString(1, u.getMeal_id());
			pst2.setInt(1, u.getIngredient_id());
			pst2.setInt(2, u.getQuantity());
			pst2.setBoolean(3, u.getOrder_approved());
			status=pst2.executeUpdate();
			conn2.close();
		}catch(Exception ex){
			System.out.println(ex);
		}
		return status;
	}
	
	public static int approveOrder(OrderBean u){
		int status2=0;
		try{
			conn2=ConnectionProvider.getCon();
			pst2=conn2.prepareStatement("update orders set order_approved=TRUE where order_num=(?)");
			
			pst2.setInt(1, u.getOrder_num());
			status2=pst2.executeUpdate();
			conn2.close();
		}catch(Exception ex){
			System.out.println(ex);
		}
		return status2;
		
	}
}
