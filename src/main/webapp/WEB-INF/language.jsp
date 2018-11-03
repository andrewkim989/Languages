<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>${languages.name}</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<style>
		#wrapper {
			background-color: lightgrey;
			padding-top: 40px;
			padding-left: 50px;
			padding-bottom: 30px;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<h2>Language Index</h2>
		<a href = "/languages">Dashboard</a>
		<br><br>
		Name: <c:out value = "${languages.name}"/>
		<br><br>
		Creator: <c:out value = "${languages.creator}"/>
		<br><br>
		Version: <c:out value = "${languages.currentVersion}"/>
		<br><br>
		<a href = "/languages/${languages.id}/edit">Edit</a>
		<br><br>
		<form action="/languages/${languages.id}/delete" method ="post">
			<input type = "hidden" name = "_method" value = "delete">
			<input type = "submit" value = "Delete">
		</form>
	</div>
</body>
</html>