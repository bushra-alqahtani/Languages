<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  </head>
  <body>
  
  <div class="container m-5">
	<div class="row gx-5">
		<div class="col m-5">
			<h1>Edit Language </h1>
		</div>
		<div class="col m-5">
			<a href="/languages/all" class="btn btn-info">go back</a>
		</div>
	</div>
	
	
	
<form:form action="/languages/${lang.getId()}/edit" method="post" modelAttribute="languages" >
 <input type="hidden" name="_method" value="put">
	   <div class="mb-3">
	    <label  class="form-label">name</label>
	    <input type="text" class="form-control" name="name" value="<c:out value="${lang.getName()}"/>">
	    <form:errors path="name" class="text-danger"/>
	  </div>
   
   
   
   	   <div class="mb-3">
	    <label  class="form-label">creator</label>
	    <input type="text" class="form-control" name="creator" value="<c:out value="${lang.getCreator()}"/>">
	    <form:errors path="creator" class="text-danger"/>
	  </div>
	  
	  
	  
	  <div class="mb-3">
	    <label  class="form-label">version</label>
	    <input type="number" class="form-control" name="version" value="<c:out value="${book.getVersion()}"/>">
	    <form:errors path="version" class="text-danger"/>
	  </div>
	  

    	<input type="submit" value="Submit"/>
</form:form>
 </div>
 </body>
 </html>





    
    
  