package com.user;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService service;
	
	@RequestMapping(value = "/Login", method =  RequestMethod.POST)
	public String login(@RequestParam HashMap<String, String> map, Model model, HttpSession session) {
		System.out.println("\n\n"+map+"\n\n");
		UserDTO dto = service.login(map);
		System.out.println("\n\n"+dto+"\n\n");
		if (dto != null) {
			String userID = dto.getUserID();
			session.setAttribute("login", dto);
			System.out.println("LOGIN"+userID);
			session.setAttribute("userID", userID);
			return "redirect:index";
		} else {
			model.addAttribute("mesg", "아이디 또는 비번이 잘못되었습니다.");
			return "login";
		}
	}
	
	@RequestMapping(value = "/userRegister")
	public String register(UserDTO dto, Model model) {
		int n =service.register(dto);
		if (n>0) {//회원가입 성공
			model.addAttribute("mesg", "회원가입 성공");
		}
		return "login";
	} // MemberAdd end
	
	@RequestMapping(value = "/userUpdate")
	public String update(UserDTO dto, Model model) {
		int n =service.update(dto);
		if (n>0) {//회원가입 성공
			model.addAttribute("mesg", "회원가입 성공");
		}
		return "login";
	} // MemberAdd end
	
	
	private final String uploadDir = "C:\\eclipse\\JAVA\\Java student\\eclipse\\STS_SUNG\\WORKSPACE\\Board\\src\\main\\webapp\\WEB-INF\\views\\img\\";
	
	@PostMapping("/userProfile")
	public String userProfile(@RequestParam("userProfile") MultipartFile userProfile, HttpSession session) throws IOException{
			String userID = (String)session.getAttribute("userID");
			String filename= userProfile.getOriginalFilename();
			String fullPath= uploadDir + filename;
			userProfile.transferTo(new File(fullPath));
			System.out.println(fullPath);
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("userID", userID);
			map.put("fileName", filename);
			service.profile(map);
			UserDTO dto = service.getUser(userID);
			session.setAttribute("login", dto);
			
		return "index";
		}
		
		
	}
	
	
	

