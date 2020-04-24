<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html>
	<head>
		<title>Save Customer</title>
		
		<!-- Referenciar la plantilla de estilos -->
		<link type="text/css"
		rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css" />
		
		
		<!-- Referenciar la plantilla de estilos -->
		<link type="text/css"
			rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/add-customer-style.css" />
		
		<script type="text/javascript">
			var urlAsynchronousHTTP='${pageContext.request.contextPath}/src';
		</script>
		
		<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
		
		<script src="${pageContext.request.contextPath}/resources/js/validation.js"></script>
		
	</head>
	
	
	<body>
		
		<div id="wrapper">
			<div id="header">
				<h2>CRM - Customer Relationship Manager</h2>
			</div>
		</div>
		
		<div id="container">
			<h3>Save Customer</h3>
		
			<form name="RegForm" action="saveCustomer" onsubmit="return Validador()" method="post" id="RegForm">
				
				<div class="form-row">
					
					<div id="firstNamediv">
						<p>First Name: <input type="text" size=45 name="firstName" id="firstName"> </p>
						<div id="name_error"></div>
   					</div>
					
					<div id="lastNamediv">
				    	<p>Last Name: <input type="text" size=45 name="lastName" id="lastName">  </p>
				   	 	<div id="lastname_error"></div>
   					</div>
   					
   					<div id="emaildiv">
				    	<p>E-mail: <input type="email" size=45 name="email" id="email" >  </p>
				    	<div id="email_error"></div>
   					</div>
					<br> 
					<p><input type="submit" value="send" name="Submit">  
						<input type="reset" value="reset" id="reset">  
						<input type="button" value="faker" id="fakerButton" onclick="fillFaker()">  
					</p> 
				</div>
			</form>
			
			<div class="spinner-border text-dark" align="center" id="loadingdiv">
				<span class="sr-only">Loading...</span>
			</div>
			
			<div style="clear; both;"></div>
			<p>
				<a href="${pageContext.request.contextPath}/customer/list">Back to List</a>
			</p>
			
		</div>
		
	</body>
	
</html>










