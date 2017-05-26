package com.servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.StudentDAO;
import com.dao.StudentDAOImpl;
import com.model.StudentModel;

/**
 * Servlet implementation class StudentServlet
 */

public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StudentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudentDAO studentDAO=new StudentDAOImpl();
		List<StudentModel> studentModels= studentDAO.getStudents();
		request.setAttribute("studentModels", studentModels);
		RequestDispatcher rdx=request.getRequestDispatcher("DisplayStudents.jsp");
		rdx.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String userAction=request.getParameter("userAction");
		if("delete".equalsIgnoreCase(userAction)){
			System.out.println("I am in delete");
			String rollNum=request.getParameter("rollNumHidden");
			StudentDAO studentDAO=new  StudentDAOImpl();
			studentDAO.deleteStudent(rollNum);
			List<StudentModel> studentModels= studentDAO.getStudents();
			request.setAttribute("studentModels", studentModels);
			RequestDispatcher rdx=request.getRequestDispatcher("DisplayStudents.jsp");
			rdx.forward(request, response);
		}else if("update".equalsIgnoreCase(userAction)){
			System.out.println("I am in update");
			String rollNum=request.getParameter("rollNumHidden");
			StudentDAO studentDAO=new  StudentDAOImpl();
			StudentModel studentModel= studentDAO.getStudentByRollNumber(rollNum);
			request.setAttribute("studentModel", studentModel);
			RequestDispatcher rdx=request.getRequestDispatcher("UpdateStudent.jsp");
			rdx.forward(request, response);
		} else if("view".equalsIgnoreCase(userAction)){
			System.out.println("I am in view");
			String rollNum=request.getParameter("rollNumHidden");
			StudentDAO studentDAO=new  StudentDAOImpl();
			StudentModel studentModel= studentDAO.getStudentByRollNumber(rollNum);
			request.setAttribute("studentModel", studentModel);
			RequestDispatcher rdx=request.getRequestDispatcher("viewStudent.jsp");
			rdx.forward(request, response);
		}else if("insert".equalsIgnoreCase(userAction)){
			System.out.println("I am in insert");
			String rollNum=request.getParameter("rollNumber");
			StudentDAO studentDAO=new  StudentDAOImpl();
			StudentModel studentModel= studentDAO.getStudentByRollNumber(rollNum);
			if(studentModel!= null){
				request.setAttribute("errorMessage", "Student with "+rollNum+" Is Allready Exist, Please Try With Diff Roll Number");
				RequestDispatcher rdx=request.getRequestDispatcher("StudentRegistration.jsp");
				rdx.forward(request, response);
				
			}else{
				 studentModel=new StudentModel();
				studentModel.setRollNumber(rollNum);
				studentModel.setFirstName(request.getParameter("firstName"));
				studentModel.setMiddleName(request.getParameter("middleName"));
				studentModel.setLastName(request.getParameter("lastName"));
				studentModel.setGender(request.getParameter("gender"));
				studentModel.setMobileNumber(request.getParameter("mobileNumber"));
				studentModel.setEmail(request.getParameter("email"));
				studentModel.setDateOfBirth(request.getParameter("dob"));
				studentModel.setAddress(request.getParameter("address"));
				studentModel.setDepartment(request.getParameter("deptName"));
				studentModel.setAcademicYear(request.getParameter("academicYear"));
				
				studentDAO.insertStudent(studentModel);
				List<StudentModel> studentModels= studentDAO.getStudents();
				request.setAttribute("studentModels", studentModels);
				RequestDispatcher rdx=request.getRequestDispatcher("DisplayStudents.jsp");
				rdx.forward(request, response);
			}
			
			
		
		}else if("cancel".equalsIgnoreCase(userAction)){
			System.out.println("In cancel");
			RequestDispatcher rdx=request.getRequestDispatcher("Home.jsp");
			rdx.forward(request, response);
		}else  if("updateStudent".equalsIgnoreCase(userAction)){
			System.out.println("In update student");
			String rollNum=request.getParameter("rollNumHidden");
			System.out.println("request.getParameter>>:"+rollNum);
			StudentModel studentModel=new StudentModel();
			studentModel.setRollNumber(rollNum);
			studentModel.setFirstName(request.getParameter("firstName"));
			studentModel.setMiddleName(request.getParameter("middleName"));
			studentModel.setLastName(request.getParameter("lastName"));
			studentModel.setGender(request.getParameter("gender"));
			studentModel.setMobileNumber(request.getParameter("mobileNumber"));
			studentModel.setEmail(request.getParameter("email"));
			studentModel.setDateOfBirth(request.getParameter("dob"));
			studentModel.setAddress(request.getParameter("address"));
			studentModel.setDepartment(request.getParameter("deptName"));
			studentModel.setAcademicYear(request.getParameter("academicYear"));
			StudentDAO studentDAO=new StudentDAOImpl();
			studentDAO.updateStudent(studentModel);
			List<StudentModel> studentModels= studentDAO.getStudents();
			request.setAttribute("studentModels", studentModels);
			RequestDispatcher rdx=request.getRequestDispatcher("DisplayStudents.jsp");
			rdx.forward(request, response);
		}
		else  if("displayBranchStudent".equalsIgnoreCase(userAction)){
			System.out.println("In update student");
			String deptName=request.getParameter("deptNameHidden");
			StudentDAO studentDAO=new StudentDAOImpl();
			List<StudentModel> studentModels= studentDAO.getStudentsByDeptName(deptName);
			request.setAttribute("studentModels", studentModels);
			RequestDispatcher rdx=request.getRequestDispatcher("DisplayStudents.jsp");
			rdx.forward(request, response);
		}
		
		
	}

}
