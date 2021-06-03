
package ino.web.freeBoard.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ino.web.freeBoard.dto.Criteria;
import ino.web.freeBoard.dto.FreeBoardDto;
import ino.web.freeBoard.dto.FreeBoardFileDto;
import ino.web.freeBoard.dto.SearchCriteria;

@Service
public class FreeBoardService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	//자유게시판리스트
	/*public List<FreeBoardDto> freeBoardList(){
		return sqlSessionTemplate.selectList("freeBoardGetList");
	}*/
	public List<FreeBoardDto> freeBoardList1(Criteria cri) throws Exception{
		return sqlSessionTemplate.selectList("freeBoardGetList", cri);
	}
	public int listCount() throws Exception {
		return sqlSessionTemplate.selectOne("listCount");
	}
	//목록+페이징+검색
	public List<FreeBoardDto> listSearch(SearchCriteria scri) throws Exception{
		return sqlSessionTemplate.selectList("listSearch", scri);
	}
	//검색결과 갯수
	public int countSearch(SearchCriteria scri) throws Exception {
		return sqlSessionTemplate.selectOne("countSearch", scri);
	}
	
	//자료실리스트
	public List<FreeBoardFileDto> fileBoardList() {
		return sqlSessionTemplate.selectList("fileBoardGetList");
	}
	//게시물갯수
	public int freeBoardCnt() {
		return sqlSessionTemplate.selectOne("num");
	}
	public List freeBoardList2(){
		return sqlSessionTemplate.selectList("freeBoardGetList2");
	}
	//자유게시판 글쓰기
	public void freeBoardInsertPro(FreeBoardDto dto){
		sqlSessionTemplate.insert("freeBoardInsertPro",dto);
	}
	//자료실 글쓰기
	public void fileInsert(FreeBoardFileDto fdto) {
		sqlSessionTemplate.insert("fileInsertPro", fdto);
	}

	public FreeBoardDto getDetailByNum(int num){
		return sqlSessionTemplate.selectOne("freeBoardDetailByNum", num); 
	}
	
	public FreeBoardFileDto fileBoardDetailByNum(int seq) {
		return sqlSessionTemplate.selectOne("fileBoardDetailByNum", seq);
	}
	
	public FreeBoardDto getModifyByNum(int num){
		return sqlSessionTemplate.selectOne("freeBoardModifyByNum", num); 
	}
	
	public void freeBoardSelect(int num) {
		sqlSessionTemplate.selectOne("freeBoardSelect", num);
	}
	
	public void freeBoardModifyPro(FreeBoardDto dto) {
		sqlSessionTemplate.update("freeBoardModifyPro", dto);
	}	
	
	public void freeBoardDeletePro(int num) {
		sqlSessionTemplate.delete("freeBoardDeletePro", num);
	}
	public void fileBoardDeletePro(FreeBoardFileDto fdto, int seq) {
		sqlSessionTemplate.delete("fileBoardDeletePro", seq);
	}
	
	public void freeBoardFileInsertPro(FreeBoardFileDto fdto) {
		sqlSessionTemplate.insert("freeBoardFileInsertPro", fdto);
	}
	public int totalCount(){
		return sqlSessionTemplate.selectOne("totalCount");
	}
	public void listAll() {
		sqlSessionTemplate.selectList("listAll");
	}
	
}
