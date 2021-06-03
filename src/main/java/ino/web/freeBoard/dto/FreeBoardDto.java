package ino.web.freeBoard.dto;

import org.apache.ibatis.type.Alias;
//import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartFile;

@Alias("freeBoardDto")
public class FreeBoardDto {

	private int NUM;
	private String title;
	private String name;
	private String regdate;
	private String content;
	private int readcnt;
	private String file_name;  //얘는 살려야댐
	private int startIndex;
	private int cntPerPage;
	
	
	
	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public FreeBoardDto() {}
	
	public int getNum() {
		return NUM;
	}
	public void setNum(int num) {
		this.NUM = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	@Override
	public String toString() {
		return "FreeBoardDto [NUM=" + NUM + ", title=" + title + ", name=" + name + ", regdate=" + regdate
				+ ", content=" + content + ", readcnt=" + readcnt + "]";
	}

	
}
