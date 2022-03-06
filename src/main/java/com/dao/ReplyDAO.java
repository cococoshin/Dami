package com.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dto.ReplyDTO;


@Repository
public class ReplyDAO {

	@Inject
	private SqlSessionTemplate template;
	
	//댓글 목록 
	public List<ReplyDTO> readReply(int bno){
		
		return template.selectList("ReplyMapper.readReply", bno);
	}
	// 댓 작성
	public void writeReply(ReplyDTO dto) {
		template.insert("ReplyMapper.writeReply", dto);
	}
	
	// 댓 수정
	
	public void updateReply(ReplyDTO dto) {
		template.update("ReplyMapper.updateReply", dto);
	}
	// 댓 삭제
	public void deleteReply(ReplyDTO dto) {
		template.update("ReplyMapper.deleteReply", dto);
	}	
	// 댓 조회
	public ReplyDTO selectReply(int rno) {
		return template.selectOne("ReplyMapper.selectReply", rno);
	}
	
	
}
