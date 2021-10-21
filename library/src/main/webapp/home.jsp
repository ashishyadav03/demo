<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 
<title>Login</title>
<style>
body{
display:flex;
justify-content: center;
align-items: center;
 background-color:#E2ECF8;
}
 fieldset{
  width:400px;
  height:160px;
  margin-top:40%;
  align-item:center;
  border-color:#D2D8DE;
 }
legend{
color:#2277D9;
font-size: 20px; 
}
 fieldset div {

margin-top:25px;
 
 }
 .l1{
 margin:40px 60px  10px 50px;
  
 }
 .l2{
 margin:40px 50px  10px 50px;
  
 }
 .l3{
 margin-left:175px;
  width:70px;
height:35px;
color:white;
 background-color:#2277D9;
 border:none;
 border-radius:5px;
 }
 
 
</style>
</head>
<body>
<div class="form">
	<form action="/login" method="post" >
		<fieldset>
			<legend>Login</legend>
<div class="f1">
			<label class="l1">User ID :</label> <input type="text" name="username" required ><br><br>

			<label class="l2">Password :</label> <input type="text" name="password" required><br><br>

 
			<input type="submit" class="l3" value="Login"></div>
			 
		</fieldset>
	</form>
	</div>
	
	


</body>
</html>