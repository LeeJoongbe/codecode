package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;

public interface BoardMapper {//부트에서 repository와 같은 역활인거같은데?? 위치만 같나?
	
//	@Select("select * from tbl_board where bno > 0") XML을 사용함으로 제거
	public List<BoardVO> getList();

	public void insert(BoardVO board); //저장하고 pk값이 필요 없는 경우
	
	public void insertSelectKey(BoardVO board); //저장하고 pk값이 필요 있는 경우
	
}
