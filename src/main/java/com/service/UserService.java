package com.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.user.UserDAO;
import com.user.UserDTO;

@Service
public class UserService {
	@Autowired
	UserDAO dao;
	
	
	public UserService() {
	
	}
	

	public UserDTO login(HashMap<String, String> map) {
		UserDTO dto = dao.login(map);		
		return dto;
	}
	
	public UserDTO getUser(String userID) {
		 UserDTO dto = dao.getUser(userID);
		 return dto;
	}

	public int register(UserDTO dto) {
		  int n = dao.register(dto);	
		  return n;
	}

	public int update(UserDTO dto) {
		  int n = dao.update(dto);
		  return n;
	}


	public int profile(HashMap<String, String> map) {
		  int n = dao.profile(map);
		  return n;
	}
}
