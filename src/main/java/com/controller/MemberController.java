package com.controller;

import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.MemberDTO;
import com.dto.RestaurantDTO;
import com.service.MemberService;
import com.service.RestaurantService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	@Autowired
	RestaurantService service2;

	
	@RequestMapping(value = "/MemberAdd")
	public String MemberAdd(MemberDTO dto, Model model) {
		int n =service.insert(dto);
		if (n>0) {//회원가입 성공
			model.addAttribute("mesg", "회원가입 성공");
		}
		return "loginForm";
	} // MemberAdd end

	@RequestMapping(value = "/IdSearch")
	public String IdSearch(MemberDTO dto, Model model, HttpServletRequest request) {
		String userid = service.idSearch(dto);
		
		if (userid == null) {
			model.addAttribute("mesg", "입력정보가 일치하는지 확인해 주세요");
			return "idSearch";
		} else {
			model.addAttribute("mesg", "회원님의 아이디는 "+userid+" 입니다.");			
			return "loginForm";
		}
		
	} // IdSearch end
	
	@RequestMapping(value = "/PwSearch")
	public String PwSearch(MemberDTO dto, Model model, HttpServletRequest request) {
		String passwd = service.pwSearch(dto);
		String userid = dto.getUserid();
		
		
		if (passwd == null) {
			model.addAttribute("mesg", "입력정보가 일치하는지 확인해 주세요");
			return "pwSearch";
		} else {
			model.addAttribute("mesg", "새로운 비밀번호로 변경해주세요.");
			model.addAttribute("userid", userid);
			return "pwRemake"; 
		}	
	} // PwSearch end

	



}
