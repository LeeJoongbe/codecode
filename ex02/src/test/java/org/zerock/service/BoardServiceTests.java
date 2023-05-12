package org.zerock.service;

import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2
public class BoardServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardService boardService;
	
	@Test
	public void testExist() {
		log.info("boardService : " + boardService);
		assertNotNull(boardService);
	}
	
	@Test
	public void testRegister() {
		
		BoardVO board = new BoardVO();
		board.setTitle("게시판을 만드는 법");
		board.setContent("게시판을 만드는 방법은 쉽다");
		board.setWriter("홍길동");
		
		log.info("board에 넣은 값" + board);
		
		boardService.register(board);
		
		log.info("생성된 게시물의 번호 : " + board.getBno());
		
		
		
	}
	
	@Test
	public void testGetList() {
		boardService.getList().forEach(board -> log.info(board));
		
	}
	
	@Test
	public void testGet() {
		log.info(boardService.get(1L));
	}
	
	@Test
	public void testUpdate() {
		
		BoardVO board = boardService.get(1L);
		
		if(board ==  null) {
			return;
		}
		
		board.setTitle("제목 수정함");
		log.info("MODIFY RESULT : " + boardService.modify(board));
		
	}
	
	@Test
	public void testDelete() {
		
		BoardVO board = boardService.get(4L);
		
		if(board == null) {
			log.info("게시물이 없습니다.");
		}else {
			log.info("REMOVE RESULT : " + boardService.remove(4L));
			log.info(board.getBno()+"번 게시물이 삭제 되었습니다.");
		}
		
		
		
	}

}
