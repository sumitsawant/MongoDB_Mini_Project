<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="resources/css/custom.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
</head>
<body>
	<span> <img align="left" alt="logo" src="resources/images/gradient.jpg" width="100%">  </span>
	<div>
		
		<div align="left" style="background-color:#79baec; position: absolute;top: 10%;left:70%;right: 5%;bottom: 65%; border-radius: 20px 20px 20px 20px;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: 16px;font-weight: bold;">Login</span>
		<form action="LoginServlet" id="loginFormId" method="post">

	
					
							<%
								String errorMessage = (String) request.getAttribute("errorMessage");
								if (errorMessage != null && !errorMessage.equalsIgnoreCase(" ")) {
							%>
							<table border="0" width="100%">
								<tr>
									<td width="10%">&nbsp;</td>
									<td >
										<span style="color: #800000;font-weight: bolder;" >
											<%=errorMessage%>
										</span>
									</td>
								</tr>
							</table>
							<%
								}
							%>
						
				<table border="0" width="100%"
					style="font-size: 14px; font-weight: bold">
				
					<tr >
						<td width="5%">&nbsp;</td>
						<td>User Name:</td>
						<td><input type="text" name="userName"></td>
					</tr>
					<tr >
					<td width="5%">&nbsp;</td>
						<td>Password:</td>
						<td ><input type="password" name="password">
					</tr>
					<tr>
					<td width="5%">&nbsp;</td>
						<td >&nbsp;</td>
						<td ><input type="submit" value="Login"style="font-size:15px; background-color: #ffccff;border-color: #ffccff;color: #cococo;"> </td>
					</tr>
				</table>
				
		</form>
		</div>
	</div>



</body>
</html>