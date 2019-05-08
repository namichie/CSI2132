package servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("user_type");
		String location = null;

		if (type.equals("Chef")) {
			location = "/WEB-INF/jsp/Chef/chefMenu.jsp";

		} else if (type.equals("User")) {
			location = "/WEB-INF/jsp/User/userMenu.jsp";

		} else {
			location = "/WEB-INF/jsp/Admin/adminMenu.jsp";
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(location);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
