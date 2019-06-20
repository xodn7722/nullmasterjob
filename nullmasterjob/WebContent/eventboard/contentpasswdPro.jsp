<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "board.bean.vd.BoardDBBean" %>
<%@ page import = "board.bean.vd.BoardDataBean" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<html>
<head>

</head>
<% request.setCharacterEncoding("UTF-8");%>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  String passwd = request.getParameter("passwd");
  
  BoardDBBean dbPro = BoardDBBean.getInstance();
  BoardDataBean article =  dbPro.getArticle(num);
  String pp = article.getPasswd();
  if(pp.equals(passwd)){
  

   SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");

   try{
    
	  int ref=article.getRef();
	  int re_step=article.getRe_step();
	  int re_level=article.getRe_level();
%>
<body>
<jsp:include page="/menu/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">�Խ���</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			
		</div>
		<div class="col-md-4">
		
		 <center><b>�۳��� ����</b>
<br>
	<form>
<table width="700" border="1" cellspacing="0" cellpadding="0"  align="center">  
  <tr height="30">
    <td align="center" width="125" bgcolor="#EAEAEA">�۹�ȣ</td>
    <td align="center" width="125" align="center">
	     <%=article.getNum()%></td>
    <td align="center" width="125" bgcolor="#EAEAEA">��ȸ��</td>
    <td align="center" width="125" align="center">
	     <%=article.getReadcount()%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="#EAEAEA">�ۼ���</td>
    <td align="center" width="125" align="center">
	     <%=article.getWriter()%></td>
    <td align="center" width="125"  bgcolor="#EAEAEA">�ۼ���</td>
    <td align="center" width="125" align="center">
	     <%= sdf.format(article.getReg_date())%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="#EAEAEA">������</td>
    <td align="center" width="375" align="center" colspan="3">
	     <%=article.getSubject()%></td>
  </tr>
  <tr height="300">
    <td align="center" width="125" bgcolor="#EAEAEA">�۳���</td>
    <td align="left" width="375" colspan="3"><pre><%=article.getContent()%></pre></td>
  </tr>
  <tr height="30">      
    <td colspan="4" align="right" bgcolor="#EAEAEA" > 
	  <%  String lid = (String)session.getAttribute("loginID");
	  if(lid != null){ 
		 if(article.getWriter().equals(lid)){%>  
	  <input type="button" value="�ۼ���" 
       onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	   <%if(article.getPasswd() == null){ %>
	   <input type="button" value="�ۻ���" 
       onclick="document.location.href='listdeletePro.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	   <%}else{ %>
	  <input type="button" value="�ۻ���" 
       onclick="document.location.href='listdeleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	   <%} 
	   }%>
	   <%if(lid.equals("taewoo")){ %>
      <input type="button" value="��۾���" 
       onclick="document.location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	   <%}} %>
       <input type="button" value="�۸��" 
       onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
    </td>
  </tr>
</table>    
<%
 }catch(Exception e){} 
 %>
</form>
		</div>
		<hr>
	</div>

</body>

<% }else{%>
       <script language="JavaScript">      
       <!--      
         alert("��й�ȣ�� ���� �ʽ��ϴ�");
         history.go(-1);
       -->
      </script>
<%
    }
 %>