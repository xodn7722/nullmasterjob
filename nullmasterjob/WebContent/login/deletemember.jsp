<%@ page language="java" contentType="text/html; charset=euc-kr"%>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>�α���</title>
   <script language="javascript">
     
       function begin(){
         document.myform.pw.focus();
       }

       function checkIt(){
		  if(!document.myform.pw.value){
           alert("��й�ȣ�� �Է����� �����̽��ϴ�.");
           document.myform.passwd.focus();
           return false;
         }
	   }   
    
   </script>
</head>
<body onload="begin()">
	<jsp:include page="/menu/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">ȸ��Ż���Ͻðڽ��ϱ�?</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			
		</div>
		<div class="col-md-4">
		<form name="myform" action="deletememberPro.jsp" method="post" onSubmit="return checkIt()">

  <div></div>
    <TD bgcolor="">
	 <b>��й�ȣ�� Ȯ�����ּ���</b>
	 </TD>
  </div>
  <div>
    <TD >��й�ȣ</TD>
    <TD >
      <INPUT type="password" name="pw"  >
   </TD>
   </TR>
   </div>
   <div>
   <br/>
  <TR>
    <TD>
      <INPUT type="submit" value="ȸ��Ż��"> 
      <input type="button" value="��  ��" onclick="javascript:window.location='loginmain.jsp'">
    </TD>
  </TR>
  </div>
</form>
		</div>
		<hr>
	</div>

</body>
</html>