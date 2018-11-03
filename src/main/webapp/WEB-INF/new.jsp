<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Create language</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<style>
		#wrapper {
			padding-left: 35px;
			height: 630px;
			background-color: lightgrey;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<h1>Create Language</h1>
		<form:form action = "/languages/create" method = "post" modelAttribute = "language">
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
			        <form:input type = "number" step = "0.1" path = "currentVersion"/>
			    </p>    
			    <input type = "submit" value = "Submit"/>
			</form:form>
	</div>
</body>
</html>