package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;


import beans.Order;
import connection.DBConnection;

public class OrderDataAccess {
private static OrderDataAccess instance;
	
    public OrderDataAccess getInstance() {
        if (instance == null) {
        	instance = new OrderDataAccess();
        }
        return instance;
    }
    
    
    public void add(Order order) throws Exception {
		
    	String query = "INSERT INTO smart_fridge_system.Orders (ingredient_id, quantity) VALUES (?,?)";

		try (Connection connection = DBConnection.getConnection();
			PreparedStatement ps = connection.prepareStatement(query)) {

			ps.setInt(1, order.getIngredient_id());
			ps.setInt(2, order.getQuantity());

			ps.executeUpdate();
			
		}
    }

}
