package com.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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



}
