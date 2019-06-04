<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.member.dao.MemberDAO" %>
<%@ page import="web.member.vo.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<%
  String id = (String)session.getAttribute("loginID");

  MemberDAO dao = MemberDAO.getInstance();
  MemberVO vo = dao.getMember(id);
%>
<script language="javascript">
function checkForm(){
	
	var regInt= /^[0-9]*$/;
	var regPw= /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/
	var c = document.my;
	
	
		if(!regPw.test(c.pw.value)){
			   alert("비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 8~16자를 입력해주세요");
			   c.pw.focus();
			   return false;
		   }
 
		if(!regInt.test(c.age.value)){
			alert("나이는 숫자로만입력해주세요");
			c.age.focus();
			return false;
		}

	
</script>
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
</head>
<body>
   <jsp:include page="/menu/menu.jsp" />
   <div class="form-group" align="center">
     <h1>회원정보</h1>
     <form action="modifyPro.jsp" method="post" onsubmit="return checkForm();" >
        <div class="col-sm-4">
         <div class="form-group row">
          <label class="col-sm-1 col-form-label"> Email </label>
          <input class="form-control ml-2 mx-2" type="text" name="" value="<%=vo.getEmail_id() %>" />
        </div>
        <div class="mb-2 my-2">
        <small id="emailHelp" class="form-text text-muted">Email은수정이불가능합니다</small>
      </div>
        <div class="form-group row">
          <label class="col-sm-1 col-form-label"> Password </label>
          <input class="form-control ml-2 mx-2" type="password" name="pw" />
        </div>
        <div class="form-group row">
          <label class="col-sm-1 col-form-label"> Name </label>
          <input class="form-control ml-2 mx-2" type="text" name="name" value="<%=vo.getName()%>"/>
        </div>
      <div class="form-group row">
        <label class="col-sm-1 col-form-label">SEX</label>
         <select class="custom-select col-sm-4" name="sex" value="<%=vo.getSex()%>">
           <option></option>
           <option>남자</option>
           <option>여자</option>
         </select>
      </div>
        <div class="form-group row">
        <label class="col-sm-1 col-form-label">AGE</label>
        <input type="age" class="form-control ml-2 mx-2" name="age" value="<%=vo.getAge()%>">
      </div>
        <div class="form-group row">
          <label class="col-sm-1 col-form-label"> Tel </label>
          <input class="form-control ml-2 mx-2" type="text" name="tel" value="<%=vo.getTel()%>"/>
        </div>
         </div>
          <div align="center">
      <div class="form-group">
      <input type="submit" class="btn btn-primary" value="정보수정">
      <input type="button" class="btn btn-primary" value="회원탈퇴" onclick="javascript:window.location='deletemember.jsp'">
     <input type="button" class="btn btn-primary" value="뒤로가기" onclick="javascript:window.location='loginmain.jsp'"> 
      </div>
      </div>
     </form>
   </div>
</body>
</html>