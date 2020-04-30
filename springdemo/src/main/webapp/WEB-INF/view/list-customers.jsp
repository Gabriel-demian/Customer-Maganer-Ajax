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
		
		
		<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/validation.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 		 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		
	</head>
	<body onload="showList()" >
		
		<div align="center" id="wrapper">
			<div id="header">
				<h2>CRM - Customer Relationship Manager</h2>
			</div>
		</div>
			
		
		
		<div id="content" align="center">
		
				<!-- UPDATE CUSTOMER -->
				<c:url var="updateLink" value="editPage()'">
					<c:param name="customerId" value="${tempCustomer.id}"></c:param>
				</c:url>
		
				<!-- ADD CUSTOMER -->
				<input type="button" value="Add Customer"
						onclick="window.location.href='showFormAdd'; return false;" 
						class="add-button"
				/>
				
				
				<!-- FAKE CUSTOMER -->
				<input type="button" value="Fake Customer"
						onclick="window.location.href='showFormFaker'; return false;" 
						class="add-button"
				/>
				<br>
		</div>
		
		
		

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Edit Customerr</h4>
        </div>
        
        
        <jsp:include page="table-edit-include.jsp" flush="true" />
        
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
		
	</body>
</html>