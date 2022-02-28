package com.board;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
		BoardDTO dto= service.getBoard(boardID);
		service.hit(boardID);
		return dto;		
	}
	
}
