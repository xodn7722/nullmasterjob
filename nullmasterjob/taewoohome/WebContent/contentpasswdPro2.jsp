<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "board.BoardDBBean" %>
<%@ page import = "board.BoardDataBean" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<html>
<head>
<title>ȸ��Ż��</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<%
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
String passwd = request.getParameter("passwd");

	BoardDBBean dbPro = BoardDBBean.getInstance();
    int check = dbPro.viewArticle(num,passwd);
	
	if(check==1){%>

<body >
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">ȸ��Ż�𰡿Ϸ�Ǿ����ϴ�</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			
		</div>
		<div class="col-md-4">
			<script>
	     window.location="content.jsp?num=<%=num%>&pageNum=<%=pageNum%>"
	        </script>
		<form method="post" action="loginmain.jsp" name="userinput" >
<table>
  <tr > 
    <td>
	 <b>ȸ�������� �����Ǿ����ϴ�.</b>
	</td>
  </tr>
 
  <tr>
    <td> 
      <input type="submit" value="Ȯ��">
    </td>
  </tr>
</table>
</form>
<%}else {%>
	<script> 
	  alert("��й�ȣ�� ���� �ʽ��ϴ�.");
      history.go(-1);
	</script>
<%}%>
		
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
