package com.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dao.ReplyDAO;
import com.dto.ReplyDTO;


@Service
public class ReplyService {
	@Inject
	private ReplyDAO dao;
	//댓 목록조회
	public List<ReplyDTO> readReply(int bno){
		return dao.readReply(bno);
	}
	//댓쓰기
	public void writeReply(ReplyDTO dto) {
		dao.writeReply(dto);
	}
	//댓수정
	public void updateReply(ReplyDTO dto) {
		dao.updateReply(dto);
	}
	//댓 삭제
	public void deleteReply(ReplyDTO dto) {
		dao.deleteReply(dto);
	}
	//선택 댓 조회
	public ReplyDTO selectReply(int rno) {
		return dao.selectReply(rno);
	}
}
