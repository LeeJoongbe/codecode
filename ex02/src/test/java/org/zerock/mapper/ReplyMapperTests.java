package org.zerock.mapper;

import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;
import org.zerock.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2
public class ReplyMapperTests {
	
	private Long[] bnoArr = { 1300L, 1298L, 1296L, 1294L};
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Test
	public void testMapper() {
		log.info("mapper...." + mapper);
	}
	
	@Test
	public void testCreate() {
		
		IntStream.range(1, 10).forEach(i -> {
			
			ReplyVO vo = new ReplyVO();
			
			//게시물의 번호
			vo.setBno(bnoArr[i % 5]);
			vo.setReply("댓글 테스트 " + i);
			vo.setReplyer("replyer" +i);
			
			mapper.insert(vo);
		});		
		
	}
	
	@Test
	public void testRead() {
		Long targetRno = 5L;
		
		ReplyVO vo = mapper.read(targetRno);
		
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		
		Long tagetRno = 5L;
		
		
		mapper.delete(tagetRno);
	}
	
	@Test
	public void testUpdate() {
		Long targetRno = 8L;
		
		
		ReplyVO vo = mapper.read(targetRno);
		
		log.info("vo  .. :" + vo);
		
		vo.setReply("updly....");
		
		int count = mapper.update(vo);
		log.info("update Count : " + count);
	}
	
	
	

}
