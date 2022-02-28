package com.user;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {

	@Autowired
	SqlSessionTemplate template;
	
	public UserDTO login(HashMap<String, String> map) {
		UserDTO dto = template.selectOne("BasicMapper.login", map); 
		return dto;
	}

	public int register(UserDTO dto) {
		int n = template.insert("BasicMapper.register", dto);
		return n;
	}

	public UserDTO getUser(String userID) {
		System.out.println("DAO ID"+userID);
		UserDTO dto = template.selectOne("BasicMapper.getUser",userID);
		System.out.println("BACK ID"+dto.getUserID());

		return dto;
	}

	public int update(UserDTO dto) {
		int n = template.update("BasicMapper.update", dto);
		return n;
	}

	public int profile(HashMap<String, String> map) {
		int n = template.update("BasicMapper.profile", map);
		return n;
	}

}
