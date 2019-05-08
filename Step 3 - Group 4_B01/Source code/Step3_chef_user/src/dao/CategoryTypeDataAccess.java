package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

import connection.DBConnection;

public class CategoryTypeDataAccess {
	private static CategoryTypeDataAccess instance;

	private CategoryTypeDataAccess() { }
	
    public static CategoryTypeDataAccess getInstance() {
        if (instance == null) {
        	instance = new CategoryTypeDataAccess();
        }
        return instance;
    }

    public List<String> getCategoryTypes() throws Exception {
		
    	String query = "SELECT enumlabel FROM pg_enum WHERE enumtypid = 'category_type'::regtype ORDER BY oid";
    	
		try (Connection connection = DBConnection.getConnection();
			PreparedStatement ps = connection.prepareStatement(query)) {

			ResultSet rs = ps.executeQuery();
			
	    	List<String> categoryTypes = new LinkedList<>();
			while (rs.next()) {
				categoryTypes.add(rs.getString("enumlabel"));
			}
			rs.close();
			return categoryTypes;
		}
    }
}
