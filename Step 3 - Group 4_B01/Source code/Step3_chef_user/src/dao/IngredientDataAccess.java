package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import beans.Ingredient;
import connection.DBConnection;

public class IngredientDataAccess {
	
	private static IngredientDataAccess instance;
	
	private IngredientDataAccess() { }
	
    public static IngredientDataAccess getInstance() {
        if (instance == null) {
        	instance = new IngredientDataAccess();
        }
        return instance;
    }

    public List<Ingredient> findByName(String name) throws Exception {
    	String query = "SELECT * FROM smart_fridge_system.Ingredient WHERE name ILIKE ?";
    	
		try (Connection connection = DBConnection.getConnection();
			PreparedStatement ps = connection.prepareStatement(query)) {

			ps.setString(1, "%" + name + "%");
			ResultSet rs = ps.executeQuery();
			
			List<Ingredient> ingredients = extractIngredientData(rs);
			rs.close();
			return ingredients;
		}
    }

    public List<Ingredient> findByCategory(String category) throws Exception {
    	String query = "SELECT * FROM smart_fridge_system.Ingredient WHERE category = ?::smart_fridge_system.category_type";
    	
		try (Connection connection = DBConnection.getConnection();
			PreparedStatement ps = connection.prepareStatement(query)) {
			ps.setString(1, category);
			ResultSet rs = ps.executeQuery();
			
			List<Ingredient> ingredients = extractIngredientData(rs);
			rs.close();
			return ingredients;
		}
    }
    

    public static List<Ingredient> listIngredientInfoForOrder() throws Exception {
        String query = "SELECT ingredient_id, name, price_per_item, count FROM smart_fridge_system.Ingredient";
        
		try (Connection connection = DBConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement(query)) {
   
        ResultSet rs = ps.executeQuery();
        List<Ingredient> list = new LinkedList<Ingredient>();
        while (rs.next()) {
        
            Ingredient ingredient = new Ingredient();
            ingredient.setIngredient_id(rs.getInt("ingredient_id"));
			ingredient.setName(rs.getString("name"));
			ingredient.setPrice_per_item(rs.getBigDecimal("price_per_item"));
			ingredient.setCount(rs.getInt("count"));
            list.add(ingredient);
        }
        
        return list;
        }
    }


 public List<Ingredient> getAllIngredients() throws Exception {
		try (Connection connection = DBConnection.getConnection();
			PreparedStatement ps = connection.prepareStatement("SELECT * FROM smart_fridge_system.Ingredient ORDER BY name")) {

			ResultSet rs = ps.executeQuery();
			
			List<Ingredient> ingredients = extractIngredientData(rs);
			rs.close();
			return ingredients;
		}
    }


    private List<Ingredient> extractIngredientData(ResultSet rs) throws SQLException {
    	List<Ingredient> ingredients = new LinkedList<Ingredient>();
		while (rs.next()) {
			Ingredient ingredient = new Ingredient();
			ingredient.setIngredient_id(rs.getInt("ingredient_id"));
			ingredient.setName(rs.getString("name"));
			ingredient.setThreshold(rs.getDate("threshold"));
			ingredient.setPrice_per_item(rs.getBigDecimal("price_per_item"));
			ingredient.setCount(rs.getInt("count"));
			ingredient.setCategory(rs.getString("category"));
			ingredient.setAvailable(rs.getBoolean("available"));
			
			ingredients.add(ingredient);
		}
		return ingredients;
    }
    
}


