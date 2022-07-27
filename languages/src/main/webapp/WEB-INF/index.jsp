<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  </head>
  <body>
  
  <div class="container m-5">
    <h1>Languages</h1>
    <br>
    
    <table  class="table table-striped table-hover">
  <thead>
    <tr>
      <th scope="col">name</th>
      <th scope="col">creator</th>
      <th scope="col">version</th>
      <th scope="col">show</th>
      <th scope="col">action</th>
      <th scope="col">delete</th>
        
    </tr>
  </thead>
  
  <tbody>
  <c:forEach  items="${allLang}" var="i">
	    <tr>
		      <td><c:out value = "${i.getName()}"/></td>
		      <td><c:out value = "${i.getCreator()}"/></td>
		      <td><c:out value = "${i.getVersion()}"/></td>
		      <td><a href="/languages/${i.id}">show</a></td>
		      <td><a href="/languages/${i.id}/edit">edit</a></td>
		      <td><a href="/languages/${i.id}/delete" class="btn btn-danger">delete</a></td>
	    </tr>
    </c:forEach>
    

  </tbody>
</table>
     </div>
     
     
     <div class="container m-5">

<h1>Add Language </h1>
<form:form action="/languages" method="post" modelAttribute="languages" >
 
	   <div class="mb-3">
	    <label  class="form-label">name</label>
	    <input type="text" class="form-control" name="name">
	    <form:errors path="name" class="text-danger"/>
	  </div>
   
   	   <div class="mb-3">
	    <label  class="form-label">creator</label>
	    <input type="text" class="form-control" name="creator">
	    <form:errors path="creator" class="text-danger"/>
	  </div>
	  <div class="mb-3">
	    <label  class="form-label">version</label>
	    <input type="number" class="form-control" name="version">
	    <form:errors path="version" class="text-danger"/>
	  </div>

    	<input type="submit" value="Submit"/>
</form:form>
 </div>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
  </body>
</html>
    