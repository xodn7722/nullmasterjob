<%@page import="java.net.URLEncoder" %>
<%@page import="java.io.FileInputStream" %>
<%@page import="java.io.File" %>
<%@page language="java" contentType="text/html; charset=UTF-8" %>
 

<%	request.setCharacterEncoding("UTF-8");
	String fileName =request.getParameter("name");
	
	String savePath="//resources//file";
	ServletContext context = getServletContext();
	
	String sDownPath = context.getRealPath(savePath);
	String sFilePath = sDownPath+"\\"+ fileName;
	
	File oFile = new File(sFilePath);
	FileInputStream in = new FileInputStream(oFile);
	String sMimeType = getServletContext().getMimeType(sFilePath);
	
	byte[] b = new byte[5*1024*1024];

	
	if(sMimeType==null){
		sMimeType ="application.octec-stream";
	}
	
	response.setContentType(sMimeType);
	
	String A = new String(fileName.getBytes("euc-kr"),"8859_1");
	String B = "UTF-8";
	String sEncoding = URLEncoder.encode(A,B);
	
	String AA="Content-Disposition";
	String BB="attachment; filename="+sEncoding;
	response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileName, "utf-8") + ";");
	
	ServletOutputStream out2 = response.getOutputStream();
	
	int numRead=0;
	
	while((numRead=in.read(b,0,b.length)) != -1){
		out2.write(b,0,numRead);
	}
	out2.flush();
	out2.close();
	in.close();
 %>