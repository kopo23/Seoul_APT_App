<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.ac.kopo.kopo23.domain.*"%>
<%@ page import="kr.ac.kopo.kopo23.service.*"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href = "App.css" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
	<div class="loginBox">
	   <br>
	   <img src= "App_logo.png" width="100px" height="100px">
	   <h2>Welcome, User  !</h2>
	   <br>
	   <input type="text" readonly value => 
	   
	   <br>
	   <br>
	   <div class="loginBox1" onClick="location.href='App_select.jsp'"><h4>Search</h4></div>
	   <div class="loginBox2" onClick="location.href=''"><h4>MyMenu</h4></div>
	   <div class="loginBox3" onClick="location.href='http://192.168.23.87:8080/Login/main.jsp'"><h4>Main</h4></div>
   </div>

</body>
</html>