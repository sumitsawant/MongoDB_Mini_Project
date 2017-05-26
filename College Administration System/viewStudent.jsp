<%@page import="com.model.StudentModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student View Page</title>
<link rel="stylesheet" href="resources/css/custom.css">

</head>

<body>
	<div class="mainContainer" >
		<jsp:include page="Header.jsp"></jsp:include>
		
		<%
		StudentModel studentModel=(StudentModel)request.getAttribute("studentModel");	
		%>

			<div align="left" class="panelTopFormat">&nbsp;
				View Student </div>
			<div class="panelBorderFormat">

				<table border="0" width="100%"
					>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Roll Number:</td>
						<td><%=studentModel.getRollNumber()%></td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>First Name:</td>
						<td><%=studentModel.getFirstName()%>
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Middle Name:</td>
						<td><%=studentModel.getMiddleName()%>
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Last Name:</td>
						<td><%=studentModel.getLastName()%>
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Gender:</td>
						<td>
							<%=studentModel.getGender() %>
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Mobile Number:</td>
						<td><%=studentModel.getMobileNumber()%>
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Email:</td>
						<td><%=studentModel.getEmail()%>
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Date Of Birth:</td>
						<td><%=studentModel.getDateOfBirth()%></td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Address:</td>
						<td>
							<%=studentModel.getAddress() %>
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Select Dept:</td>
						<td>
							<%=studentModel.getDepartment() %>
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Select Year:</td>
						<td><%=studentModel.getAcademicYear() %></td>
						<td width="25%">&nbsp;</td>
					</tr>
				</table>
				<br />
				
				<div>&nbsp;</div>
			</div>

	</div>

</body>
</html>