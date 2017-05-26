<%@page import="com.model.StaffModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Staff Update Form</title>
<link rel="stylesheet" href="resources/css/custom.css">
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<script src="resources/js/jquery-1.10.2.js"></script>
<script src="resources/js/jquery-ui.js"></script>
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
		  
function updateStaff(staffId){
	alert(staffId);
		document.getElementById("userActionId").value="updateStaff";
		document.getElementById("staffId").value=staffId;
		document.getElementById("staffFormId").submit();
}
function cancelOperation(){
	document.getElementById("userActionId").value="cancel";
	document.getElementById("staffFormId").submit();
}
</script>
</head>

<body>
	<div class="mainContainer" >
		<jsp:include page="Header.jsp"></jsp:include>
		<form action="StaffServlet" id="staffFormId" method="post">
		<%
		StaffModel staffModel=(StaffModel)request.getAttribute("staffModel");
		String dept=staffModel.getDepartment();
		String designation=staffModel.getDesignation();
		String gender=staffModel.getGender();
		%>

		<input type="hidden" name="userAction" id="userActionId">
		<input type="hidden" name="staffIdHidden" id="staffId">
			<div align="left" class="panelTopFormat">&nbsp;
				Update Staff </div>
			<div class="panelBorderFormat">

				<table border="0" width="100%"
					style="font-size: 14px; font-weight: bold">
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Staff Id:</td>
						<td><input type="text" name="staffId" value="<%=staffModel.getStaffId()%>" disabled="disabled"></td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>First Name:<span style="color: red;"></span></td>
						<td><input type="text" name="firstName" value="<%=staffModel.getFirstName()%>">
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Middle Name:</td>
						<td><input type="text" name="middleName" value="<%=staffModel.getMiddleName()%>">
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Last Name:<span style="color: red;"></span></td>
						<td><input type="text" name="lastName" value="<%=staffModel.getLastName()%>">
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Gender:</td>
						<td><input type="radio" name="gender" value="Male" <%=gender.equalsIgnoreCase("Male")? "checked='checked'":" "%>>Male 
							<input type="radio" name="gender" value="Female" <%=gender.equalsIgnoreCase("Female")? "checked='checked'":" "%> >Female
							</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Mobile Number:</td>
						<td><input type="text" name="mobileNumber" value="<%=staffModel.getMobileNumber()%>">
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Email:</td>
						<td><input type="text" name="email" value="<%=staffModel.getEmail()%>">
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Date Of Birth:<span style="color: red;"></span></td>
						<td><input type="text" name="dob" value="<%=staffModel.getDateOfBirth()%>"></td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Address:<span style="color: red;"></span></td>
						<td>
						<input type="text" name="address" value="<%=staffModel.getAddress()%>">
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Select Dept:<span style="color: red;"></span></td>
						<td><select name="deptName" >
								
								<option label="--- Select Branch ---" value="-1"></option>
								<option label="Civil Engineering" value="Civil" <%=dept.equalsIgnoreCase("Civil")? "selected='selected'":" "%>></option>
								<option label="Computer Engineering" value="Comp" <%=dept.equalsIgnoreCase("Comp")? "selected='selected'":" "%>></option>
								<option label="Instrumentation" value="Instru" <%=dept.equalsIgnoreCase("Instru")? "selected='selected'":" "%>></option>
								<option label="Electronics & Telecom" value="E&TC" <%=dept.equalsIgnoreCase("E&TC")? "selected='selected'":" "%>></option>
								<option label="Information Technology" value="IT" <%=dept.equalsIgnoreCase("IT")? "selected='selected'":" "%>></option>
								<option label="Mechanical Engineering" value="Mech" <%=dept.equalsIgnoreCase("Mech")? "selected='selected'":" "%>></option>
								<option label="Production Engineering" value="Prod" <%=dept.equalsIgnoreCase("Prod")? "selected='selected'":" "%>></option>

						</select></td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						
							<td>Select Designation:<span style="color: red;"></span></td>
						<td><select name="designation">
								<option label="--- Select Designation ---" value="-1"></option>
								<option label="Principal" value="principal" <%=designation.equalsIgnoreCase("principal")? "selected='selected'":" "%> ></option>
								<option label="HOD(Head of Department)" value="HOD(Head of Department)" <%=designation.equalsIgnoreCase("HOD(Head of Department)")? "selected='selected'":" "%>></option>
								<option label="Lecturer" value="Lecturer" <%=designation.equalsIgnoreCase("Lecturer")? "selected='selected'":" "%> ></option>
								<option label="Assistance" value="Assistance" <%=designation.equalsIgnoreCase("Assistance")? "selected='selected'":" "%>></option>
							
						</select>
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
				</table>
				<br />
				<table border="0" width="100%">
					<tr>
						<td width="25%">&nbsp;</td>
						<td width="25%" align="right">
						<input type="button"
							value="Submit"
							class="submitButton" onclick="javascript:updateStaff('<%=staffModel.getStaffId()%>')" >&nbsp;&nbsp;&nbsp;</td>
						<td width="25%">&nbsp;&nbsp;&nbsp;
						<input type="button" value="Cancel" class="submitButton"  onclick="javascript:cancelOperation()">
						</td>
						<td width="25%">&nbsp;</td>
					</tr>

				</table>
				<div>&nbsp;</div>
			</div>
		</form>


	</div>

</body>
</html>