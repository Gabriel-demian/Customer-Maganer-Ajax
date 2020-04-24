<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration Success</title>

<!-- Referenciar la plantilla de estilos -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />


<!-- Referenciar la plantilla de estilos -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/add-customer-style.css" />

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>


</head>
<body>

	<div align="center" id="wrapper">
		<div id="header">
			<h2>CRM - Customer Relationship Manager</h2>
		</div>
	</div>
	
	<div align="center">
	
		<div class="spinner-border text-primary" align="center">
		  <span class="sr-only">Loading...</span>
		</div>
		<div class="spinner-border text-secondary" align="center">
		  <span class="sr-only">Loading...</span>
		</div>
		<div class="spinner-border text-success" align="center">
		  <span class="sr-only">Loading...</span>
		</div>
		<div class="spinner-border text-danger" align="center">
		  <span class="sr-only">Loading...</span>
		</div>
		<div class="spinner-border text-warning" align="center">
		  <span class="sr-only">Loading...</span>
		</div>
		<div class="spinner-border text-info" align="center">
		  <span class="sr-only">Loading...</span>
		</div>
		<div class="spinner-border text-dark" align="center">
			<span class="sr-only">Loading...</span>
		</div>

		<table border="0">
			<tr>
				<td colspan="2" align="center"><h2>Registration Succeeded!</h2></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<h3>Thank you for registering! Here's the review of your
						details:</h3>
				</td>
			</tr>
			<tr>
				<td>First Name:</td>
				<td>${customer.firstName}</td>
			</tr>
			<tr>
				<td>Last Name:</td>
				<td>${customer.lastName}</td>
			</tr>
			<tr>
				<td>E-mail:</td>
				<td>${customer.email}</td>
			</tr>
		</table>
		<div style=""></div>
		<p>
			<a href="${pageContext.request.contextPath}/customer/list">Back
				to List</a>
		</p>
	</div>
</body>
</html>