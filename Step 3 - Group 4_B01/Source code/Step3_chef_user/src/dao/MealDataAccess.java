package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.Meal;
import connection.DBConnection;

public class MealDataAccess {
	private static MealDataAccess instance;

	private MealDataAccess() {
	}

	public static MealDataAccess getInstance() {
		if (instance == null) {
			instance = new MealDataAccess();
		}
		return instance;
	}

	public List<Meal> findByName(String name) throws Exception {
		String query = "SELECT * FROM smart_fridge_system.Meals WHERE name ILIKE ?";

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement ps = connection.prepareStatement(query)) {

			ps.setString(1, "%" + name + "%");
			ResultSet rs = ps.executeQuery();

			List<Meal> meals = extractMealData(rs);
			rs.close();
			for (Meal meal : meals) {
				findIngredient(meal);
			}
			return meals;
		}
	}

	public List<Meal> findByCuisine(String cuisine) throws Exception {
		String query = "SELECT * FROM smart_fridge_system.Meals WHERE cuisine ILIKE ?";

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement ps = connection.prepareStatement(query)) {

			ps.setString(1, cuisine);
			ResultSet rs = ps.executeQuery();

			List<Meal> meals = extractMealData(rs);
			rs.close();
			for (Meal meal : meals) {
				findIngredient(meal);
			}
			return meals;
		}
	}

	private List<Meal> extractMealData(ResultSet rs) throws SQLException {
		List<Meal> meals = new ArrayList<>();
		while (rs.next()) {
			Meal meal = new Meal();
			meal.setId(rs.getInt("meal_id"));
			meal.setName(rs.getString("name"));
			meal.setDescription(rs.getString("description"));
			meal.setCuisine(rs.getString("cuisine"));
			meal.setAvailable(rs.getBoolean("available"));

			meals.add(meal);
		}
		return meals;
	}

	private void findIngredient(Meal meal) throws Exception {

		String query = "SELECT I.name, I.ingredient_id FROM smart_fridge_system.Meals AS M, smart_fridge_system.Composed_of AS C, smart_fridge_system.Ingredient AS I "
				+ " WHERE M.meal_id=C.meal_id AND I.ingredient_id=C.ingredient_id AND M.meal_id=?";

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement ps = connection.prepareStatement(query)) {
			ps.setInt(1, meal.getId());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				meal.addIngredientName(rs.getString("name"));
			}
			rs.close();
		}
	}

	public void add(Meal meal) throws Exception {
		String query = "INSERT INTO smart_fridge_system.Meals (name, description, cuisine, available) VALUES (?,?,?,?)";
		try (Connection connection = DBConnection.getConnection()) {
			Integer mealId = null;
			try (PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

				ps.setString(1, meal.getName());
				ps.setString(2, meal.getDescription());
				ps.setString(3, meal.getCuisine());
				ps.setBoolean(4, meal.isAvailable());

				ps.executeUpdate();

				ResultSet keys = ps.getGeneratedKeys();

				if (keys.next()) {
					mealId = keys.getInt(1); // id returned after insert
												// execution
				}
			}
			if (mealId != null) {
				String query2 = "INSERT INTO smart_fridge_system.Composed_of(ingredient_id, meal_id, quantity) VALUES (?,?,?)";
				for (int ingredientId : meal.getIngredientIds()) {
					try (PreparedStatement ps = connection.prepareStatement(query2)) {

						ps.setInt(1, ingredientId);
						ps.setInt(2, mealId);
						ps.setInt(3, 1);

						ps.executeUpdate();
					}
				}
			}
		}
	}
}