<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Header</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
	function showStudentSubMenu() {
		document.getElementById("student_sub_menu_div_id").style.display = "block";
	}
	function hideStudentSubMenu() {
		document.getElementById("student_sub_menu_div_id").style.display = "none";
		document.getElementById("studentMouseOver_DIV1_Id").style.backgroundColor ="#C0C0C0";
		document.getElementById("studentMouseOver_DIV2_Id").style.backgroundColor ="#C0C0C0";
	}
	function studentMouseOver_DIV1(){
		document.getElementById("studentMouseOver_DIV1_Id").style.backgroundColor ="#99cc99";
		document.getElementById("studentMouseOver_DIV2_Id").style.backgroundColor ="#C0C0C0";
	}
	function studentMouseOver_DIV2(){
		document.getElementById("studentMouseOver_DIV1_Id").style.backgroundColor ="#C0C0C0";
		document.getElementById("studentMouseOver_DIV2_Id").style.backgroundColor ="#99cc99";
	}

	//Javascript For Staff Operations 
	function showStaffSubMenu() {
		document.getElementById("staff_sub_menu_div_id").style.display = "block";
	}
	function hideStaffSubMenu() {
		document.getElementById("staff_sub_menu_div_id").style.display = "none";
		document.getElementById("staffMouseOver_DIV1_Id").style.backgroundColor ="#C0C0C0";
		document.getElementById("staffMouseOver_DIV2_Id").style.backgroundColor ="#C0C0C0";
	}
	function staffMouseOver_DIV1(){
		document.getElementById("staffMouseOver_DIV1_Id").style.backgroundColor ="#99cc99";
		document.getElementById("staffMouseOver_DIV2_Id").style.backgroundColor ="#C0C0C0";
	}
	function staffMouseOver_DIV2(){
		document.getElementById("staffMouseOver_DIV1_Id").style.backgroundColor ="#C0C0C0";
		document.getElementById("staffMouseOver_DIV2_Id").style.backgroundColor ="#99cc99";

	}

	//Javascript For Home Operations 
	function showHomeSubMenu() {
		document.getElementById("home_sub_menu_div_id").style.display = "block";
	}
	function hideHomeSubMenu() {
		document.getElementById("home_sub_menu_div_id").style.display = "none";
		document.getElementById("homeMouseOver_DIV1_Id").style.backgroundColor ="#C0C0C0";
		document.getElementById("homeMouseOver_DIV2_Id").style.backgroundColor ="#C0C0C0";
	}
	function homeMouseOver_DIV1(){
		document.getElementById("homeMouseOver_DIV1_Id").style.backgroundColor ="#99cc99";
		document.getElementById("homeMouseOver_DIV2_Id").style.backgroundColor ="#C0C0C0";
	}
	function homeMouseOver_DIV2(){
		document.getElementById("homeMouseOver_DIV1_Id").style.backgroundColor ="#C0C0C0";
		document.getElementById("homeMouseOver_DIV2_Id").style.backgroundColor ="#99cc99";

	}
</script>
</head>
<body>
	<%
		String userName = (String) session.getAttribute("userName");
		if (userName == null || "".equalsIgnoreCase(userName)) {
			request.setAttribute("errotMessage",
					"Session TimeOut, Please Login Again!");
	%>
	<jsp:forward page="Login.jsp"></jsp:forward>

	<%
		}
	%>
	<div style="position: fixed; top: 5px;  color: #99cc99">
		<span> <img align="left" alt="logo" src="resources/images/images - Copy.jpeg"  width="40px" height="40px">  </span>
		  <span style="position: fixed; top: 5px;right: 25%;color: #800000;">Welcome <%=userName %> &nbsp;&nbsp; <a
			href="LoginServlet">Sign Out</a> &nbsp;&nbsp;
			<a href="Home.jsp" style="color: #000000;"> 
						Home
					</a>
			</span>
	</div>
	<div align="left"
		style="position: absolute; top: 50px; right: 0px; left: 0px; padding: 10px; background-color: #99cc99; color: black; font-weight: bolder; font-size: 18px;">
		<!-- 		Menu For Student Operations -->
		<span onmouseover="showStudentSubMenu()" onmouseout="hideStudentSubMenu()">
			<a href="#" style="color: #000000;text-decoration: none;"> &nbsp;&nbsp;Student </a>
			<div id="student_sub_menu_div_id" style="display: none; z-index: 100; position: absolute; width: 175px; left: 0px; background-color: #C0C0C0; font-size: 14px; font-family: sans-serif;">
				<div style="border-bottom: 1px solid; padding: 5px 0px 5px 10px;" onmouseover="studentMouseOver_DIV1()" id="studentMouseOver_DIV1_Id"> 
					<a href="StudentRegistration.jsp" style="color: #000000; text-decoration: none;"> 
						Student Registration &nbsp;&nbsp;&nbsp;&nbsp;
					</a>
				</div>
				<div style="border-bottom: 1px solid;padding: 5px 0px 5px 10px;" onmouseover="studentMouseOver_DIV2()" id="studentMouseOver_DIV2_Id">
					<a href="StudentServlet" style="color: #000000; text-decoration: none;">
						Display Students &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</a>
				</div>
			</div> 
		</span>
		&nbsp;|&nbsp;
		<!--
		 		Menu For Staff Operations 
		-->
		
		<span onmouseover="showStaffSubMenu()" onmouseout="hideStaffSubMenu()" >
			<a href="#" style="color: #000000;text-decoration: none;">Staff</a>
			<div id="staff_sub_menu_div_id" style="display: none; z-index: 100; position: absolute; width: 160px; left: 12%; background-color: #C0C0C0; font-size: 14px; font-family: sans-serif;">
				<div style="border-bottom: 1px solid; padding: 5px 0px 5px 10px;" onmouseover="staffMouseOver_DIV1()" id="staffMouseOver_DIV1_Id"> 
					<a href="StaffRegistration.jsp" style="color: #000000; text-decoration: none;"> 
						 Staff Registration &nbsp;
					</a>
				</div>
				<div style="border-bottom: 1px solid; padding: 5px 0px 5px 10px;" onmouseover="staffMouseOver_DIV2()" id="staffMouseOver_DIV2_Id"> 
					<a href="StaffServlet" style="color: #000000; text-decoration: none;"> 
						Display Staff &nbsp;&nbsp;&nbsp;&nbsp;
					</a>
				</div>
			</div>
		</span>
	&nbsp;&nbsp;
			<!--
		 		Menu For Home Operations 
		-->
	

	</div>
</body>
</html>