GET: $(document).ready(
		function() {

			// GET REQUEST
			$("#getAllCustomers").click(function(event) {
				event.preventDefault();
				ajaxGet();
			});

			// DO GET
			function ajaxGet() {
				$.ajax({
					type : "GET",
					url : "list",
					success : function(result) {
						if (result.status == "success") {
							$('#getResultDiv ul').empty();
							var custList = "";
							$.each(result.data,
									function(i, customer) {
										var firstName = "First Name: " + customer.fistName+ "<br>";
										var firstName = "Last Name: " + customer.lastName+ "<br>";
										var firstName = "Email: " + customer.email+ "<br>";
										$('#getResultDiv .list-group').append(user)
									});
							console.log("Success: ", result);
						} else {
							$("#getResultDiv").html("<strong>Error</strong>");
							console.log("Fail: ", result);
						}
					},
					error : function(e) {
						$("#getResultDiv").html("<strong>Error</strong>");
						console.log("ERROR: ", e);
					}
				});
			}
		})