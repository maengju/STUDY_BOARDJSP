package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.bean.BoardDTO;


public class BoardDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource ds;
	
	private static BoardDAO instance;
	
	public static BoardDAO getInstance() {
		if(instance==null) {
			synchronized(BoardDAO.class) {
				instance=new BoardDAO();
			}
		}
		
		return instance;
	}// 싱글톤
	
	
	public BoardDAO() {

		
		try {
			
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}// BoardDAO() 
	
	
	
	public void write(BoardDTO boardDTO) {
		
		String sql = "insert into board(seq,id,name,email,subject,content,ref,logtime)"
				+ " values(seq_board.nextval,?,?,?,?,?,seq_board.nextval,sysdate)";
		
		
		try {
			conn=ds.getConnection();
			pstmt= conn.prepareStatement(sql);//생성
			
			pstmt.setString(1, boardDTO.getId());
			pstmt.setString(2, boardDTO.getName());
			pstmt.setString(3, boardDTO.getEmail());
			pstmt.setString(4, boardDTO.getSubject());
			pstmt.setString(5, boardDTO.getContent());
			
			pstmt.executeUpdate();//실행
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(pstmt !=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}
	
	
	public List<BoardDTO> printList(int startNum, int endNum){
		List<BoardDTO> list= new ArrayList<BoardDTO>();
		String sql = "select * from("
				+ "select rownum rn, tt.*from "
				+ "(select seq,id,name,email,subject,content,ref,lev,step,pseq,reply,hit,"
				+ "to_char(logtime, 'YYYY.MM.DD') as logtime from board order by seq desc) tt"
				+ ") where rn>=? and rn<=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);

			// 실행
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setSeq(rs.getInt("seq"));
				boardDTO.setId(rs.getString("id"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setEmail(rs.getString("email"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setRef(rs.getInt("ref"));
				boardDTO.setLev(rs.getInt("lev"));
				boardDTO.setStep(rs.getInt("step"));
				boardDTO.setPseq(rs.getInt("pseq"));
				boardDTO.setReply(rs.getInt("reply"));
				boardDTO.setHit(rs.getInt("hit"));
				boardDTO.setLogtime(rs.getString("logtime"));

				list.add(boardDTO);

			}
		} catch (SQLException e) {
			e.printStackTrace();
			list = null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return list;
	}
	
	
	public int getTotalA() {
		int totalA = 0;
		String sql = "select count(*) from board";
		
		
		
		try {
			conn= ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			// 실행
			rs = pstmt.executeQuery();

			rs.next();
			totalA = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return totalA;
	}
	
	
	public List<BoardDTO> view(int seq){
		List<BoardDTO> list= new ArrayList<BoardDTO>();
		String sql = "select * from board where seq=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, seq);

			// 실행
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setSeq(rs.getInt("seq"));
				boardDTO.setId(rs.getString("id"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setEmail(rs.getString("email"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setRef(rs.getInt("ref"));
				boardDTO.setLev(rs.getInt("lev"));
				boardDTO.setStep(rs.getInt("step"));
				boardDTO.setPseq(rs.getInt("pseq"));
				boardDTO.setReply(rs.getInt("reply"));
				boardDTO.setHit(rs.getInt("hit"));
				boardDTO.setLogtime(rs.getString("logtime"));

				list.add(boardDTO);

			}
		} catch (SQLException e) {
			e.printStackTrace();
			list = null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return list;
		
	}
	
	
	
	
	
	
	
	
	
}
