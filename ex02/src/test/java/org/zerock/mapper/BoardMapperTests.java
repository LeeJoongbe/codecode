package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2
public class BoardMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	
	@Test
	public void testGetList() {
		boardMapper.getList().forEach(board -> log.info(board));
	}
	
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie");
		
		boardMapper.insert(board);
		log.info(board);
	}
	
	@Test
	public void testInsertSelectKey() {
		
		for(int i = 0; i<300; i++) {
			BoardVO board = new BoardVO();
			
			board.setTitle(i+"새로 작성하는 글");
			board.setContent(i+"새로 작성하는 내용");
			board.setWriter(i+"newbie");
			
			boardMapper.insertSelectKey(board);
			log.info(board);
		}
		
	}
	
	@Test
	public void testRead() {
		BoardVO board = boardMapper.read(85L);
		//BoardVO 타입의 board 에 boardMapper의 read매소드를 사용 매개값으로 2번(실수형)게시물검색
		log.info("board bno 2 : " + board);
	}
	
	@Test
	public void testDelete() {
		int bnoNum = boardMapper.delete(85L);
		//boardMapper의 delete메소드를 사용 하여 2번 게시물을 지우고 반환값으로 bnoNum을 받는다.
		//나중에 몇번게시물이 삭제 되어있습니다. 사용하기 위해서
		if (bnoNum > 0) {
			log.info(bnoNum + "개의 게시물이 삭제 되었습니다.");
		}else {
			log.info("해당 번호의 게시물이 없습니다.");
		}
		
	}

	@Test
	public void testUpdate() {
		BoardVO board = boardMapper.read(1L);
		//1번 게시물을 가져와서 board에 담는다.
		board.setTitle("이건 수정된 게시물입니다");
		board.setContent("이건 수정된 게시물의 내용입니다.");
		board.setWriter("작성자가 수정되었습니다.");
		
		int num = boardMapper.update(board);
	}
	
	@Test
	public void testUpdate2() {
		BoardVO board = new BoardVO();
		//실행전 존재하는 번호인지 확인 할 것
		board.setBno(1L);
		board.setTitle("다시수정된 제목");
		board.setContent("다시 수정된 내용");
		board.setWriter("다시 수정된 작성자");
		
		int count = boardMapper.update(board);
		log.info("UPDATE COUNT : " + count);
	}

	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(10);
		List<BoardVO> list = boardMapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board));
	}
	
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("ㅋㅋㅋ");
		cri.setType("C");
		
		List<BoardVO> list = boardMapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board));
		
	}
	
	
}
