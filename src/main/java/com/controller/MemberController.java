package com.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value = "/memberForm", method = RequestMethod.GET)
	public void getRegister(){

	}
	
	/*
	 * // 회원가입 post
	 * 
	 * @RequestMapping(value = "/memberForm", method = RequestMethod.POST) public
	 * String postRegister(MemberDTO dto){ System.out.println("post rs");;
	 * 
	 * service.register(dto);
	 * 
	 * return "redirect:/"; }
	 */
	
	// 회원가입 post
	@RequestMapping(value = "/memberForm", method = RequestMethod.POST)
	public String postRegister(MemberDTO dto) throws Exception {
		// 중복된아이디로 가입시도시 다시 가입페이지로
		int result = service.idChk(dto);
		try {
			if(result == 1) {
				return "/member/memberForm";
			}else if(result == 0) {
				service.register(dto);
			}
			
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/";
	}
	
	
	//아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="IdCheckForm/idChk", method = RequestMethod.POST)
	public int idChk(MemberDTO dto){
		int result = service.idChk(dto);
		return result;
	}	//컨트롤러-> 서비스->dao-> 맵퍼의 id=idchk / 쿼리 조회 결과 result로 return
}	



	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="IdCheckForm/idChk", method = RequestMethod.POST)
	 * public int idChk(@RequestParam("userid")String userid){ int result =
	 * service.idChk(dto); System.out.println(userid);
	 * 
	 * return result;
	 * 
	 * }
	 */

	
	

/*
@RequestMapping(value = "/MemberAdd")
public String MemberAdd(MemberDTO dto, Model model) {
	int n =service.insert(dto);
	if (n>0) {//회원가입 성공
		model.addAttribute("mesg", "회원가입 성공");
	}
	return "loginForm";
} // MemberAdd end
*/