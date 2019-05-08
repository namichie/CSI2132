package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Meal;
import dao.MealDataAccess;

/**
 * Servlet implementation class DoRequestMealServlet
 */
@WebServlet(urlPatterns = { "/doRequestMeal" })
public class DoRequestMealServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DoRequestMealServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		List<Meal> meals = null;
		String errorString = null;

		try {

			meals = MealDataAccess.getInstance().findByName(name);

		} catch (Exception e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}

		// Store info in request attribute, before forward to views
		request.setAttribute("errorString", errorString);
		request.setAttribute("mealList", meals);

		// Forward to view
		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/jsp/User/requestMeal.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
