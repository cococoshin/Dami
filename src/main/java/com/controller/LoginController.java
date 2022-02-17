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
public class LoginController {

	@Autowired
	MemberService service;
	@Autowired
	RestaurantService service2;

	@RequestMapping(value = "/Login")
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session) {
		System.out.println("\n\n"+map+"\n\n");
		MemberDTO dto = service.login(map);
		System.out.println("\n\n"+dto+"\n\n");
		if (dto != null) {
			session.setAttribute("login", dto);
			return "redirect:main";
		} else {
			model.addAttribute("mesg", "아이디 또는 비번이 잘못되었습니다.");
			return "loginForm";
		}
	}

}
