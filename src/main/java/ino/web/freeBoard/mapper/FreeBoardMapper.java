package ino.web.freeBoard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.annotation.MapperScan;

import ino.web.freeBoard.dto.FreeBoardDto;
import ino.web.freeBoard.dto.FreeBoardFileDto;

public interface FreeBoardMapper {
	
	  @Select("SELECT NUM, TITLE, NAME, TO_CHAR(REGDATE,'YYYY-MM-DD') REGDATE, CONTENT FROM FREEBOARD ORDER BY LPAD( NUM, 5 ) DESC")
	  public FreeBoardDto freeBoardGetList2();
	
	  @Insert("INSERT INTO SEQUENCE_FREEBOARDFILE VALUES(#{seq}, #{title}, #{name}, now(), #{content}, #{boardimagegefile},  #{boardimageName}, #{boardimageOriName}, #{boardimageUrl})")
		public int insert(FreeBoardFileDto freeBoardFileDto);
}



