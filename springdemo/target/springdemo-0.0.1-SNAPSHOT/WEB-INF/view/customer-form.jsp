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
		
			<form name="RegForm" action="saveCustomer" onsubmit="return Validador()" method="post">
				<div class="form-row">
					
					<div id="firstName">
						<p>First Name: <input type="text" size=45 name="firstName" id="firstName"> </p>
						<div id="name_error"></div>
   					</div>
					
					<div id="lastName">
				    	<p>Last Name: <input type="text" size=45 name="lastName" id="lastName">  </p>
				   	 	<div id="lastname_error"></div>
   					</div>
   					
   					<div id="email">
				    	<p>E-mail: <input type="email" size=45 name="email" id="email" >  </p>
				    	<div id="email_error"></div>
   					</div>
					<br> 
					<p><input type="submit" value="send" name="Submit">  
					<input type="reset" value="reset" id="reset">  
				</p> 
				</div>
			</form>
			
			
			<div style="clear; both;"></div>
			<p>
				<a href="${pageContext.request.contextPath}/customer/list">Back to List</a>
			</p>
			
		</div>
		
	</body>
	
</html>










