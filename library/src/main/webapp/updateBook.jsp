<%@page import="com.springrest.library.model.Authors"%>
<%@page import="java.util.List"%>
<%@page import="com.fasterxml.jackson.core.type.TypeReference"%>
<%@page import="com.springrest.library.model.Books"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Edit Book Details</title>
<style>
body{
  background-color:#E2ECF8;
  }
 .head1{
  display:flex;
  align-items:center;
  height:100px;
  border-bottom:1.5px solid #B4D4F8;
  }
  .logout{
  margin-left:15px;
  }
  h1{
margin-left:35%;
}
h3{
  margin-left:130px;
}
 a:link,a:visited ,a:hover, a:active {
   
  margin-left:40px;
  background-color: #D23D42	;
  color: white;
  decoration: none
  border: 2px solid #D23D42;
  border-radius: 5px;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}
.head2{
  display:flex;
  align-items:center;
    margin-bottom:10px;
    height:80px;
  
  }
  h2{
margin-left:40%;
}
.table{
width:60%;
height:300px;
border:1px solid lightgrey;
margin :auto;
}
.l1{
margin-left:50px;
margin-right:90px;
margin-top:20px;
 }
 .i1{
 border:none;
  background-color:#E2ECF8;
 }
.l2{
margin-left:50px;
margin-right:85px;
}
.l3{
margin-left:50px;
margin-right:120px;
}
.l4{
margin-left:50px;
margin-right:95px;
}
.i4{
 border:none;
  background-color:#E2ECF8;
 }
button{
margin-left:50px;
color:red;
}
</style>
</head>
<body>
<div class="head1">
<h1>Book Management</h1>
	<h3>Welcome ${user.getUsername()}</h3>
	<div class="logout">
	<form action="logout" class="lout">
		<input type="submit" class="btn btn-danger" value="Logout">
	</form>
	</div>
	</div>
	<div class="head2">
	<h2>Edit Book Details</h2>
	</div>
	<div class="table">
		<form action="/saveBook" method="POST">
			<%
				Object obj = request.getAttribute("book");
				ObjectMapper mapper = new ObjectMapper();

				Books book = mapper.convertValue(obj, new TypeReference<Books>() {
				});

				Object obj1 = request.getAttribute("authorsList");
				ObjectMapper mapper1 = new ObjectMapper();

				List<Authors> authorsList = mapper1.convertValue(obj1, new TypeReference<List<Authors>>() {
				});
			%>

			<label class="l1">Book Code</label> <input type="text" class="i1" name="bookCode"
				value="<%=book.getBookCode()%>" readonly /><br /> <br /><label class="l2">Book
				Name</label> <input type="text" name="bookName"
				value="<%=book.getBookName()%>" /><br /><br /> <label class="l3">Author</label> <select
				name="author">
				<option value="<%=book.getAuthor()%>" selected hidden=true>
					<%
						out.print(book.getAuthor());
					%>
				</option>
				<%
					if (authorsList != null) {
						for (Authors author : authorsList) {
				%>
				<option value="<%=author.getAuthorName()%>">
					<%
						out.print(author.getAuthorName());
					%>
				</option>
				<%
					}
					}
				%>
			</select> <br /> <br /><label class="l4">Added On</label> <input type="text" class="i4" name="addedOn"
				value="<%=book.getAddedOn()%>" readonly /><br /><br />
			<button type="submit" class="btn btn-primary">Submit</button>
				<a href="/back">Cancel</a>

		</form>
		
	</div>

</body>
</html>