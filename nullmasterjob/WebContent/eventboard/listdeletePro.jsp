<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "board.bean.vd.*" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  String passwd = request.getParameter("passwd");

  BoardDBBean dbPro = BoardDBBean.getInstance();
  int check = dbPro.deleteArticle(num, passwd);

  if(check==1 ){
%>
	  <meta http-equiv="Refresh" content="0;url=event_board.jsp?pageNum=<%=pageNum%>" >
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