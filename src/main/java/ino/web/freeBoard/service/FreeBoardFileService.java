package ino.web.freeBoard.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ino.web.freeBoard.dto.FreeBoardDto;
import ino.web.freeBoard.dto.FreeBoardFileDto;

@Service
public class FreeBoardFileService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/*public List<FreeBoardFileDto> freeBoardFileList() {
		return sqlSessionTemplate.selectList("freeBoardFileGetList");
	}
	
	public FreeBoardFileDto getDetailByNum(int num){
		return sqlSessionTemplate.selectOne("freeBoardFileDetailByNum", num);
	}
	
	public void freeBoardFileInsertPro(FreeBoardFileDto fdto) {
		sqlSessionTemplate.insert("freeBoardFileInsertPro", fdto);
	}
	
	public void fileBoardDeletePro(int seq) {
		sqlSessionTemplate.delete("fileBoardDeletePro", seq);
	}*/
	
}
