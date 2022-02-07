package com.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.MemberDTO;
import com.dto.MenuDTO;
import com.dto.RestaurantDTO;
import com.service.MemberService;
import com.service.MenuService;
import com.service.RestaurantService;

@Controller
public class MainController {

	@Autowired
	MenuService service;

	@Autowired
	RestaurantService service2;

	
	@RequestMapping(value = "/main") //main페이지이동
	public String login(HttpSession session) {

		List<RestaurantDTO> list = service2.resList();
		session.setAttribute("resList", list);
		return "main";
	}
	
	@RequestMapping(value = "/loginCheck/logout") //main페이지이동
	public String logout(HttpSession session) { 
		session.invalidate();
		return "redirect:../";
	}
	
	@RequestMapping(value = "/loginCheck/myPage") //main페이지이동
	public String myPage(HttpSession session) {
		return "redirect:../myPage";
	}

	@RequestMapping(value = "/loginCheck/memberUpdate", produces="text/plain;charset=UTF-8") 
	public String memberUpdate(HttpSession session, Model model, MemberDTO dto, RedirectAttributes ra) {
		//loginCheck이 되어야 들어올 수 있으니까 로그인 검사X.
		int n = service.memberUpdate(dto);
		MemberDTO oDTO = (MemberDTO) session.getAttribute("login");
		dto.setPasswd(oDTO.getPasswd());
		dto.setUsername(oDTO.getUsername());
		session.setAttribute("login", dto); //다시 session에저장
		ra.addFlashAttribute("mesg", "업데이트가 완료되었습니다.");
		
		return "redirect:/main";
	}

	@RequestMapping(value = "/loginCheck/Search")
	public String search(@RequestParam("search") String search, RedirectAttributes ra) {

	      System.out.println(search);
	      
	      //menu검색
	      List<MenuDTO> mList = service.menuSearch(search);
	      for (MenuDTO menuDTO : mList) {
	         System.out.println(menuDTO);
	      }
	      String mMesg = null;
	      if (mList.size()==0) {
	         mMesg = "검색결과가 없습니다. 다시 검색하시려면 버튼을 클릭해주세요.";
	      } else {
	         mMesg = "이런 메뉴를 찾으시나요?";
	      }
	      ra.addFlashAttribute("mList", mList);
	      System.out.println("\n");
	      
	      //restaurant검색
	      List<RestaurantDTO> rList = service2.resSearch(search);
	      for (RestaurantDTO rDTO : rList) {
	         System.out.println(rDTO);
	      }
	      String rMesg = null;
	      if (rList.size()==0) {
	         rMesg = "검색결과가 없습니다. 다시 검색하시려면 버튼을 클릭해주세요.";
	      } else {
	         rMesg = "이런 맛집을  찾으시나요?";
	      }
	      ra.addFlashAttribute("rList", rList);
	  
		return "redirect:../searchResult";
		//request set 
		//model addattr
		//request 1번이동가능하죠
		//
	} //end search
	

	
	

} 
