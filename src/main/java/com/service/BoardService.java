package com.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.BoardDAO;
import com.board.BoardDTO;


@Service
public class BoardService {
	
	@Autowired
	BoardDAO dao;
	

	public int write(BoardDTO boardDTO) {
		int n = dao.write(boardDTO);
		return n;		
	}
	
	public int replyUpdate(BoardDTO parent) {
		  int n = dao.replyUpdate(parent);
		  return n;
	}
	
	public int hit(String boardID) {
		  int n = dao.hit(boardID);			
		  return n;
	}
		
	public List<BoardDTO> getList() {
		 List<BoardDTO> list = dao.getList();
		  return list;
		
	}
	
	public BoardDTO getBoard(String boardID) {
		BoardDTO dto = dao.getBoard(boardID);
		return dto;
	}
	
	}
