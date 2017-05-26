package com.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Sign Out Successfully");
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("userName", "");
		request.setAttribute("errorMessage", "You Sign Out Successfuly!");
		RequestDispatcher rdx=request.getRequestDispatcher("Login.jsp");
		rdx.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");
		if(("admin".equalsIgnoreCase(userName)&&"admin123".equalsIgnoreCase(password))||("college".equalsIgnoreCase(userName)&&"root".equalsIgnoreCase(password))){
			HttpSession httpSession=request.getSession();
			httpSession.setAttribute("userName", userName);
			RequestDispatcher rdx=request.getRequestDispatcher("Home.jsp");
			rdx.forward(request, response);
		}else{
			request.setAttribute("errorMessage", "Invalid User Name & Password");
			RequestDispatcher rdx=request.getRequestDispatcher("Login.jsp");
			rdx.forward(request, response);
		}
	}

}
