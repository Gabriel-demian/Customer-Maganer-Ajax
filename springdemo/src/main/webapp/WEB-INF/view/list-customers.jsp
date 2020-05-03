<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>List Customers</title>
		
		<meta name="viewport" content="width=device-width"/>
		
		<!-- Referenciar la plantilla de estilos -->
		<link type="text/css"
		rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css" />
		
		<!-- Referenciar la plantilla de estilos -->
		<link type="text/css"
		rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/add-customer-style.css" />
		
		
		<!-- Script Validaciones -->
		<script src="${pageContext.request.contextPath}/resources/js/validation.js"></script>
		
		<!-- Script Jquery -->
		<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  		
  		<!-- Bootstrap -->
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 		
		
	</head>
	<body onload="showList()" >
		
		<div align="center" id="wrapper">
			<div id="header">
				<h2>CRM - Customer Relationship Manager</h2>
			</div>
		</div>
		
		<div id="content" align="center">
		
				
				<!-- ADD CUSTOMER -->
				<input type="button" value="Add Customer"
						onclick="openModalCustomer()" 
						class="add-button"
				/>
				
				
				<!-- FAKE CUSTOMER -->
				<input type="button" value="Fake Customer"
						onclick="window.location.href='showFormFaker'; return false;" 
						class="add-button"
				/>
				<br>
				
		</div>
		<div id="hiddenTable"></div>
		<jsp:include page="table-edit-include.jsp" flush="true" />
		
	</body>
</html>