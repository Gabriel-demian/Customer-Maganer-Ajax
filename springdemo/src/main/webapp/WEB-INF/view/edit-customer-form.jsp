<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html>
	<head>
		<title>Edit Customer</title>
		
		<!-- Referenciar la plantilla de estilos -->
		<link type="text/css"
		rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css" />
		
		<!-- Referenciar la plantilla de estilos -->
		<link type="text/css"
			rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/add-customer-style.css" />
		
		
		<script src="${pageContext.request.contextPath}/resources/js/validation.js"></script>
		
		
	</head>
	
	<!-- ESTE JSP ES LA PLANTILLA SIMPLE, SIN VALIDACIONES, PERO FUNCIONAL A SU MANERA -->
	
	<body>
		
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
							<td><input type="submit" value="Save" class="save"></td>
						</tr>
					</tbody>
				</table>
				
			</form:form>
			
			<div style="clear; both;"></div>
			<p>
				<a href="${pageContext.request.contextPath}/customer/list">Back to List</a>
			</p>
			
		</div>
		
	</body>
	
</html>