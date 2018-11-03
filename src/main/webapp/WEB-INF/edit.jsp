<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Edit Language</title>
	<link rel = "stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<style>
		#wrapper {
			padding-left: 15px;
			background-color: lightgrey;
			padding-bottom: 30px;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<h1>Edit Language</h1>
		<a href = "/languages">Dashboard</a>
		<br>
		<form action="/languages/${languages.id}/delete" method ="post">
			<input type = "hidden" name = "_method" value = "delete">
			<input type = "submit" value = "Delete">
		</form>
		<form:form action = "/languages/${languages.id}/edit/process" method = "post" modelAttribute = "languages">
		    <input type = "hidden" name = "_method" value = "put">
		    <p>
		    	<form:errors path = "name"/>
		    	<br>
		        <form:label path = "name">Name</form:label>
		        <form:input path = "name"/>
		    </p>
		    <p>
		    	<form:errors path = "creator"/>
		    	<br>
		    	<form:label path = "creator">Creator</form:label>
		    	<form:input path = "creator"/>
		    </p>
		    <p>
		    	<form:errors path = "currentVersion"/>
		    	<br>
		    	<form:label path = "currentVersion">Current Version</form:label>
		    	<form:input type = "text"  step = "0.1" path = "currentVersion"/>
		    </p>   
		    <input type = "submit" value = "Submit"/>
		</form:form>
	</div>
</body>
</html>