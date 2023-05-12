package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardService {
	
	public void register(BoardVO board); //등록
	
	public BoardVO get(Long bno); //읽기 

	public boolean modify(BoardVO board); //수정 , 수정이 성공 실패
	
	public boolean remove(Long bno); //삭제, 삭제가 성공 실패
	
	public List<BoardVO> getList();	//리스트 전부다 가져오기
	
}
