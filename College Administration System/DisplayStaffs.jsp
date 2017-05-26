<%@page import="com.model.StaffModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Staffs</title>
<link rel="stylesheet" href="resources/css/custom.css">
<script type="text/javascript">
	function deleteStaff( staffId){
		if(confirm("Are You Sure To Delete?")==true){
			document.getElementById("staffIdId").value=staffId;
			document.getElementById("userActionId").value="delete";
			document.getElementById("staffFormId").submit();
		}
	}
	function editStaff(staffId){
			document.getElementById("staffIdId").value=staffId;
			document.getElementById("userActionId").value="update";
			document.getElementById("staffFormId").submit();
	}
	function viewStaff(staffId){
			document.getElementById("staffIdId").value=staffId;
			document.getElementById("userActionId").value="view";
			document.getElementById("staffFormId").submit();
	}
	function displayStaffs(){
		var designationName=document.getElementById("designationNameId").value;
	//	alert("designation name method"+designationName);
		if(designationName!="-1"){
			document.getElementById("designationNameHiddenId").value=designationName;
			document.getElementById("userActionId").value="displayDesignationStaff";
			document.getElementById("staffFormId").submit();
		}else{
			alert("Please select Designation");
		}
	}
</script>
</head>

<body >
	<div class="mainContainer">
		<jsp:include page="Header.jsp"></jsp:include>
		<form action="StaffServlet" id="staffFormId" method="post">
			<input type="hidden" name="staffIdHidden" id="staffIdId">
			<input type="hidden" name="userAction" id="userActionId">
			<input type="hidden" name="designationNameHidden" id="designationNameHiddenId">
			<div align="left" class="panelTopFormat">&nbsp; Staff Display</div>
			<div class="panelBorderFormat">
				<%
					List<StaffModel> staffModels = (List<StaffModel>) request.getAttribute("staffModels");
				%>
							<div align="right">
				<table border="0" width="100%" >
					<tr>
						<td width="40%"></td>
						<td width="20%" align="right">Select Designation:&nbsp;&nbsp;</td>
						<td width="40%">
							<select name="designationName" id="designationNameId" >
								<option label="--- Select Designation ---" value="-1"></option>
								<option label="Principal" value="principal"></option>
								<option label="HOD(Head of Department)" value="HOD"></option>
								<option label="Lecturer" value="teacher"></option>
								<option label="Assistance" value="Assistance"></option>
						</select>
						&nbsp;&nbsp;
							<input type="button" value="Display" border="30" class="submitButton" onclick="displayStaffs()">
						</td>
					</tr>
				</table>
				</div>
				<div>&nbsp;</div>
				<%
				if(staffModels!=null&&!staffModels.isEmpty()){
				
				%>		
				<table border="1" width="98%" align="center"
					style="font-size: 14px; font-weight: bold">
					<tr align="left">
						<th>Staff Id</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Designation</th>
						<th>Dept</th>
						<th>Action</th>
					</tr>

					<%
						for (StaffModel staffModel : staffModels) {
					%>
					<tr>
						<td><%=staffModel.getStaffId()%></td>
						<td><%=staffModel.getFirstName()%></td>
						<td><%=staffModel.getLastName()%></td>
						<td><%=staffModel.getDesignation()%></td>
						<td><%=staffModel.getDepartment()%></td>

						<td><a href="javascript:deleteStaff('<%=staffModel.getStaffId()%>')">Delete</a> &nbsp;|&nbsp;<a href="javascript:editStaff('<%=staffModel.getStaffId()%>')">Edit</a>
						&nbsp;|&nbsp;
						<a href="javascript:viewStaff('<%=staffModel.getStaffId()%>')">View</a>
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