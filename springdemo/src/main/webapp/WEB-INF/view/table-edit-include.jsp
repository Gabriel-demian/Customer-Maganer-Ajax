
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<!-- <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Edit Customer</h4>
			</div> -->
			<div align="center" id="wrapper">
				<div id="header">
					<h2>Customer Relationship Manager</h2>
				</div>
			</div>
				<div align="center" id="container">
					<h3>Edit Customer</h3>
					
					<table>
						<tbody>
							<tr>
								<td><label>First Name:</label></td>
								<td><input id="modalFirstName" type="text" /></td>
							</tr>
							<tr><td colspan="2"><div id="name_error"></div></td></tr>
							
							<tr>
								<td><label>Last Name:</label></td>
								<td><input id="modalLastName" type="text" /></td>
							</tr>
							<tr><td colspan="2"><div id="lastname_error"></div></td></tr>
							
							<tr>
								<td><label>Email:</label></td>
								<td><input id="modalEmail" type="email" /></td>
							</tr>
							<tr>
								<td colspan="2"><div  id="email_error"></div></td></tr>
							<tr>
								<td><label></label></td>
								<td align="center"><button class="btn btn-primary"
										onclick="saveOrUpdateModal()" >Save</button></td>
							</tr>
						</tbody>
					</table>
				</div>
				<input type="hidden" id="modalId" type="text" />
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
		</div>
	</div>
</div>


