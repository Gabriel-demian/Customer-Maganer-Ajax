var app;
var customers;
var debug = true;


window.onload = function(){
	$("#loadingdiv").hide();
	
	path = location.pathname.split('/');
	if (path[path.length-2].indexOf('.html')>-1) {
		  path.length = path.length - 1;
		}
	app = path[path.length-3];
	
}



function Validador(customer) {

//	var firstName = document.forms['RegForm']['firstName'];
//	var lastName = document.forms['RegForm']['lastName'];
//	var email = document.forms['RegForm']['email'];
	
	
	
	var firstName = customer.firstName;
	var lastName = customer.lastName;
	var email = customer.email;
	
	console.log(customer);
	console.log(firstName);
	console.log(lastName);
	console.log(email);
			
	var name_error = document.getElementById('name_error');
	var lastname_error = document.getElementById('lastname_error');
	var email_error = document.getElementById('email_error');

	var tieneError = false;

	if (firstName === "" || firstName.trim() == "") {
		//firstName.style.border = "1px solid red";
		document.getElementById('name_error').style.color = "red";
		document.getElementById('modalFirstName').style.color = "red";
		name_error.textContent = "first name is required";
		tieneError = true;
	} else {
		if (firstName.length < 3) {
			//firstName.style.border = "1px solid red";
			document.getElementById('name_error').style.color = "red";
			document.getElementById('modalFirstName').style.color = "red";
			name_error.textContent = "first name must be at least 3 characters";
			tieneError = true;
		} else {
			//firstName.style.border = "1px solid #5e6e66";
			document.getElementById('modalFirstName').style.color = "green";
			name_error.innerHTML = "";
		}
	}
	// validate lastName
	if (lastName === "" || lastName.trim() == "") {
		//lastName.style.border = "1px solid red";
		document.getElementById('lastname_error').style.color = "red";
		document.getElementById('modalLastName').style.color = "red";
		lastname_error.textContent = "last name is required";
		tieneError = true;
	} else {
		if (lastName.length < 3) {
			//lastName.style.border = "1px solid red";
			document.getElementById('lastname_error').style.color = "red";
			document.getElementById('modalLastName').style.color = "red";
			lastname_error.textContent = "last name must be at least 3 characters";
			tieneError = true;
		} else {
			//lastName.style.border = "1px solid #5e6e66";
			document.getElementById('modalLastName').style.color = "green";
			lastname_error.innerHTML = "";
		}
	}

	// validate email
	if (email == "" || email.trim() == "" || !validateEmail(email)) {
		document.getElementById('email_error').style.color = "red";
		document.getElementById('modalEmail').style.color = "red";
		email_error.textContent = "Please, enter a valid email address";
		tieneError = true;
	}else {
		//email.style.border = "1px solid #5e6e66";
		document.getElementById('modalEmail').style.color = "green";
		email_error.innerHTML = "";
	}

	return !tieneError;
}

function validateEmail(email) {
  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(email);
}

function fillFaker(){
	
	doDebug(app);
	
	$("#RegForm").hide();
	$("#loadingdiv").show();
	
	$.ajax({
		
		url: "/springdemo/fake",
		type:"GET",
		
		error: function(){
			doDebug("fillFaker error");
		},
		success: function(data){
			doDebug(data);
			doDebug(data.firstName);
			$("#firstName").val(data.firstName);
			$("#lastName").val(data.lastName);
			$("#email").val(data.email);
			$("#RegForm").show();
			$("#loadingdiv").hide();
		}
		
	});
}


function showList(){
	
	doDebug("showList");

	$("#RegForm").hide();
	$("#loadingdiv").show();
	
	$.ajax({
		
		url: "/springdemo/list",
		type:"GET",
		error: function(trim){
			doError(trim);
		},
		success: function(data){
			
			customers = data.lista;
			
			var $table = $("<table border='1' ></table>"); 
	        $table.append(	"<tr>" +
				        		"<th style='text-align:center' >First Name</th>" +
				        		"<th style='text-align:center' >Last Name</th>" +
				        		"<th style='text-align:center' >Email</th>" +
				        		"<th style='text-align:center' >Options</th>" +
			        		"</tr>");
	        
			for(obj of data.lista){
				var tdid = "tr" + obj.id;
				$table.append(
						"<tr id='" + tdid + "' >" +
						"	<td>" + obj.firstName + "</td>" +
						"	<td>" + obj.lastName + "</td>" +
						"	<td>" + obj.email +"</td>" +
						"	<td>" +
						"		<button  type='button'    class='btn btn-info btn-sm' data-toggle='modal' onclick='openModalCustomer("+ obj.id +")'> Edit </button>&nbsp;&nbsp;" +
						"		<button  name='delButton' class='btn btn-info btn-sm' method='delete' onclick='deleteCustomer(id)' id='" + obj.id + "'> Delete </button>" +
						"	</td>" +
						"</tr>")
						
			}
			$("#hiddenTable").html($table);
		}
	});
	
}

function deleteCustomer(id){
	
	if (confirm('Do you really want to delete record?')) {
		
		doDebug("deleteCustomer: " + id);
		
		doDebug("/springdemo/customer/delete/"+id);
		
		$.ajax({
			
	        type : 'DELETE',
	        contentType: "application/json",
	        url : "/springdemo/customer/delete/"+id,
	        dataType : 'json',
	        
	        success: function (result) {
	        	doDebug(result);
	        	var tr = "tr"+id;
	        	document.getElementById(tr).remove();
	        },
	        error: function (e) {
	            doDebug("deleteCustomer Error");
	        }
	   })
	}
};


function getCustomer(id){
	
	doDebug("getCustomer");
	
	for(customer of customers){
		
		doDebug("getCustomer customer: " + customer);
		
		if(customer.id == id){
			return customer;
		}
	}
	
}

function openModalCustomer(id){
	
	doDebug("openModalCustomer");
	
	emptyModal();
	
	customer = getCustomer(id);
	
	doDebug(customer);
	
	if(customer){
		$("#modalId").val(customer.id);
		$("#modalFirstName").val(customer.firstName);
		$("#modalLastName").val(customer.lastName);
		$("#modalEmail").val(customer.email);
	}else{
		emptyModal();
	}
	
	$("#myModal").modal();
}


function doDebug(trim){
	if(debug){
		console.log(trim);
	}
}

function saveOrUpdateModal(){
	
	doDebug("saveOrUpdateModal");
	
	customer = {id:$("#modalId").val(), 
			firstName:$("#modalFirstName").val(),
			lastName:$("#modalLastName").val(),
			email:$("#modalEmail").val()};
	
	if(inputCorrect(customer)){
		
		method = (customer.id === '') ? 'POST' : 'PUT';
		
		$.ajax({
			
	        type : method,
	        contentType: "application/json",
	        url : "/springdemo/customer",
	        dataType : 'json',
	        data: JSON.stringify(customer),
	        
	        success: function (data) {
	        	doDebug(data);
	        	showList();
	        	$('#myModal').modal('hide');
	        },
	        error: function (e) {
	            doDebug("saveOrUpdateModal Error");
	        }
	   })
	   
	}
}

function emptyModal(){
	
	$("#modalId").val('');
	$("#modalFirstName").val('');
	$("#modalLastName").val('');
	$("#modalEmail").val('');
	
}


function doError(trim){
	
	console.trace(trim);
	
}

function inputCorrect(customer){
	
	
	//agregar logica de val, dar mensaje al usuario
	if(Validador(customer)){
		return true;
	}else{
		return false;
	}
	
	
}






