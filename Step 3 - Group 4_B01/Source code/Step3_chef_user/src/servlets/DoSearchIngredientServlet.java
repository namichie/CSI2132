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
import dao.CategoryTypeDataAccess;
import dao.IngredientDataAccess;

/**
 * Servlet implementation class DoSearchIngredientServlet
 */
@WebServlet(urlPatterns = {"/doSearchIngredient"})
public class DoSearchIngredientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DoSearchIngredientServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
        String category = request.getParameter("category");

		List<String> categoryTypes = null;
        try {
        	categoryTypes = CategoryTypeDataAccess.getInstance().getCategoryTypes();
        } catch (Exception e) {
        	e.printStackTrace();
        }
    
        List<Ingredient> ingredients = null;
        String errorString = null;
        try {
        	if (name == null || name.isEmpty()) {
        		ingredients = IngredientDataAccess.getInstance().findByCategory(category);
        	} else {
        		ingredients = IngredientDataAccess.getInstance().findByName(name);
        	}
        } catch (Exception e) {
        	e.printStackTrace();
            errorString = e.getMessage();
        }
 
        // Store info in request attribute, before forwarding to views
        request.setAttribute("errorString", errorString);
        request.setAttribute("categoryTypes", categoryTypes);
        request.setAttribute("ingredientList", ingredients);
     
        // Forward to view
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/jsp/User/searchIngredient.jsp");
        dispatcher.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
