package com.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public int reply(String userID, String boardTitle, String boardContent, String boardFile, String boardRealFile,BoardDTO parent) throws SQLException {
		String driver="oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe"; 	
		String userid = "userchat";
		String passwd = "userchat";
		
		Connection con = null;
		
		try {
			
			
			Class.forName(driver);
			System.out.println("드라이버 로딩 성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		con = DriverManager.getConnection(url, userid,passwd);
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		String sql="insert into board (userID,boardID,boardTitle,boardContent,boardDate,boardHit,boardFile,boadRealFile,boardGroup, BOARDSEQUENCE, boardLevel)" + 
				" values (?, NVL((SELECT MAX(boardID)+1 FROM BOARD), 1), ?, ?, sysdate, 0, ?,?, ?, ?,?)";
		
		try {
		pstmt= con.prepareStatement(sql);
		pstmt.setString(1, userID);
		pstmt.setString(2, boardTitle);
		pstmt.setString(3, boardContent);
		pstmt.setString(4, boardFile);
		pstmt.setString(5, boardRealFile);
		pstmt.setInt(6, parent.getBoardGroup());
		pstmt.setInt(7, parent.getBoardSequence()+1);
		pstmt.setInt(8, parent.getBoardLevel()+1);
		return pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			try {			
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println(sql);
		return -1;
	}
	
	
	public int hit(String boardID) {
		int n = template.update("BasicMapper.hit", boardID);
		return n;
	}
	
	public int write(BoardDTO boardDTO) {
		int n = template.insert("BasicMapper.write", boardDTO);
		return n;
	}

	public List<BoardDTO> getList() {
		System.out.println("aaaa");
		List<BoardDTO> boardList  = template.selectList("BasicMapper.getList");
		return boardList;
	}

	public BoardDTO getBoard(String boardID) {
		System.out.println("boardDAO"+boardID);
		BoardDTO dto = template.selectOne("BasicMapper.getBoard", boardID);
		return dto;
	}



	public int replyUpdate(BoardDTO parent) {
		int n = template.update("BasicMapper.replyUpdate", parent);
		return n;
	}



}
