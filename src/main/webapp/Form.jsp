<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Task</title>
<%@include file="component/css.jsp"%>
</head>
<body style="background-color: #d4d3d4;">
	<%@include file="component/navbar.jsp"%>

	<div class="container" >
		<div class="row p-4">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
					<h3 class="text-center text-success">Add Task</h3>
						<form action="Todoadd" method="post"> <!--    -->
							<div class="form-group">
								<label for="exampleInputEmail1">Task</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter your task" name="task">
							</div>
							<div class="form-group ">
								<label for="inputState">Status</label> <select id="inputState"
									class="form-control" name="status">
									<option selected>Select..</option>
									<option value="Complete">Complete</option>
									<option value="Pending">Pending</option>
								</select>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>