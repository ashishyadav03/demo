<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.fasterxml.jackson.core.type.TypeReference"%>
<%@page import="com.springrest.library.model.Books"%>
<%@page import="java.util.List"%>
 
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
  <style type="text/css">
  body{
  background-color:#E2ECF8;
  }
  table{
  text-align:center;
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
  .head2{
  display:flex;
  align-items:center;
    margin-bottom:10px;
    height:80px;
  
  }
  a:link,a:visited ,a:hover, a:active {
   
  margin-left:383px;
  background-color: #1D6DC9	;
  color: white;
  decoration: none
  border: 2px solid #1D6DC9;
  border-radius: 5px;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}
h1{
margin-left:35%;
}
h3{
  margin-left:130px;
}
h2{
margin-left:40%;
}
  </style>
<title>Book Management</title>
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
	<h2>Books Listing</h2>
	<a href="/showNewBookForm">Add Book</a>
	</div>
	<div class="container mt-3">
	<table class="table table-bordered border-dark border-primary align-middle">
		<thead>
			<tr>
				<th>Book Code</th>
				<th>Book Name</th>
				<th>Author</th>
				<th>Added On</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<tr>

			</tr>
			<%
				Object obj = request.getAttribute("booklist");
				ObjectMapper mapper = new ObjectMapper();

				List<Books> booklist = mapper.convertValue(obj, new TypeReference<List<Books>>() {
				});
				if (booklist != null) {
					for (Books book : booklist) {
			%>

			<tr>
				<td>
					<%
						out.print(book.getBookCode());
					%>
				</td>
				<td>
					<%
						out.print(book.getBookName());
					%>
				</td>
				<td>
					<%
						out.print(book.getAuthor());
					%>
				</td>
				<td>
					<%
						out.print(book.getAddedOn());
					%>
				</td>
				<td><form action="change" method="post">
						<input type="hidden"  name="code" value="<%=book.getBookCode()%>" />
						<input type="submit" class="btn btn-success" name="modify" value="update"> &nbsp; 
						<input type="submit" class="btn btn-danger" name="modify" value="delete">
					</form></td>

			</tr>
			<%
			}
			}
		%>
		</tbody>
	</table>
	</div>
</body>
</html>