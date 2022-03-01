package com.board;


import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@RequestMapping("/BoardView")
	public ModelAndView getList() {
		List<BoardDTO> boardList= service.getList();
		ModelAndView mav= new ModelAndView();
		mav.addObject("boardList", boardList);
		//request.setAttribute("goodsList", list)와 동일
		mav.setViewName("boardView"); //main.jsp
		return mav;				
	}
	
	@RequestMapping("/boardShow")//goodsRetrieve.jsp
	@ModelAttribute("boardShow") //key값
	public BoardDTO getBoard(@RequestParam("boardID") String boardID) {
		System.out.println("Retrieve"+boardID);
		BoardDTO dto= service.getBoard(boardID);
		service.hit(boardID);
		return dto;		
	}
	
	@RequestMapping("/boardReply")//goodsRetrieve.jsp
	@ModelAttribute("boardReply") //key값
	public BoardDTO boardReply(@RequestParam("boardID") String boardID) {
		System.out.println("Retrieve"+boardID);
		BoardDTO dto= service.getBoard(boardID);
		service.hit(boardID);
		return dto;		
	}
	
	@RequestMapping("/boardReply1")
	public String boardReplyUpdate(BoardDTO dto, Model model, HttpSession session) throws SQLException {
		String userID = (String)session.getAttribute("userID");
		String boardTitle = dto.getBoardTitle();
		String boardContent = dto.getBoardContent();
		String boardFile = " ";
		String boardRealFile = " ";
		String boardID = Integer.toString(dto.getBoardID());
		
		BoardDTO boardDTO = new BoardDTO(userID, boardTitle, boardContent, boardFile, boardRealFile);
		BoardDTO parent = service.getBoard(boardID);
		service.replyUpdate(parent);
		BoardDAO dao = new BoardDAO();
		dao.reply(userID, boardTitle, boardContent, boardFile, boardRealFile, parent);
		
		List<BoardDTO> boardList = service.getList();
		model.addAttribute("boardList", boardList);
		return "boardView";
	}
	
	@RequestMapping(value = "/BoardWrite", method =  RequestMethod.POST)
	public String write(BoardDTO dto, Model model) {
		int n =service.write(dto);
		List<BoardDTO> boardList= service.getList();
		if (n>0) {//회원가입 성공
			model.addAttribute("boardList", boardList);
			model.addAttribute("mesg", "작성 성공");
		}
		return "boardView";
	} // MemberAdd end
	
	
	
	
}
