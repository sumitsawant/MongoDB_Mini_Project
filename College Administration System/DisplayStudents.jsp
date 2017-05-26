<%@page import="com.model.StudentModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Students</title>
<link rel="stylesheet" href="resources/css/custom.css">

<script type="text/javascript">
	function deleteStudent(rollNum){
		if(confirm("Are You Sure To Delete?")==true){
			document.getElementById("rollNumId").value=rollNum;
			document.getElementById("userActionId").value="delete";
			document.getElementById("studentFormId").submit();
		}
	}
	function editStudent(rollNum){
			document.getElementById("rollNumId").value=rollNum;
			document.getElementById("userActionId").value="update";
			document.getElementById("studentFormId").submit();
	}
	function viewStudent(rollNum){
			document.getElementById("rollNumId").value=rollNum;
			document.getElementById("userActionId").value="view";
			document.getElementById("studentFormId").submit();
	}
	function displayStudents(){
		var deptName=document.getElementById("deptNameId").value;
		if(deptName!="-1"){
			document.getElementById("deptNameHiddenId").value=deptName;
			document.getElementById("userActionId").value="displayBranchStudent";
			document.getElementById("studentFormId").submit();
		}else{
			alert("Please select branch");
		}
	}
</script>
</head>

<body >
	<div class="mainContainer">
		<jsp:include page="Header.jsp"></jsp:include>
		<form action="StudentServlet" id="studentFormId" method="post">
			<input type="hidden" name="rollNumHidden" id="rollNumId">
			<input type="hidden" name="deptNameHidden" id="deptNameHiddenId">
			<input type="hidden" name="userAction" id="userActionId">
			<div align="left" class="panelTopFormat">&nbsp; Student Display</div>
			<div class="panelBorderFormat">
				<%
					List<StudentModel> studentModels = (List<StudentModel>) request.getAttribute("studentModels");
				%>
				<div align="right">
				<table border="0" width="100%" >
					<tr>
						<td width="40%"></td>
						<td width="20%" align="right">Select Branch:&nbsp;&nbsp;</td>
						<td width="40%">
							<select name="deptName" id="deptNameId" >
								<option label="--- Select Branch ---" value="-1"></option>
								<option label="Civil Engineering" value="Civil"></option>
								<option label="Computer Engineering" value="Comp"></option>
								<option label="Instrumentation" value="Instru"></option>
								<option label="Electronics & Telecom" value="E&TC"></option>
								<option label="Information Technology" value="IT"></option>
								<option label="Mechanical Engineering" value="Mech"></option>
								<option label="Production Engineering" value="Prod"></option>

						</select>
						&nbsp;&nbsp;
							<input type="button" value="Display" border="30" class="submitButton" onclick="displayStudents()">
						</td>
					</tr>
				</table>
				</div>
				<div>&nbsp;</div>
				<%
				if(studentModels!=null&&!studentModels.isEmpty()){
				
				%>
				<table border="1" width="98%" align="center" class="smallFont">
					<tr align="left">
						<th>Roll Number</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Academic Year</th>
						<th>Dept</th>
						<th>Action</th>
					</tr>

					<%
						for (StudentModel studentModel : studentModels) {
					%>
					<tr>
						<td><%=studentModel.getRollNumber()%></td>
						<td><%=studentModel.getFirstName()%></td>
						<td><%=studentModel.getLastName()%></td>
						<td><%=studentModel.getAcademicYear()%></td>
						<td><%=studentModel.getDepartment()%></td>

						<td><a href="javascript:deleteStudent('<%=studentModel.getRollNumber()%>')">Delete</a> &nbsp;|&nbsp;<a href="javascript:editStudent('<%=studentModel.getRollNumber()%>')">Edit</a>
						&nbsp;|&nbsp;
						<a href="javascript:viewStudent('<%=studentModel.getRollNumber()%>')">View</a>
						</td>
					</tr>
					<%
						}
					%>

				</table>
				<%
				}
				else{
					%>
					<div style="color: red;" align="center">
						No Record Found.
					</div>
					<%
				}
				%>
				<div>&nbsp;</div>
			</div>
		</form>


	</div>

</body>
</html>