package com.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dao.BoardDAO;
import com.dto.BoardDTO;
import com.dto.SearchCriteria;
import com.util.FileUtils;

@Service
public class BoardService {
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Inject
	private BoardDAO dao;
	
	
	// 글작성
	public void write(BoardDTO dto, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.write(dto);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(dto, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			dao.insertFile(list.get(i)); 
		}
	}

	
	// 목록
	public List<BoardDTO> list(SearchCriteria scri) {

		return dao.list(scri);
	}
	
	// 게시물 갯수**
	public int listCount(SearchCriteria scri) {
		return dao.listCount(scri);
	}
	
	// 게시물 조회
	public BoardDTO read(int bno) {
		
		return dao.read(bno);
	}
	// 업데이트
	public void update(BoardDTO dto, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws IllegalStateException, IOException{

		dao.update(dto);
		
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(dto, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i = 0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				dao.insertFile(tempMap);
			}else {
				dao.updateFile(tempMap);
			}
		}
	}
	//삭제
	public void delete(int bno){
		
		dao.delete(bno);
	}
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int bno){

		return dao.selectFileList(bno);
	}
	// 첨부파일 다운로드
	public Map<String, Object> selectFileInfo(Map<String, Object> map){
		
		return dao.selectFileInfo(map);
	}
	
	
	
	
	
	
	
	
	
}
