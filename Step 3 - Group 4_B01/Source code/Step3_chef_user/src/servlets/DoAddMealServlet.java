package servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Ingredient;
import beans.Meal;
import dao.IngredientDataAccess;
import dao.MealDataAccess;

@WebServlet(urlPatterns = { "/doAddMeal" })
public class DoAddMealServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DoAddMealServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Meal meal = new Meal();
		Map<String, String> messages = new HashMap<String, String>();
		request.setAttribute("messages", messages);
		String name = request.getParameter("name");
		if (name == null || name.trim().isEmpty()) {
			messages.put("name", "Please enter Name.");
		} 
		String description = request.getParameter("description");
		if (description == null || description.trim().isEmpty()) {
			messages.put("description", "Please enter Description.");
		}
		String cuisine = request.getParameter("cuisine");
		if (cuisine == null || cuisine.trim().isEmpty() || cuisine.equals("-1")) {
			messages.put("cuisine", "Please select Cuisine.");
		}
		String[] selectedIngredients = request.getParameterValues("ingredients");
		if (selectedIngredients == null || selectedIngredients.length == 0) {
			messages.put("ingredients", "Please select one or more Ingredients.");
		}

		if (!messages.isEmpty()) {
			List<Ingredient> ingredients = null;
			String errorString = null;
			try {
				ingredients = IngredientDataAccess.getInstance().getAllIngredients();
			} catch (Exception e) {
				e.printStackTrace();
				errorString = e.getMessage();
			}
			request.setAttribute("meal", meal);
			request.setAttribute("ingredients", ingredients);
			request.setAttribute("errorString", errorString);
			// Forward to view
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/jsp/Chef/addMeal.jsp");
			dispatcher.forward(request, response);

		} else {
			meal.setName(name);
			meal.setDescription(description);
			meal.setCuisine(cuisine);
			meal.setAvailable(request.getParameter("available") != null ? true : false);
			for (String selectedIngredient : selectedIngredients) {
				String[] idAndName = selectedIngredient.split("_"); 
				meal.addIngredient(Integer.valueOf(idAndName[0]), idAndName[1]);
			}

			String errorString = null;
			try {
				MealDataAccess.getInstance().add(meal);
			} catch (Exception e) {
				e.printStackTrace();
				errorString = e.getMessage();
			}

			request.setAttribute("meal", meal);
			request.setAttribute("errorString", errorString);

			// Forward to view
			RequestDispatcher dispatcher = request.getServletContext()
					.getRequestDispatcher("/WEB-INF/jsp/Chef/mealConfirmation.jsp");
			dispatcher.forward(request, response);
		}

	}
}
