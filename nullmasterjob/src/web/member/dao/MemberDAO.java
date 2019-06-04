package web.member.dao;
import java.sql.Connection;




import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.sql.DataSource;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;

import web.member.vo.MemberVO;

public class MemberDAO {

	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	private MemberDAO() {}
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public Connection getConnection() { //db����
		try {
			Context ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:comp/env");
			DataSource ds = (DataSource)env.lookup("jdbc/xe");
			conn = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
		
	}
	
	public boolean loginCheck(String email_id,String pw) { //�α��� db���� Ȯ��
    	boolean result = false;
    	try {
    		conn = getConnection();
    		String sql = "select * from member where email_id=? and pw=?";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, email_id);
    		pstmt.setString(2, pw);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			result = true;
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		if(rs != null) {try {rs.close();}catch(SQLException s) {}}
    		if(pstmt !=null) {try {pstmt.close();}catch(SQLException s) {}}
    		if(conn != null) {try {conn.close();}catch(SQLException s) {}}
    	}
    	return result;
    }
	public void insertMember(MemberVO vo) { //ȸ���������� vo�� �Է�
    	try {
    		conn = getConnection();
    		String sql = "insert into member values(?,?,?,?,?,?,?,?)";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, vo.getEmail_id());
    		pstmt.setString(2, vo.getPw());
    		pstmt.setString(3, vo.getName());
    		pstmt.setString(4, vo.getTel());
    		pstmt.setInt(5, vo.getAge());
    		pstmt.setString(6, vo.getSex());
    		pstmt.setInt(7, vo.getMem_level());
    		pstmt.setInt(8, vo.getUserEmailChecked());
    		pstmt.executeUpdate();
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		if(pstmt != null) {try{pstmt.close();}catch(SQLException s) {}}
    		if(conn != null) {try {conn.close();}catch(SQLException s) {}}
    	}	
    }
	
	public ArrayList<MemberVO> getAllMember(){ //ȸ��������������Ʈ���߰�
		ArrayList<MemberVO> list = null;
		try {
			conn = getConnection();
			String sql = "select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<MemberVO>();
			while(rs.next()){
				MemberVO vo = new MemberVO();
				vo.setEmail_id(rs.getString("email_id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setTel(rs.getString("tel"));
				vo.setAge(rs.getInt("age"));
				vo.setSex(rs.getString("sex"));
				vo.setMem_level(rs.getInt("mem_level"));
				list.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException s) {}}
    		if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
    		if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
		return list;
		
	}
	
	public int confirmId(String id)throws Exception{ //���̵��ߺ�Ȯ��
    	int x=-1;
    	try {
    		conn = getConnection();
    		pstmt = conn.prepareStatement("select email_id from member where email_id=?");
    		pstmt.setString(1, id);
    		
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			x = 1;
    		}else {
    			x= -1;
    		}
    				
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		if(rs!=null) try {rs.close();} catch(SQLException e) {}
    		if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
    		if(conn!=null) try {conn.close();} catch(SQLException e) {}
    	}
    	return x;
    	
    }
	
	  public MemberVO getMember(String id){ //ȸ������ ��������
	    	MemberVO vo =null;
	    	try {
	    		conn = getConnection();
	    		String sql = "select * from member where email_id=?";
	    		pstmt = conn.prepareStatement(sql);
	    		pstmt.setString(1, id);
	    		rs = pstmt.executeQuery();
	    		
	    		rs.next();
	    			vo = new MemberVO();
	    			vo.setEmail_id(rs.getString("email_id"));
					vo.setPw(rs.getString("pw"));
					vo.setName(rs.getString("name"));
					vo.setTel(rs.getString("tel"));
					vo.setAge(rs.getInt("age"));
					vo.setSex(rs.getString("sex"));
					vo.setMem_level(rs.getInt("mem_level"));
	    		
	    		
	    	}catch(Exception e) {
	    		e.printStackTrace();
	    	}finally {
	    		if(rs != null) {try {rs.close();}catch(SQLException s) {}}
	    		if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
	    		if(conn != null) {try {conn.close();}catch(SQLException s) {}}
	    	}
	    	return vo;
	    
	    			
	    }
	    
	    public void updateMember(MemberVO vo) throws SQLException{ //ȸ������������Ʈ
	    	
	    	Connection conn = null;
	    	PreparedStatement pstmt = null;
	    	
	    	try {
	            conn = getConnection();
	            pstmt = conn.prepareStatement(
	            "update member set email_id=?,pw=?,name=?,tel=?,age=?,sex=?,mem_level=?"+
	            "where email_id=?");
	            pstmt.setString(1, vo.getEmail_id());
	    		pstmt.setString(2, vo.getPw());
	    		pstmt.setString(3, vo.getName());
	    		pstmt.setString(4, vo.getTel());
	    		pstmt.setInt(5, vo.getAge());
	    		pstmt.setString(6, vo.getSex());
	    		pstmt.setInt(7, vo.getMem_level());
	    	    
	    	    pstmt.executeUpdate();
	    	}catch(Exception ex){
	    		ex.printStackTrace();
	    	}finally {
	    		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	    	}
	    	
	    }
	    
	    @SuppressWarnings("resource")
	    public int deleteMember(String id, String pw) //ȸ����������
	    	    throws Exception {
	    	        Connection conn = null;
	    	        PreparedStatement pstmt = null;
	    	        ResultSet rs= null;
	    	        String dbpasswd="";
	    	        int x=-1;
	    	        try {
	    				conn = getConnection();

	    	            pstmt = conn.prepareStatement(
	    	            	"select pw from member where email_id = ?");
	    	            pstmt.setString(1, id);
	    	            rs = pstmt.executeQuery();
	    	            
	    				if(rs.next()){
	    					dbpasswd= rs.getString("pw"); 
	    					if(dbpasswd.equals(pw)){
	    						pstmt = conn.prepareStatement(
	    	            	      "delete from member where email_id=?");
	    	                    pstmt.setString(1, id);
	    	                    pstmt.executeUpdate();
	    						x= 1; //ȸ��Ż�� ����
	    					}else
	    						x= 0; //��й�ȣ Ʋ��
	    				}
	    	        } catch(Exception ex) {
	    	            ex.printStackTrace();
	    	        } finally {
	    	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	    	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	    	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	    	        }
	    			return x;
	    	    }
	    
	    
	    
	    public String getUserEmail(String userID) {

			String SQL = "SELECT email_id FROM member WHERE email_id = ?";

			try {
				 conn = getConnection();
				 pstmt = conn.prepareStatement(SQL);

				pstmt.setString(1, userID);

				rs = pstmt.executeQuery();

				while(rs.next()) {

					return rs.getString(1); // �̸��� �ּ� ��ȯ

				}

			} catch (SQLException e) {

				e.printStackTrace();

			}

			return null; // �����ͺ��̽� ����

		}

		

		public int getUserEmailChecked(String userID) {

			String SQL = "SELECT userEmailChecked FROM member WHERE email_id = ?";

			try {

				 conn = getConnection();
				 pstmt = conn.prepareStatement(SQL);

				pstmt.setString(1, userID);

				rs = pstmt.executeQuery();

				while(rs.next()) {

					return rs.getInt(1); // �̸��� ��� ���� ��ȯ

				}

			} catch (SQLException e) {

				e.printStackTrace();

			}

			return 0; // �����ͺ��̽� ����

		}

		

		public int setUserEmailChecked(String userID) {

			String SQL = "UPDATE member SET userEmailChecked = 1 WHERE email_id = ?";

			try {

				 conn = getConnection();
				 pstmt = conn.prepareStatement(SQL);

				pstmt.setString(1, userID);

				pstmt.executeUpdate();

				return 1; // �̸��� ��� ���� ����

			} catch (SQLException e) {

				e.printStackTrace();

			}

			return 0; // �̸��� ��� ���� ����

		}
	   
}