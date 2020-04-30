<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div align="center" id="wrapper">
	<div id="header">
		<h2>CRM - Customer Relationship Manager</h2>
	</div>
</div>

<div align="center" id="container">
	<h3>Edit Customer</h3>
	
	<form:form name="RegForm" action="saveCustomer" modelAttribute="customer" method="POST" onsubmit="return Validador()">
		<!-- asosiar los datos con el id del cliente -->
		<form:hidden path="id"/>
		
		<table>
			<tbody>
				<tr>
					<td><label>First Name:</label></td>
					<td><form:input path="firstName" type="text" /></td>
					<td><div id="name_error"></div></td>
				</tr>
				
				<tr>
					<td><label>Last Name:</label></td>
					<td><form:input path="lastName" type="text" /></td>
					<td><div id="lastname_error"></div></td>
				</tr>
				<tr>
					<td><label>Email:</label></td>
					<td><form:input path="email" type="email"/></td>
					<td><div id="email_error"></div></td>
				</tr>
				<tr>
					<td><label></label></td>
					<td align="center"><input type="submit" value="Save" class="save"></td>
				</tr>
			</tbody>
		</table>
		
	</form:form>
	
</div>