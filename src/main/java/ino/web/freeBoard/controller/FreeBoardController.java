package ino.web.freeBoard.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
//import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.DefaultNamingPolicy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import ino.web.freeBoard.dto.Criteria;
import ino.web.freeBoard.dto.FreeBoardDto;
import ino.web.freeBoard.dto.FreeBoardFileDto;
import ino.web.freeBoard.dto.PageMaker;
import ino.web.freeBoard.dto.Pagination;
import ino.web.freeBoard.dto.SearchCriteria;
import ino.web.freeBoard.service.FreeBoardFileService;
import ino.web.freeBoard.service.FreeBoardService;

@Controller	
public class FreeBoardController {

	@Autowired
	private FreeBoardService freeBoardService;
	
	@Autowired
	private FreeBoardFileService fileBoardService;
	
	
	
	/*@Resource(name="uploadPath")
	String uploadPath;*/

	/*@RequestMapping("/main.ino")
	public ModelAndView main(HttpServletRequest request, FreeBoardDto dto) {
		ModelAndView mav = new ModelAndView();

		List list = freeBoardService.freeBoardList();
		// List list = freeBoardService.freeBoardList2();

		mav.setViewName("boardMain");
		mav.addObject("freeBoardList", list);
		return mav;
	}*/
	@RequestMapping("/main.ino")
	public String list(Model model, Criteria cri) throws Exception {
		
		PageMaker pageMaker = new PageMaker();
		
		model.addAttribute("freeBoardList", freeBoardService.freeBoardList1(cri));
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(freeBoardService.listCount());
		model.addAttribute("pageMaker",pageMaker);
	
		
		return "boardMain";
	}

	
	@RequestMapping("/filemain.ino")
	public ModelAndView filemain(HttpServletRequest request, FreeBoardFileDto fdto) {
		ModelAndView mav = new ModelAndView();
		List<FreeBoardFileDto> list = freeBoardService.fileBoardList();
		
		mav.setViewName("fileBoardMain");
		mav.addObject("fileBoardList", list);
		return mav;
	}
	@RequestMapping("/listSearch.ino")
	public void listSearch(@ModelAttribute("scri") SearchCriteria scri, Model model ) throws Exception {
		
		List<FreeBoardDto> list = freeBoardService.listSearch(scri);
		model.addAttribute("list", list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(freeBoardService.countSearch(scri));
		model.addAttribute("pageMaker", pageMaker);
		
	}


	@RequestMapping("/freeBoardSelect.ino")
	public String freeBoardSelect() {
		return "freeBoardSelect";
	}
	
	@RequestMapping("/freeBoardInsert.ino")
	public String freeBoardInsert() {
		return "freeBoardInsert";
	}
	
	@RequestMapping("/freeBoardInsertPro.ino")
	public String freeBoardInsertPro(HttpServletRequest request, FreeBoardDto dto) {

		freeBoardService.freeBoardInsertPro(dto);

		return "redirect:freeBoardDetail.ino?num=" + dto.getNum();

	}

	@RequestMapping("/freeBoardDetail.ino")
	public ModelAndView freeBoardDetail(HttpServletRequest request) {
		
		int num = Integer.parseInt(request.getParameter("num"));
		FreeBoardDto dto = freeBoardService.getDetailByNum(num);

		System.out.println(dto.toString());

		return new ModelAndView("freeBoardDetail", "freeBoardDto", dto);
	}
	
	@RequestMapping("/fileBoardDetail.ino")
	public ModelAndView fileBoardDetail(HttpServletRequest request) {
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		FreeBoardFileDto fdto = freeBoardService.fileBoardDetailByNum(seq);
		
		return new ModelAndView("fileBoardDetail", "freeBoardFileDto", fdto);
	}
	
	@RequestMapping("/freeBoardModifyPro.ino")
	public String freeBoardModifyPro(HttpServletRequest request, FreeBoardDto dto) {

		freeBoardService.freeBoardModifyPro(dto);

		return "redirect:main.ino";
	}
	@RequestMapping("/freeBoardDeletePro.ino")
	public String freeBoardDeletePro(HttpServletRequest request, FreeBoardDto dto) {
		int num = Integer.parseInt(request.getParameter("num"));
		freeBoardService.freeBoardDeletePro(num);
		
		return "redirect:main.ino";
	}
	@RequestMapping("/fileBoardDeletePro.ino")
	public String fileBoardDeletePro(HttpServletRequest request, FreeBoardFileDto fdto) {
		int seq = Integer.parseInt(request.getParameter("seq"));
		System.out.println(seq);
		freeBoardService.fileBoardDeletePro(fdto, seq);
		
		return "redirect:filemain.ino";
	}
	/*@RequestMapping("/filemain.ino") 
	public String hello(HttpServletRequest request) {
		
		return "fileBoardMain";
	}*/
	@RequestMapping("/fileBoardInsert.ino")
	public String fileBoardInsert() {
		return "fileBoardInsert";
	}
	@RequestMapping(value = "/fileBoardInsertPro.ino", method=RequestMethod.POST)
	public String freeBoardInsertPro1(HttpServletRequest request, FreeBoardDto dto,@RequestParam("file") MultipartFile freeboardimagefile ) throws Exception {
		

		FreeBoardFileDto fdto = new FreeBoardFileDto();
		
		fdto.setName(request.getParameter("name"));
		fdto.setTitle(request.getParameter("title"));
		fdto.setContent(request.getParameter("content"));
		//freeBoardFileDto.setBoardfilename(request.getParameter("boardfilename"));
		
		if(freeboardimagefile.isEmpty()) {
			freeBoardService.fileInsert(fdto);
		}else {
			String BoardimageFile = freeboardimagefile.getOriginalFilename();
			String BoardimageOriName = freeboardimagefile.getOriginalFilename();
			String fileNameExtension = FilenameUtils.getExtension(BoardimageOriName).toLowerCase();
			File destinationFile;
			
			String destinationFileName;
			
			String boardimageUrl = "C:\\Users\\zinkki\\Desktop\\eGovFrameDev-3.7.0-64bit\\workspace\\zpic\\";
			
			do {
				destinationFileName=RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
				destinationFile = new File(boardimageUrl + destinationFileName);
			}while(destinationFile.exists());
			
				destinationFile.getParentFile().mkdir();
				freeboardimagefile.transferTo(destinationFile);
				
				fdto.setBoardimagegefile(BoardimageFile);
				//freeBoardFileDto.setBoardfilename(Boardfilename);
				fdto.setBoardimageName(destinationFileName);
				fdto.setBoardimageOriName(BoardimageOriName);
				fdto.setBoardimageUrl(boardimageUrl);
				
				System.out.println("FreeBoardController : " + fdto);
				
				freeBoardService.fileInsert(fdto);
			}
			return "redirect:fileBoardDetail.ino?seq=" + fdto.getSeq();
		
		
		//FreeBoardDto postDto = freeBoardService.afterInsert(maxNum);
		
		}
	
	
	

}
