<%@page import="com.bean.Bean"%>
<%@page import="com.database.DBconnection"%>
<%@page import="com.Dao.TodoDao"%>
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

	<div class="container">
		<div class="row p-4">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Add Task</h3>
						
						<%
						int id = Integer.parseInt(request.getParameter("id"));

						TodoDao tdo = new TodoDao(DBconnection.getconn());
						Bean bn = tdo.getid(id);
						%>
						<form action="Updatetask" method="post"><!--    -->
						<input type="hidden" value="<%=bn.getId()%>" name="id" >
							
							<div class="form-group">
								<label for="exampleInputEmail1">Task</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter your task"
									name="task" value="<%=bn.getTask()%>">
							</div>
							<div class="form-group ">
								<label for="inputState">Status</label> <select id="inputState"
									class="form-control" name="status">
									<%
									if("Pending".equals(bn.getStatus()))
									{%>
										<option value="Complete">Complete</option>
										<option value="Pending" selected>Pending</option>
									<% }else
									{%>
										<option value="Complete" selected>Complete</option>
										<option value="Pending">Pending</option>
									<%}	
									%>
									</select>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Update</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>