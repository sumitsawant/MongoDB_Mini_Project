<%@page import="com.model.StaffModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Staff View Page</title>
<link rel="stylesheet" href="resources/css/custom.css">

</head>

<body>
	<div class="mainContainer" >
		<jsp:include page="Header.jsp"></jsp:include>
		
		<%
		StaffModel staffModel=(StaffModel)request.getAttribute("staffModel");	
		%>

			<div align="left" class="panelTopFormat">&nbsp;
				View Staff </div>
			<div class="panelBorderFormat">

				<table border="0" width="100%"
					>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Staff Id:</td>
						<td><%=staffModel.getStaffId()%></td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>First Name:</td>
						<td><%=staffModel.getFirstName()%>
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Middle Name:</td>
						<td><%=staffModel.getMiddleName()%>
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Last Name:</td>
						<td><%=staffModel.getLastName()%>
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Gender:</td>
						<td>
							<%=staffModel.getGender() %>
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Mobile Number:</td>
						<td><%=staffModel.getMobileNumber()%>
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Email:</td>
						<td><%=staffModel.getEmail()%>
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Date Of Birth:</td>
						<td><%=staffModel.getDateOfBirth()%></td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Address:</td>
						<td>
							<%=staffModel.getAddress() %>
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Select Dept:</td>
						<td>
							<%=staffModel.getDepartment() %>
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Select Designation:</td>
						<td><%=staffModel.getDesignation() %></td>
						<td width="25%">&nbsp;</td>
					</tr>
				</table>
				<br />
				
				<div>&nbsp;</div>
			</div>

	</div>

</body>
</html>