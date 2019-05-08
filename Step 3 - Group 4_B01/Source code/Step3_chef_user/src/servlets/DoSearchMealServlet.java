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

@WebServlet(urlPatterns = { "/doSearchMeal" })
public class DoSearchMealServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DoSearchMealServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String cuisine = request.getParameter("cuisine");

        
        List<Meal> meals = null;
        String errorString = null;
        try {
        	if (name == null || name.isEmpty()) {
                meals = MealDataAccess.getInstance().findByCuisine(cuisine);
        	} else {
                meals = MealDataAccess.getInstance().findByName(name);
        	}
        } catch (Exception e) {
        	e.printStackTrace();
            errorString = e.getMessage();
        }
 
        // Store info in request attribute, before forward to views
        request.setAttribute("errorString", errorString);
        request.setAttribute("cuisine", cuisine);
        request.setAttribute("ingredientNames", meals);
        request.setAttribute("mealList", meals);
         
     
        // Forward to view
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/jsp/Chef/searchMeal.jsp");
        dispatcher.forward(request, response);
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
