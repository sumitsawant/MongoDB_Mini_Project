package com.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.StaffDAO;
import com.dao.StaffDAOImpl;
import com.dao.StudentDAO;
import com.dao.StudentDAOImpl;
import com.model.StaffModel;
import com.model.StudentModel;


/**
 * Servlet implementation class StaffServlet
 */
public class StaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	StaffDAO staffDAO=new StaffDAOImpl();
	List<StaffModel> staffModels= staffDAO.getStaffs();
	request.setAttribute("staffModels", staffModels);
	RequestDispatcher rdx=request.getRequestDispatcher("DisplayStaffs.jsp");
	rdx.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userAction=request.getParameter("userAction");
		if("delete".equalsIgnoreCase(userAction)){
			System.out.println("I am in delete");
			String staffId=request.getParameter("staffIdHidden");
			StaffDAO staffDAO=new  StaffDAOImpl();
			staffDAO.deleteStaff(staffId);
			List<StaffModel> staffModels= staffDAO.getStaffs();
			request.setAttribute("staffModels", staffModels);
			RequestDispatcher rdx=request.getRequestDispatcher("DisplayStaffs.jsp");
			rdx.forward(request, response);
		}else if("update".equalsIgnoreCase(userAction)){
			System.out.println("I am in update");
						String staffId=request.getParameter("staffIdHidden");
						System.out.println("staffId:"+staffId);
			StaffDAO staffDAO=new  StaffDAOImpl();
			StaffModel staffModel= staffDAO.getStaffByStaff_ID(staffId);
			System.out.println("staffModel staffId:"+staffModel.getStaffId());
			request.setAttribute("staffModel", staffModel);
			RequestDispatcher rdx=request.getRequestDispatcher("UpdateStaff.jsp");
			rdx.forward(request, response);
		} else if("view".equalsIgnoreCase(userAction)){
			System.out.println("I am in view");
			String staffId=request.getParameter("staffIdHidden");
			StaffDAO staffDAO=new  StaffDAOImpl();
			StaffModel staffModel= staffDAO.getStaffByStaff_ID(staffId);
			request.setAttribute("staffModel", staffModel);
			RequestDispatcher rdx=request.getRequestDispatcher("viewStaff.jsp");
			rdx.forward(request, response);
		}else if("insert".equalsIgnoreCase(userAction)){
			System.out.println("I am in insert");
			String staffId=request.getParameter("staffId");
			StaffDAO staffDAO=new  StaffDAOImpl();
			StaffModel staffModel= staffDAO.getStaffByStaff_ID(staffId);
			
			if(staffModel!=null){
				request.setAttribute("errorMessage", "Staff with "+staffId+" Is Allready Exist, Please Try With Diff Staff Id");
				RequestDispatcher rdx=request.getRequestDispatcher("StaffRegistration.jsp");
				rdx.forward(request, response);
				
			}else{
				 staffModel=new StaffModel();
				staffModel.setStaffId(staffId);
				staffModel.setFirstName(request.getParameter("firstName"));
				staffModel.setMiddleName(request.getParameter("middleName"));
				staffModel.setLastName(request.getParameter("lastName"));
				staffModel.setGender(request.getParameter("gender"));
				staffModel.setMobileNumber(request.getParameter("mobileNumber"));
				staffModel.setEmail(request.getParameter("email"));
				staffModel.setDateOfBirth(request.getParameter("dob"));
				staffModel.setAddress(request.getParameter("address"));
				staffModel.setDepartment(request.getParameter("deptName"));
				staffModel.setDesignation(request.getParameter("designation"));

				staffDAO.insertStaff(staffModel);
				List<StaffModel> staffModels= staffDAO.getStaffs();
				request.setAttribute("staffModels", staffModels);
				RequestDispatcher rdx=request.getRequestDispatcher("DisplayStaffs.jsp");
				rdx.forward(request, response);
			}
			

		}else if("cancel".equalsIgnoreCase(userAction)){
			System.out.println("In cancel");
			RequestDispatcher rdx=request.getRequestDispatcher("Home.jsp");
			rdx.forward(request, response);
		}else  if("updateStaff".equalsIgnoreCase(userAction)){
			System.out.println("In updaTE sTUDENMT");
			String staffId=request.getParameter("staffIdHidden");
			System.out.println("request.getParameter>>:"+staffId);
			StaffModel staffModel=new StaffModel();
			staffModel.setStaffId(staffId);
			staffModel.setFirstName(request.getParameter("firstName"));
			staffModel.setMiddleName(request.getParameter("middleName"));
			staffModel.setLastName(request.getParameter("lastName"));
			staffModel.setGender(request.getParameter("gender"));
			staffModel.setMobileNumber(request.getParameter("mobileNumber"));
			staffModel.setEmail(request.getParameter("email"));
			staffModel.setDateOfBirth(request.getParameter("dob"));
			staffModel.setAddress(request.getParameter("address"));
			staffModel.setDepartment(request.getParameter("deptName"));
			staffModel.setDesignation(request.getParameter("designation"));
			StaffDAO staffDAO=new StaffDAOImpl();
			staffDAO.updateStaff(staffModel);
			List<StaffModel> staffModels= staffDAO.getStaffs();
			request.setAttribute("staffModels", staffModels);
			RequestDispatcher rdx=request.getRequestDispatcher("DisplayStaffs.jsp");
			rdx.forward(request, response);
		}
		else  if("displayDesignationStaff".equalsIgnoreCase(userAction)){
			System.out.println("In update staff");
			String designationName=request.getParameter("designationNameHidden");
			StaffDAO staffDAO=new StaffDAOImpl();
			List<StaffModel> staffModels= staffDAO.getStaffsByDesignation(designationName);
			request.setAttribute("staffModels", staffModels);
			RequestDispatcher rdx=request.getRequestDispatcher("DisplayStaffs.jsp");
			rdx.forward(request, response);
		}
		
		
	}

}
