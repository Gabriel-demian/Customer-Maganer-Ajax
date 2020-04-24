function Validador() {

	var firstName = document.forms['RegForm']['firstName'];
	var lastName = document.forms['RegForm']['lastName'];
	var email = document.forms['RegForm']['email'];

	var name_error = document.getElementById('name_error');
	var lastname_error = document.getElementById('lastname_error');
	var email_error = document.getElementById('email_error');

	//firstName.addEventListener('blur', nameVerify, true);
	//lastName.addEventListener('blur', lastNameVerify, true);
	//email.addEventListener('blur', emailVerify, true);

	var tieneError = false;

	// validate firstName
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
			//firstName.focus();
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
			//firstName.focus();
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
		//email.focus();
		tieneError = true;
	} else {
		email.style.border = "1px solid #5e6e66";
		document.getElementById('email').style.color = "green";
		email_error.innerHTML = "";
	}

	return !tieneError;
}

/*
function nameVerify() {
	if (firstName.value != "" || firstName.value.trim() == "") {
		firstName.style.border = "1px solid #5e6e66";
		document.getElementById('firstName').style.color = "#5e6e66";
		name_error.innerHTML = "";
		return true;
	}
}
function lastNameVerify() {
	if (lastName.value != "" || lastName.value.trim() == "") {
		lastName.style.border = "1px solid #5e6e66";
		document.getElementById('lastName').style.color = "#5e6e66";
		name_error.innerHTML = "";
		return true;
	}
}
function emailVerify() {
	if (email.value != "" || email.value.trim() == "") {
		email.style.border = "1px solid #5e6e66";
		document.getElementById('email').style.color = "#5e6e66";
		email_error.innerHTML = "";
		return true;
	}
}*/
