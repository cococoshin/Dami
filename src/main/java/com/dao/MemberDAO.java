package com.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate template;

	public MemberDTO login(Map<String, String> map) {
		MemberDTO dto = template.selectOne("MemberMapper.loginCheck", map);
		return dto;
	}

	public int insert(MemberDTO dto) {
		int n = template.insert("MemberMapper.insert", dto);
		return n;
	}

	public String idSearch(MemberDTO dto) {
		String userid = template.selectOne("MemberMapper.idSearch", dto);
		return userid;
	}

	public String pwSearch(MemberDTO dto) {
		String passwd = template.selectOne("MemberMapper.pwSearch", dto);
		return passwd;
	}
	
	public int memberUpdate(MemberDTO dto) {
		int n = template.update("MemberMapper.update", dto);
		return n;
	}

	public int newPw(Map<String, String> map) {
		int n = template.update("MemberMapper.newPw", map);
		return n;
	}
	
	
	

//	public MemberDTO loginCheck(SqlSession session, HashMap<String, String> map) {
//		MemberDTO dto = session.selectOne("MemberMapper.loginCheck", map);
//		return dto;
//	}
//
//	public String idSearch(SqlSession session, MemberDTO dto) {
//		String userid = session.selectOne("MemberMapper.idSearch", dto);
//		return userid;
//	}
//
//	public String pwSearch(SqlSession session, MemberDTO dto) {
//		String passwd = session.selectOne("MemberMapper.pwSearch", dto);
//		return passwd;
//	}
//	public MemberDTO mypage(SqlSession session, String userid) {
//		MemberDTO dto = session.selectOne("MemberMapper.mypage", userid);
//		return dto;
//	}
//
//	public int memberUpdate(SqlSession session, MemberDTO dto2) {
//		int n = session.update("MemberMapper.update", dto2);
//		return n;
//	}
//
//	public int insert(SqlSession session, MemberDTO dto) {
//		int n = session.insert("MemberMapper.insert", dto);
//		return n;
//	}
//	
//	public int duplicateIdCheck(SqlSession session, String userid) {
//		return session.selectOne("MemberMapper.duplicateIdCheck", userid);
//	}
//	
//	
//	public int duplicateEmailCheck(SqlSession session, HashMap<String, String> map) {
//		return session.selectOne("MemberMapper.duplicateEmailCheck", map);
//		}


}
