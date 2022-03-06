package com.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.MemberDTO;
import com.dto.MenuDTO;
import com.dto.RestaurantDTO;
import com.service.MemberService;
import com.service.MenuService;
import com.service.RestaurantService;

@Controller
public class RestaurantController {

	@Autowired
	RestaurantService service;
	
	@Autowired
	MenuService service1;

	@RequestMapping("/resInfo") //resInfo.jsp 이동
	@ModelAttribute("resInfo")// Key  값 
	public RestaurantDTO resInfo(@RequestParam("restaurant") String restaurant) {
		RestaurantDTO dto = service.resInfo(restaurant);
		
		return dto;
	}
	
	@ModelAttribute("menuInfo")// Key  값
	public List<MenuDTO> menuInfo(@RequestParam("restaurant") String restaurant) {
		List<MenuDTO> list = service1.menuInfo(restaurant);
		return list;
	}
//	@RequestMapping(value = "/loginCheck/resList")
//	public String login(HttpSession session) {
//		List<RestaurantDTO> list = service.resList();
//		session.setAttribute("resList", list);
//		return "resList";
//	}


}
