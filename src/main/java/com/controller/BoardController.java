package com.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.BoardDTO;
import com.dto.PageMaker;
import com.dto.ReplyDTO;
import com.dto.SearchCriteria;
import com.service.BoardService;
import com.service.ReplyService;


@Controller
@RequestMapping("/board/*")
public class BoardController  {
	
	@Inject
	BoardService service;
	
	@Inject
	ReplyService Replyservice;
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView() {
		System.out.println("board/writeview");
		
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardDTO dto,  MultipartHttpServletRequest mpRequest) throws Exception {
		System.out.println("write not view");
		service.write(dto, mpRequest);
		
		return "redirect:/board/list";
	}
	
	// 게시판 목록 조회**
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri){

		model.addAttribute("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/list";
		
	}
	
	// 게시물 조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(BoardDTO dto, @ModelAttribute("scri") SearchCriteria scri, Model model) {
		
		model.addAttribute("read", service.read(dto.getBno()));
		model.addAttribute("scri", scri);
		
		List<ReplyDTO> replyList = Replyservice.readReply(dto.getBno());
		model.addAttribute("replyList", replyList);
		
		List<Map<String, Object>> fileList = service.selectFileList(dto.getBno());
		model.addAttribute("file", fileList);

		return "board/readView";		
			
	}
	
	
	
	
	// 게시판 수정뷰
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(BoardDTO dto,@ModelAttribute("scri") SearchCriteria scri, Model model){
		
		model.addAttribute("update", service.read(dto.getBno()));
		model.addAttribute("scri", scri);
		
		List<Map<String, Object>> fileList = service.selectFileList(dto.getBno());
		model.addAttribute("file", fileList);
		
		return "board/updateView";
	}
	
	// 게시판 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardDTO boardVO, 
			 @ModelAttribute("scri") SearchCriteria scri, 
			 RedirectAttributes rttr,
			 @RequestParam(value="fileNoDel[]") String[] files,
			 @RequestParam(value="fileNameDel[]") String[] fileNames,
			 MultipartHttpServletRequest mpRequest) throws Exception {

			service.update(boardVO, files, fileNames, mpRequest);
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/list";
	}

	// 게시판 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(BoardDTO dto, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr){

		service.delete(dto.getBno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	//댓글 작성
	@RequestMapping(value="/replyWrite", method = RequestMethod.POST)
	public String replyWrite(ReplyDTO dto, SearchCriteria scri, RedirectAttributes rttr){
		
		Replyservice.writeReply(dto);
		
		rttr.addAttribute("bno", dto.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/readView";
	}	
	
	//댓글 수정 GET
	@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
	public String replyUpdateView(ReplyDTO dto, SearchCriteria scri, Model model){

		model.addAttribute("replyUpdate", Replyservice.selectReply(dto.getRno()));
		model.addAttribute("scri", scri);
		
		return "board/replyUpdateView";
	}
		
	//댓글 수정 POST
	@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(ReplyDTO dto, SearchCriteria scri, RedirectAttributes rttr){

		Replyservice.updateReply(dto);
		
		rttr.addAttribute("bno", dto.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/readView";
	}	

	//댓글 삭제 GET
	@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
	public String replyDeleteView(ReplyDTO dto, SearchCriteria scri, Model model){

		model.addAttribute("replyDelete", Replyservice.selectReply(dto.getRno()));
		model.addAttribute("scri", scri);
		

		return "board/replyDeleteView";
	}
	
	//댓글 삭제
	@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
	public String replyDelete(ReplyDTO dto, SearchCriteria scri, RedirectAttributes rttr){

		Replyservice.deleteReply(dto);
		
		rttr.addAttribute("bno", dto.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/readView";
	}

	@RequestMapping(value="/fileDown")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws IOException{
		Map<String, Object> resultMap = service.selectFileInfo(map);
		String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
		String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
		
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\mp\\file\\"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
	
	
	
	
	
}