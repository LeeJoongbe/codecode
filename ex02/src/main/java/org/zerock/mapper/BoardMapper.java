package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {//부트에서 repository와 같은 역활인거같은데?? 위치만 같나?
	
//	@Select("select * from tbl_board where bno > 0") XML을 사용함으로 제거
	public List<BoardVO> getList();

	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public void insert(BoardVO board); //저장하고 pk값이 필요 없는 경우
	
	public int insertSelectKey(BoardVO board); //저장하고 pk값이 필요 있는 경우
	
	public BoardVO read(Long bno);	//읽기 BoardVO 타입이고 다음으로 mapper xml을 작성한다.
	
	public int delete(Long bno); //삭제방법  반환값으로 int값을 갖는다.
	
	public int update(BoardVO board); //수정 BoardVO타입을 매개변수로 받고 반환타입 int
	
	public int getTotalCount(Criteria cri);
	
}
