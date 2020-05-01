window.onload = function(){
	$("#loadingdiv").hide();
}


function Validador() {

	var firstName = document.forms['RegForm']['firstName'];
	var lastName = document.forms['RegForm']['lastName'];
	var email = document.forms['RegForm']['email'];

	var name_error = document.getElementById('name_error');
	var lastname_error = document.getElementById('lastname_error');
	var email_error = document.getElementById('email_error');

	var tieneError = false;

	if (firstName.value == "" || firstName.value.trim() == "") {
		firstName.style.border = "1px solid red";
		document.getElementById('firstName').style.color = "red";
		name_error.textContent = "first name is required";
		//firstName.focus();
		tieneError = true;
	} else {
		if (firstName.value.length < 3) {
			firstName.style.border = "1px solid red";
			document.getElementById('firstName').style.color = "red";
			name_error.textContent = "first name must be at least 3 characters";
			tieneError = true;
		} else {
			firstName.style.border = "1px solid #5e6e66";
			document.getElementById('firstName').style.color = "green";
			name_error.innerHTML = "";
		}
	}
	// validate lastName
	if (lastName.value == "" || lastName.value.trim() == "") {
		lastName.style.border = "1px solid red";
		document.getElementById('lastName').style.color = "red";
		lastname_error.textContent = "last name is required";
		//lastName.focus();
		tieneError = true;
	} else {
		if (lastName.value.length < 3) {
			lastName.style.border = "1px solid red";
			document.getElementById('lastName').style.color = "red";
			lastname_error.textContent = "last name must be at least 3 characters";
			tieneError = true;
		} else {
			lastName.style.border = "1px solid #5e6e66";
			document.getElementById('lastName').style.color = "green";
			lastname_error.innerHTML = "";
		}
	}

	// validate email
	if (email.value == "" || email.value.trim() == "") {
		email.style.border = "1px solid red";
		document.getElementById('email').style.color = "red";
		email_error.textContent = "Email is required";
		tieneError = true;
	} else {
		email.style.border = "1px solid #5e6e66";
		document.getElementById('email').style.color = "green";
		email_error.innerHTML = "";
	}

	return !tieneError;
}


function fillFaker(){
	console.log("In");
	var path = location.pathname.split('/');
	if (path[path.length-2].indexOf('.html')>-1) {
		  path.length = path.length - 1;
		}
	var app = path[path.length-3];
	console.log(app);
	
	$("#RegForm").hide();
	$("#loadingdiv").show();
	
	$.ajax({
		
		url: "/"+ app +"/fake",
		type:"GET",
		
		error: function(){
			console.log("error");
		},
		success: function(data){
			console.log(data);
			console.log(data.firstName);
			$("#firstName").val(data.firstName);
			$("#lastName").val(data.lastName);
			$("#email").val(data.email);
			$("#RegForm").show();
			$("#loadingdiv").hide();
		}
		
	});
}


function showList(){
	console.log("In");
	var path = location.pathname.split('/');
	if (path[path.length-2].indexOf('.html')>-1) {
		  path.length = path.length - 1;
		}
	var app = path[path.length-3];
	console.log(app);
	
	$("#RegForm").hide();
	$("#loadingdiv").show();
	
	$.ajax({
		
		url: "/"+ app +"/list",
		type:"GET",
		error: function(){
			console.log("error");
		},
		success: function(data){
			
			var $table = $("<table border='1' ></table>"); 
	        $table.append("<tr><th>First Name</th><th>Last Name</th><th>Email</th></tr>");
	        
			for(obj of data.lista){
				$table.append("<tr><td>" + obj.firstName + "</td><td>" + obj.lastName + "</td><td>" + obj.email +"</td></tr>")
					//console.log(obj.firstName);
					//console.log(obj.lastName);
					//console.log(obj.email);
					//console.log("------------------")
			}
			$("body").append($table);
		}
	});
	
}



















