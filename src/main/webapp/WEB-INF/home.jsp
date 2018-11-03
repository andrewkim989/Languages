<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Languages Dashboard</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	
	<style>
		#wrapper {
			background-color: lightgrey;
			padding-top: 15px;
			padding-left: 40px;
			padding-bottom: 40px;
		}
		h1 {
			text-align: center;
		}
		table {
			border: 1px solid black;
			border-collapse: collapse;
			margin: 20px;
			margin-left: 50px; 
			margin-bottom: 30px;
		}
		th {
			text-align: left;
			border: 1px solid black;
			border-collapse: collapse;
			padding: 5px;
			padding-left: 10px;
			padding-right: 150px;
			background-color: lightgreen;
			font-size: 18px;
		}
		tr td {
			border: 1px solid black;
			border-collapse: collapse;
			padding: 10px;
			background-color: rgb(237, 241, 248);
			font-size: 18px;
		}
		#add {
			padding-bottom: 40px;
			margin-left: 400px;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<h1>All Languages</h1>
		<a href = "/languages/new">Add New Language</a>
		<table>
		    <thead>
		        <tr>
		            <th>Name</th>
		            <th>Creator</th>
		            <th>Version</th>
		            <th>Action</th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:forEach items = "${languages}" var = "l">
		        <tr>
		            <td><a href = "/languages/${l.id}"><c:out value = "${l.name}"/></a></td>
		            <td><c:out value = "${l.creator}"/></td>
		            <td><c:out value = "${l.currentVersion}"/></td>
		            <td><a href = "/languages/${l.id}/edit">Edit</a>
		            <form action="/languages/${l.id}/delete" method ="post">
					    <input type = "hidden" name = "_method" value = "delete">
					    <input type = "submit" value = "Delete">
					</form></td>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
	</div>
</body>
</html>