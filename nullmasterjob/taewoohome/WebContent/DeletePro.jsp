<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "web.login.dao.MemberDAO" %>
<%@ include file="/view/color.jsp"%>
<html>
<head>
<title>ȸ��Ż��</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<%
    String id = (String)session.getAttribute("loginID");
	String pw  = request.getParameter("pw");
	
	MemberDAO manager = MemberDAO.getInstance();
    int check = manager.deleteMember(id,pw);
	
	if(check==1){
		session.invalidate();
%>


<body onload="begin()">
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
