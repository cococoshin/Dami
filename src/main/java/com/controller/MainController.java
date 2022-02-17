package com.controller;

import java.util.ArrayList;
import java.util.Collections;
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

import com.dto.LikeDTO;
import com.dto.MemberDTO;
import com.dto.MenuDTO;
import com.dto.RestaurantDTO;
import com.service.LikeService;
import com.service.MemberService;
import com.service.MenuService;
import com.service.RestaurantService;

@Controller
public class MainController {

	@Autowired
	MemberService service;

	@Autowired
	RestaurantService service2;

	@Autowired
	LikeService service3;

	@Autowired
	MenuService service4;

	
	@RequestMapping(value = "/main") //main페이지이동
	public String login(HttpSession session) {
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		String userid = dto.getUserid();
		List<LikeDTO> likeList = service3.selectLike(userid);

		if (likeList != null) {
			// 3. Userid를 이용해 통해 유저의 고객취향테이블에 접속하여
			// 각각의 값의 최빈값을 가져옵니다.
			// int result = service.createResultTable(userid);
			String genre = service3.getGenre(userid);
			String estyle = service3.getestyle(userid);
			String texture = service3.gettexture(userid);
			String taste = service3.gettaste(userid);
			String sauce = service3.getsauce(userid);
			String spice = service3.getspice(userid);
			String carbo = service3.getcarbo(userid);
			String meat = service3.getmeat(userid);
			String fat = service3.getfat(userid);
			String vegi = service3.getvegi(userid);
			
			// 4. 뽑아온 데이터를 LikeDTO에 저장합니다.
			// 총 55가지종류의 데이터를 저장하는 LikeDTO와 함수가 있을 예정입니다.
			// 컬럼이 10개라 가지수가 55개 입니다.
			// (10+9+8+7+6+5+4+3+2+1) = 55
			
			// 5. 컬럼 10개중 10개 일치, 9개일치 순으로 뽑아옵니다.
			// 일단 테스트용으로 3개를 만들었는데 총 55개의 함수를 제작 예정입니다.
			// menuR1: 10개 모두 일치
			// menuR9AG: 2개 일치 (genre, carbo)
			// menu10A: 1개일치 (genre)
			LikeDTO none = new LikeDTO();
			LikeDTO menuR1 = new LikeDTO(genre, estyle, texture, taste, sauce, spice, carbo, meat, fat, vegi);
			LikeDTO menuR9AG = new LikeDTO(genre, carbo);
			System.out.println(menuR9AG);	
		

				List<String> menuR1Z = service3.getMenuR1(menuR1);
				List<String> menuR9AGZ = service3.getMenuR9AG(menuR9AG);
				List<String> menuR10AZ = service3.menuR10A(genre);
				List<String> menuRecommend = new ArrayList<String>();
				
				//각 메뉴들을 하나의 리스트로 합친다
				menuRecommend.addAll(menuR1Z);
				menuRecommend.addAll(menuR9AGZ);
				menuRecommend.addAll(menuR10AZ);
				System.out.println(menuRecommend);
				
				//얻어내온 메뉴명을 통해 -> 메뉴테이블 -> 레스토랑테이블 정보 얻어옴
				List<String> resRecommendList = service4.resRecommend(menuRecommend);//뽑아온 메뉴들을 판매하는 레스토랑들을 받아옴
				System.out.println("\nresRecommend"+resRecommendList+"\nresRecommend");
				
				List<RestaurantDTO> recommendList = service2.resRecommend(resRecommendList);
				System.out.println("\nRecommendList"+recommendList+"\nRecommendList");
				session.setAttribute("recommendList", recommendList);
		}//if end 
		
		
		// mood list 랜덤으로 무드를 뽑는 용도
		List<String> mood = new ArrayList<String>();
		mood.add("화사한");
		mood.add("밝은");
		mood.add("조용한");
		mood.add("시끌벅적한");
		Collections.shuffle(mood);
		session.setAttribute("mood", mood);
		
		
		//전체레스토랑 메뉴 출력 2/12
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
	
	
	
	
	
	@RequestMapping(value = "/newPw", produces="text/plain;charset=UTF-8") 
	public String newPw(Model model, @RequestParam Map<String, String> map ) {
		System.out.println("\nnewPw"+map+"newPw\n");
		int n = service.newPw(map);
		System.out.println("\nnewPw\t"+n+"\tnewPw\n");
		if (n != 0) {
			model.addAttribute("mesg", "새로운 비밀번호로 로그인 해주세요");
			return "loginForm";			
		} else {
			model.addAttribute("mesg", "비밀번호 등록이 실패하였습니다. 다시 등록해 주세요");
			return "pwRemake";
		}
	}

	
	
	
	
	
	
	
	
	@RequestMapping(value = "/loginCheck/Search")
	public String search(@RequestParam("search") String search, RedirectAttributes ra) {

	      System.out.println(search);
	      
	      //menu검색
	      List<MenuDTO> mList = service4.menuSearch(search);
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
