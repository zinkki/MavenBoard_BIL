package ino.web.freeBoard.dto;
import org.apache.ibatis.type.Alias;
import java.util.Date;


public class FreeBoardFileDto {
	
	private int seq;
	private String name;
	private String title;
	private String content;
	private String boardimagefile;
	//private String boardfilename;
	private String boardimageName;
	private String boardimageOriName;
	private String boardimageUrl;
	private Date regdate;
	//private String del_yn ; // 게시글 삭제 유무
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBoardimagegefile() {
		return boardimagefile;
	}
	public void setBoardimagegefile(String boardimagegefile) {
		this.boardimagefile = boardimagegefile;
	}
	public String getBoardimageName() {
		return boardimageName;
	}
	public void setBoardimageName(String boardimageName) {
		this.boardimageName = boardimageName;
	}
	public String getBoardimageOriName() {
		return boardimageOriName;
	}
	public void setBoardimageOriName(String boardimageOriName) {
		this.boardimageOriName = boardimageOriName;
	}
	public String getBoardimageUrl() {
		return boardimageUrl;
	}
	public void setBoardimageUrl(String boardimageUrl) {
		this.boardimageUrl = boardimageUrl;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	
	
//	public String getDel_yn() {
//		return del_yn;
//	}
//	public void setDel_yn(String del_yn) {
//		this.del_yn = del_yn;
//	}
	
	@Override
	public String toString() {
		return "FreeBoardFileDto [seq=" + seq + ", name=" + name + ", title=" + title + ", content=" + content
				+ ", boardimagegefile=" + boardimagefile + ", boardimageName=" + boardimageName
				+ ", boardimageOriName=" + boardimageOriName + ", boardimageUrl=" + boardimageUrl + ", regdate="
				+ regdate + "]";
	}
	
	
}
