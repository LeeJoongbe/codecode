package org.zerock.controller;


import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.context.WebApplicationContext;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j2
//@AllArgsConstructor
public class BoardControllerTests {
	
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception{
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}
	
	@Test
	public void testRegister() throws Exception{
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
				.param("title", "컨트롤러에서 작성한 제목")
				.param("content", "컨트롤러에서 작성한 내용")
				.param("writer", "컨트롤러에서 작성한 작성자")
				).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	@Test
	public void testGet() throws Exception{
		
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/get")
				.param("bno", "13"))
				.andReturn().getModelAndView().getModelMap()
				);
		
	}
	
	@Test
	public void testModify() throws Exception{
		log.info("test start");
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/modify")
				.param("bno", "1")
				.param("title", "컨트롤러 테스트")
				.param("content", "컨트롤러 테스트내용")
				.param("writer", "user00")).andReturn().getModelAndView().getViewName();
				
		
		log.info("resultPage : " + resultPage);
				
	}
	
	@Test
	public void testRemove() throws Exception{
		//존재하는 게시물 번호
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
				.param("bno", "25"))
				.andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
				
		
	}
	
	@Test
	public void testListPaging() throws Exception {
		log.info(mockMvc.perform(
				MockMvcRequestBuilders.get("/board/list")
				.param("pageNum", "1")
				.param("amount", "50"))
				.andReturn().getModelAndView().getModelMap()
				);
	}
	
	
	
	
}













