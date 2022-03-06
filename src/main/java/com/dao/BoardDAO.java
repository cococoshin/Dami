package com.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.BoardDTO;
import com.dto.Criteria;
import com.dto.SearchCriteria;

@Repository
public class BoardDAO{

	@Inject
	private SqlSessionTemplate template;
	
	//게시물 작성
	public void write(BoardDTO dto) {
		template.insert("BoardMapper.insert", dto);
	}
	
	// 게시물 목록 조회
	public List<BoardDTO> list(SearchCriteria scri){
		
		return template.selectList("BoardMapper.listPage", scri);
	}
	
	// 게시물 총 갯수 **
	public int listCount(SearchCriteria scri) {
		return template.selectOne("BoardMapper.listCount", scri);
	}
	
	//게시물 조회
	public BoardDTO read(int bno) {
		
		return template.selectOne("BoardMapper.read", bno);
	}
	

	public void update(BoardDTO dto){
		
		template.update("BoardMapper.update", dto);
	}


	public void delete(int bno){
		
		template.delete("BoardMapper.delete", bno);
	}
	
	// 첨부파일 업로드
	public void insertFile(Map<String, Object> map){
		
		template.insert("BoardMapper.insertFile", map);
	}
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int bno){

		return template.selectList("BoardMapper.selectFileList", bno);
	}
	// 첨부파일 다운로드
	public Map<String, Object> selectFileInfo(Map<String, Object> map){

		return template.selectOne("BoardMapper.selectFileInfo", map);
	}
	
	// 첨부파일 수정	
	public void updateFile(Map<String, Object> map){
		// TODO Auto-generated method stub
		
		template.update("BoardMapper.updateFile", map);
	}
	
	
	
}
