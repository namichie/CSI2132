package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Ingredient;
import dao.IngredientDataAccess;

@WebServlet(urlPatterns = { "/addMeal" })
public class AddMealServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddMealServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		List<Ingredient> ingredients = null;
        String errorString = null;
        try {
        	ingredients = IngredientDataAccess.getInstance().getAllIngredients();
        } catch (Exception e) {
        	e.printStackTrace();
            errorString = e.getMessage();
        }

        // Store info in request attribute, before forward to views
        request.setAttribute("errorString", errorString);
        request.setAttribute("ingredients", ingredients);

        // Forward to view
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/jsp/Chef/addMeal.jsp");
        dispatcher.forward(request, response);
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
