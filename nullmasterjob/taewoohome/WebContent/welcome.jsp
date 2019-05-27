<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>
	 <jsp:include page="menu.jsp" />
	<%!String greeting = "Welcome to Web Shopping Mall";
	String tagline = "Welcome to Web Market!";%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>	
	<div class="container">
		<div class="text-center">
			<h3>
				<%=tagline%>
			</h3>
			<%
			   Date day = new Date();
			   int hour = day.getHours();
			   int minute = day.getMinutes();
			   int second = day.getSeconds();
			   String ap="";
			   if(hour /12 == 0){
				   ap = "AM";
			   }else{
				   ap = "PM";
				   hour -=12;
				   }
			 %>
			 <%="현재 접속 시각 : "+hour+":"+minute+":"+second+""+ap %>
		</div>
		<hr>
	</div>	
    <jsp:include page="footer.jsp" />
   
</body>
</html>