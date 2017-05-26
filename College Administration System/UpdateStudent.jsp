<%@page import="com.model.StudentModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Update Form</title>
<link rel="stylesheet" href="resources/css/custom.css">
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<script src="resources/js/jquery-1.10.2.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/jqueryvalidate.js"></script>
<script type="text/javascript">
$("document").ready(function()
		  {
			  $("#datepicker").datepicker(
			  {
			  	dateFormat:"dd/mm/yy",
				changeMonth: true,
			  	changeYear: true 
			  /* 	minDate:10,
			  	maxDate:20,  */
			  });
		
			  
		  });
		  
function updateStudent(rollNum){
			document.getElementById("userActionId").value="updateStudent";
			document.getElementById("rollNumId").value=rollNum;
			document.getElementById("studentFormId").submit();
}
function cancelOperation(){
	document.getElementById("userActionId").value="cancel";
	document.getElementById("studentFormId").submit();
}
</script>
</head>

<body>
	<div class="mainContainer">
		<jsp:include page="Header.jsp"></jsp:include>
		<form action="StudentServlet" id="studentFormId" method="post">
			<%
				StudentModel studentModel = (StudentModel) request.getAttribute("studentModel");
				String dept = studentModel.getDepartment();
				String year = studentModel.getAcademicYear();
				String gender = studentModel.getGender();
			%>

			<input type="hidden" name="userAction" id="userActionId"> <input
				type="hidden" name="rollNumHidden" id="rollNumId">
			<div align="left" class="panelTopFormat">&nbsp; Update Student
			</div>
			<div class="panelBorderFormat">

				<table border="0" width="100%"
					style="font-size: 14px; font-weight: bold">
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Roll Number:</td>
						<td><input type="text" name="rollNumber"
							value="<%=studentModel.getRollNumber()%>" disabled="disabled">
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>First Name:<span style="color: red;"></span></td>
						<td><input type="text" name="firstName"
							value="<%=studentModel.getFirstName()%>" id="firstNameId"></td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Middle Name:</td>
						<td><input type="text" name="middleName"
							value="<%=studentModel.getMiddleName()%>"></td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Last Name:<span style="color: red;"></span></td>
						<td><input type="text" name="lastName"
							value="<%=studentModel.getLastName()%>" id="lastNameId"></td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Gender:</td>
						<td><input type="radio" name="gender" value="Male"
							<%=gender.equalsIgnoreCase("Male") ? "checked='checked'"
					: " "%>>Male
							<input type="radio" name="gender" value="Female"
							<%=gender.equalsIgnoreCase("Female") ? "checked='checked'"
					: " "%>>Female
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Mobile Number:</td>
						<td><input type="text" name="mobileNumber"
							value="<%=studentModel.getMobileNumber()%>"></td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Email:</td>
						<td><input type="text" name="email"
							value="<%=studentModel.getEmail()%>"></td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Date Of Birth:(<span style="color: red;"></span>)</td>
						<td><input type="text" name="dob"
							value="<%=studentModel.getDateOfBirth()%>" id="datepicker">
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Address:(<span style="color: red;"></span>)</td>
						<td><input name="address" type="text"
							value="<%=studentModel.getAddress()%>" id="address"></td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Select Dept:(<span style="color: red;"></span>)</td>
						<td><select name="deptName" id="deptNameId">

								<option label="--- Select Branch ---" value="-1"></option>
								<option label="Civil Engineering" value="Civil"
									<%=dept.equalsIgnoreCase("Civil") ? "selected='selected'"
					: " "%>></option>
								<option label="Computer Engineering" value="Comp"
									<%=dept.equalsIgnoreCase("Comp") ? "selected='selected'"
					: " "%>></option>
								<option label="Instrumentation" value="Instru"
									<%=dept.equalsIgnoreCase("Instru") ? "selected='selected'"
					: " "%>></option>
								<option label="Electronics & Telecom" value="E&TC"
									<%=dept.equalsIgnoreCase("E&TC") ? "selected='selected'"
					: " "%>></option>
								<option label="Information Technology" value="IT"
									<%=dept.equalsIgnoreCase("IT") ? "selected='selected'" : " "%>></option>
								<option label="Mechanical Engineering" value="Mech"
									<%=dept.equalsIgnoreCase("Mech") ? "selected='selected'"
					: " "%>></option>
								<option label="Production Engineering" value="Prod"
									<%=dept.equalsIgnoreCase("Prod") ? "selected='selected'"
					: " "%>></option>

						</select>
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Select Year:(<span style="color: red;"></span>)</td>
						<td><select name="academicYear" id="yearId">
								<option label="--- Select Year ---" value="-1"></option>
								<option label="First Year" value="F.E"
									<%=year.equalsIgnoreCase("F.E") ? "selected='selected'"
					: " "%>></option>
								<option label="Second Year" value="S.E"
									<%=year.equalsIgnoreCase("S.E") ? "selected='selected'"
					: " "%>></option>
								<option label="Third Year" value="T.E"
									<%=year.equalsIgnoreCase("T.E") ? "selected='selected'"
					: " "%>></option>
								<option label="Last Year" value="B.E"
									<%=year.equalsIgnoreCase("B.E") ? "selected='selected'"
					: " "%>></option>
						</select>
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
				</table>
				<br />
				<table border="0" width="100%">
					<tr>
						<td width="25%">&nbsp;</td>
						<td width="25%" align="right"><input type="button"
							value="Submit" class="submitButton"
							onclick="javascript:updateStudent('<%=studentModel.getRollNumber()%>')">&nbsp;&nbsp;&nbsp;</td>
						<td width="25%">&nbsp;&nbsp;&nbsp; <input type="button"
							value="Cancel" class="submitButton"
							onclick="javascript:cancelOperation()"></td>
						<td width="25%">&nbsp;</td>
					</tr>

				</table>
				<div>&nbsp;</div>
			</div>
		</form>


	</div>

</body>
</html>