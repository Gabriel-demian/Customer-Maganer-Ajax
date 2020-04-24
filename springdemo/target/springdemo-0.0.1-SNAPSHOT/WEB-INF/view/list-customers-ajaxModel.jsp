<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>List Customers</title>
		
		<!-- Referenciar la plantilla de estilos -->
		<link type="text/css"
		rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css" />
		
	</head>
	<body>
		
		<div align="center" id="wrapper">
			<div id="header">
				<h2>CRM - Customer Relationship Manager</h2>
			</div>
		</div>
		
		<div align="center"  id="container">
		
			<div id="content">
			
			
			
			
				
				<!-- put new button: Add Customer -->
				<input type="button" value="Add Customer"
						onclick="window.location.href='showFormAdd'; return false;" 
						class="add-button"
				/>
				
				
				<input type="button" value="Fake Customer"
						onclick="window.location.href='showFormFaker'; return false;" 
						class="add-button"
				/>
						<!-- la acción de "onclick" llama al Spring Controller mapping -->
						<!-- class="add-button" le da estilo del CSS Style -->
				
				
				<!--  add a search box -->
	            <form:form action="search" method="GET">
	                Search customer: <input type="text" name="theSearchName" />
	                
	                <input type="submit" value="Search" class="add-button" />
	            </form:form>
				
				
				
				<!-- agregar tabla html -->
				
				
				
				<div class="row">
					<div class="col-xs-6">
						<table class="table">
							<thead>
								<tr>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Email</th>
								</tr>
							</thead>
							
							<tbody id="show-customers">
								
								
								
								
							</tbody>
							
						</table>
					</div>
				</div>
					
					
					
					
					
			</div>
			
		</div>
		
	</body>
</html>