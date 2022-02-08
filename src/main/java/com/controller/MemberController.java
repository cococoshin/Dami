package com.controller;

import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	
	@Autowired //메일발송용
	JavaMailSender mailSender;

	
	
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
		String email1 = dto.getEmail1();
		String email2 = dto.getEmail2();
		
		if (userid == null) {
			model.addAttribute("mesg", "이름 또는 핸드폰번호를 확인해 주세요");
			return "idSearch";
		} else {
			request.setAttribute("userid", userid);
			request.setAttribute("mailTo", email1+"@"+email2);
			return "forward:/sendMail";
		}
		
	} // IdSearch end
	
	@RequestMapping(value = "/PwSearch")
	public String PwSearch(MemberDTO dto, Model model, HttpServletRequest request) {
		String passwd = service.pwSearch(dto);
		String email1 = dto.getEmail1();
		String email2 = dto.getEmail2();
		
		if (passwd == null) {
			model.addAttribute("mesg", "입력정보를 확인해 주세요");
			return "pwSearch";
		} else {
			request.setAttribute("passwd", passwd);
			request.setAttribute("mailTo", email1+"@"+email2);
			return "forward:/sendMail"; 
		}	
	} // PwSearch end

	//sendmail 메일이 안감 ㅠㅜㅜㅜ
	@RequestMapping(value = "/sendMail")
	public String sendMailTest(HttpServletRequest request) throws Exception{
		String userid = (String) request.getAttribute("userid");
		String passwd = (String) request.getAttribute("passwd");
		String mailTo = (String) request.getAttribute("mailTo");
		System.out.println("\n\n"+userid+"\n\n"+passwd+"\n\n"+mailTo+"\n\n");
		
        String subject = "test 메일";
        String content = "메일 테스트 내용";
        String from = "보내는이 아이디@도메인주소";
        String to = "받는이 아이디@도메인주소";
        
        if (userid != null) {
			subject = "DAMI 회원님의 ID입니다";
			content = userid;
			from = "dnflwlq133@naver.com";
			to = mailTo;
		} else if (passwd != null) {
			subject = "DAMI 회원님의 비밀번호 입니다";
			content = passwd;
			from = "dnflwlq133@gmail.com";
			to = mailTo;
		}//if end 
        
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
            // true는 멀티파트 메세지를 사용하겠다는 의미
            
            /*
             * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
             */
            
            mailHelper.setFrom(from);
            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content);
            // true는 html을 사용하겠다는 의미입니다.
            
            /*
             * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
             */
            
            mailSender.send(mail);
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "loginForm";
    }


//	model.addAttribute("mesg", "메일을 발송했습니다.");


}
