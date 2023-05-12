package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	//spring 4.3 이상에서 자동처리
	//private BoardMapper boardMapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;

	@Override
	public void register(BoardVO board) {
		// TODO Auto-generated method stub
		log.info("register........" + board);
		
		boardMapper.insertSelectKey(board);
		
	}

	@Override
	public BoardVO get(Long bno) {
		// TODO Auto-generated method stub
		log.info("get........." +  bno);
		
		return boardMapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		// TODO Auto-generated method stub
		return boardMapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		return boardMapper.delete(bno) == 1;
	}

	@Override
	public List<BoardVO> getList() {
		// TODO Auto-generated method stub
		
		log.info("getList............");
		
		return boardMapper.getList();
	}
	
	
	
	
	
	
	

}
