<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Staff Registration Form</title>
<link rel="stylesheet" href="resources/css/custom.css">
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<script src="resources/js/jquery-1.10.2.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/jqueryvalidate.js"></script>
<style type="text/css">
.error{
color: red;
}
</style>
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
//form validation rules
$("#staffFormId").validate({
    rules: {
    	staffId:{
    		required:true,
    		minlength:1
    	},
        firstName: "required",
        lastName: "required",
        mobileNumber: {
            required: true,
            digits: true,
			minlength: 10,
			maxlength: 10
        },
        email: {
            required: true,
            email: true
        },
        dob: "required"
    },
    messages: {
    	staffId:"StaffId is required",
        firstName: "First name is required",
        lastName: "Last name is required",
        mobileNumber: {
            required: "Mobile number is required",
            minlength: "Mobile numebr must be of atleast 10 digits",
            maxlength: "Mobile numebr must be of atmost 10 digits"
        },
        email: "Please enter valid email",
        dob: "Date of birth is required"
    },
    submitHandler: function(form) {
    document.getElementById("userActionId").value="insert";
    form.submit();
    }
});
});
function cancelOperation(){
	document.getElementById("userActionId").value="cancel";
	document.getElementById("staffFormId").submit();
}
</script>
</head>

<body>
	<div class="mainContainer">
		<jsp:include page="Header.jsp"></jsp:include>
		<%
			String errorMessage= (String)request.getAttribute("errorMessage");
			if(errorMessage!=null&&!errorMessage.equalsIgnoreCase(" ")){
				%>
		<div
			style="background-color: green; position: absolute; left: 20%; padding-top: 5px; padding-bottom: 5px;"
			align="center">
			<%=errorMessage %>
		</div>
		<div style="padding-top: 20px;">&nbsp;</div>
		<%
			}
		%>
		<form action="StaffServlet" id="staffFormId" method="post">
			<input type="hidden" name="userAction" id="userActionId">
			<div align="left" class="panelTopFormat">&nbsp; Staff Registration</div>
			<div class="panelBorderFormat">

				<table border="0" width="100%" class="smallFont">
					<tr>
						<td width="25%">&nbsp;</td>
						<td width="15%">Staff Id<span style="color: red;"></span></td>
						<td width="60%"><input type="text" name="staffId" id="staffId">
						&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td width="15%">First Name<span style="color: red;"></span></td>
						<td width="60%"><input type="text" name="firstName" id="firstNameId">
						</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td width="15%">Middle Name</td>
						<td width="60%"><input type="text" name="middleName">
						
						</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td width="15%">Last Name<span style="color: red;"></span></td>
						<td width="60%"><input type="text" name="lastName" id="lastNameId">
						</td>
						
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td width="15%">Gender</td>
						<td width="60%"><input type="radio" name="gender" value="Male"
							checked="checked">Male <input type="radio" name="gender"
							value="Female">Female</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td width="15%">Mobile Number</td>
						<td width="60%"><input type="text" name="mobileNumber"
							id="mobileNumberId"></td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td width="15%">Email</td>
						<td width="60%"><input type="text" name="email" id="emailId"></td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td width="15%">Date Of Birth</td>
						<td width="60%"><input type="text" name="dob" id="datepicker">
						</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td width="15%">Address</td>
						<td width="60%"><input type="text" name="address"></td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td width="15%">Select Dept:</td>
						<td width="60%"><select name="deptName" id="deptNameId">
								<option label="--- Select Branch ---" value=" "></option>
								<option label="Civil Engineering" value="Civil"></option>
								<option label="Computer Engineering" value="Comp"></option>
								<option label="Instrumentation" value="Instru"></option>
								<option label="Electronics & Telecom" value="E&TC"></option>
								<option label="Information Technology" value="IT"></option>
								<option label="Mechanical Engineering" value="Mech"></option>
								<option label="Production Engineering" value="Prod"></option>

						</select>
						</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td width="15%">Select Designation:</td>
						<td width="60%"><select name="designation">
								<option label="--- Select Designation ---" value=" "></option>
								<option label="Principal" value="principal"></option>
								<option label="HOD(Head of Department)" value="HOD(Head of Department)"></option>
								<option label="Lecturer" value="Lecturer"></option>
								<option label="Assistance" value="Assistance"></option>

						</select></td>
					</tr>
				</table>
				<br />
				<table border="0" width="100%">
					<tr>
						<td width="25%">&nbsp;</td>
						<td width="25%" align="right"><input type="submit"
							value="Submit" class="submitButton" >&nbsp;&nbsp;&nbsp;</td>
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