package org.zerock.controller;

import org.apache.logging.log4j.core.appender.rewrite.MapRewritePolicy.Mode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Log4j2
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService boardService;
	
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		
		log.info("list" + cri);
		model.addAttribute("list", boardService.getList(cri));
//		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		int total = boardService.getTotal(cri);
		
		log.info("total" + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));

		
		
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		//register은 boarvo객체를 받고 redirect를 사용하기위해서 상타입을 받는다.
		log.info("register : " + board);
		
		boardService.register(board);
		//일회성으로 한번 사용하고 redirect후 값이 소멸됨
		rttr.addFlashAttribute("result", board.getBno());
		log.info("result : " + board.getBno());
		return "redirect:/board/list";  //위의 처리과정을 가지고 주소를 찾아간다. 
	}
	
	@GetMapping({"/get", "/modify"}) //상세보기
	public void get(@RequestParam("bno") Long bno, Model model, @ModelAttribute("cri")Criteria cri) {
		// list에서 bno를 가지고 들어간다.
		log.info("/get or modify");
		model.addAttribute("board", boardService.get(bno));
		
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr, @ModelAttribute("cri")Criteria cri) {
		
		log.info("modify : " + board);
		
		if(boardService.modify(board)) {
			
			rttr.addFlashAttribute("result", "success");
			
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove (@RequestParam("bno") Long bno, RedirectAttributes rttr, @ModelAttribute("cri")Criteria cri) {
		log.info("remove..... : " +bno );
		
		if(boardService.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}
}
