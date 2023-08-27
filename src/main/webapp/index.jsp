<%@page import="com.bean.Bean"%>
<%@page import="java.util.List"%>
<%@page import="com.Dao.TodoDao"%>
<%@page import="com.database.DBconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ToDo Webapp</title>
<%@include file="component/css.jsp"%>

<style type="text/css">
.table tr, th, td {
	border: 2px solid black;
	border-top: 2px solid black;
	border-bottom: 2px solid black !important;
}
</style>

</head>

<body>
	<%@page import="java.sql.*"%>
	<%@include file="component/navbar.jsp"%>
	<div class="container">
		<div class="card">
			<div class="card-header">
				<h1 class="text-center">ToDo List</h1>
			</div>
			<div class="card-body">
				<table class="table table-striped">
					<thead class="bg-success text-white">
						<tr>
							<th scope="col">No</th>
							<th scope="col">Task</th>
							<th scope="col">Status</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						TodoDao dao = new TodoDao(DBconnection.getconn());
						List<Bean> tbn = dao.getTodo();
						for (Bean bn : tbn) {
						%>
						<tr>
							<th scope="row"><%=bn.getId()%></th>
							<td><%=bn.getTask()%></td>
							<td><%=bn.getStatus()%></td>
							<td><a href="edit.jsp?id=<%=bn.getId()%>"
								class="btn btn-sm btn-success">Edit</a>
						 		<a href="Dlt?id=<%=bn.getId()%>" 
						 		class="btn btn-sm btn-danger">Delete</a></td>
						</tr>

						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>