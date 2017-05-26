<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Registration Form</title>
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
	            $("#studentFormId").validate({
	                rules: {
	                	rollNumber:{
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
	                	rollNumber:"Roll number is required",
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
	document.getElementById("studentFormId").submit();
}
</script>
</head>

<body>
	<div class="mainContainer" >
				<%
			String errorMessage= (String)request.getAttribute("errorMessage");
			if(errorMessage!=null&&!errorMessage.equalsIgnoreCase(" ")){
				%>
				<div style="background-color: green; position:absolute; left: 20%;padding-top: 5px; padding-bottom: 5px;" align="center">
					<%=errorMessage %>
				</div>
				<div style="padding-top: 20px;">&nbsp;</div>
				<%
			}
		%>
		<jsp:include page="Header.jsp"></jsp:include>

		<form action="StudentServlet" id="studentFormId" method="post" >
		<input type="hidden" name="userAction" id="userActionId">
			<div align="left" class="panelTopFormat">&nbsp;
				Student Registration</div>
			<div class="panelBorderFormat">

				<table border="0" width="100%" class="smallFont">
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Roll Number<span style="color: red;"></span></td>
						<td><input type="text" name="rollNumber" id="rollNumber"></td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td width="25%">First Name<span style="color: red;"></span></td>
						<td width="50%"><input type="text" value="" name="firstName" id="firstNameId ">
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Middle Name</td>
						<td><input type="text";value=" ";name="middleName">
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Last Name<span style="color: red;"></span></td>
						<td><input type="text";value=""; name="lastName" id="lastNameId">
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Gender</td>
						<td><input type="radio" name="gender" value="Male"
							checked="checked">Male <input type="radio" name="gender"
							value="Female">Female</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Mobile Number</td>
						<td><input type="text" name="mobileNumber" id="mobileNumberId">
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Email</td>
						<td><input type="text" name="email" id="emailId">
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Date Of Birth</td>
						<td><input type="text" name="dob" id="datepicker"></td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Address</td>
						<td><input type="text" name="address" id="address">
						</td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Select Dept:</td>
						<td><select name="deptName" id="deptNameId">
								<option label="--- Select Branch ---" value="Null"></option>
								<option label="Civil Engineering" value="Civil"></option>
								<option label="Computer Engineering" value="Comp"></option>
								<option label="Instrumentation" value="Instru"></option>
								<option label="Electronics & Telecom" value="E&TC"></option>
								<option label="Information Technology" value="IT"></option>
								<option label="Mechanical Engineering" value="Mech"></option>
								<option label="Production Engineering" value="Prod"></option>

						</select></td>
						<td width="25%">&nbsp;</td>
					</tr>
					<tr>
						<td width="25%">&nbsp;</td>
						<td>Select Year</td>
						<td><select name="academicYear" id="yearId">
								<option label="--- Select Year ---" value="Null"></option>
								<option label="First Year" value="F.E"></option>
								<option label="Second Year" value="S.E"></option>
								<option label="Third Year" value="T.E"></option>
								<option label="Last Year" value="B.E"></option>
						</select></td>
						<td width="25%">&nbsp;</td>
					</tr>
				</table>
				<br />
				<table border="0" width="100%">
					<tr>
						<td width="25%">&nbsp;</td>
						<td width="25%" align="right">
						<input type="submit"
							value="Submit"
							class="submitButton"  >&nbsp;&nbsp;&nbsp;</td>
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