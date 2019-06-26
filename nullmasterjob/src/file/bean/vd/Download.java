package file.bean.vd;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Download extends HttpServlet{
	private static Download instance = new Download();
	public static Download getInstance() {
		return instance;
	}
	
	private Download() {}
	
	
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException
	{
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException
	{
		// �� ���ϸ� ��������
		String fileName = request.getParameter("name");
		
		// �� ��� ��������
		String saveDir = this.getServletContext().getRealPath("//resources//file");
		File file = new File(saveDir + "/" + fileName);
		System.out.println("���ϸ� : " + fileName);
		
		
		// �� MIMETYPE �����ϱ�
		String mimeType = getServletContext().getMimeType(file.toString());
		if(mimeType == null)
		{
			response.setContentType("application/octet-stream");
		}
		
		// �� �ٿ�ε�� ���ϸ��� ����
		String downName = null;
		if(request.getHeader("user-agent").indexOf("MSIE") == -1)
		{
			downName = new String(fileName.getBytes("UTF-8"), "8859_1");
		}
		else
		{
			downName = new String(fileName.getBytes("EUC-KR"), "8859_1");
		}
		
		// �� ������ �ٿ�ε��ϵ��� ����
		response.setHeader("Content-Disposition","attachment;filename=\"" + downName + "\";");
		
		// �� ��û�� ������ �о Ŭ���̾�Ʈ������ �����Ѵ�.
		FileInputStream fileInputStream = new FileInputStream(file);
		ServletOutputStream servletOutputStream = response.getOutputStream();
		
		byte b [] = new byte[1024];
		int data = 0;
		
		while((data=(fileInputStream.read(b, 0, b.length))) != -1)
		{
			servletOutputStream.write(b, 0, data);
		}
		
		servletOutputStream.flush();
		servletOutputStream.close();
		fileInputStream.close();
	}
}
