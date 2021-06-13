package com.springbook.biz.gallery;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.springbook.biz.board.Board;

@Controller
public class GalleryController {
	
	@Autowired
	GalleryRepository galleryRepository;
	
	@RequestMapping(value="imageUpload.do", method=RequestMethod.POST)
	@ResponseBody
	public String uploadMulti(@RequestParam("imageFile") List<MultipartFile> imageFiles, HttpServletRequest request) throws IOException {
		ServletContext rootPath = request.getSession().getServletContext();
		String basePath = rootPath.getRealPath("/galleryImg") + "/" ;
		// 파일 업로드(여러개) 처리 부분
		for(MultipartFile file : imageFiles) {
//	        String originalName = file.getOriginalFilename();
			String destinationFileName = RandomStringUtils.randomAlphanumeric(20) + ".png";
			String filePath = basePath + "/" + destinationFileName;
			File dest = new File(filePath);
			file.transferTo(dest);
			return destinationFileName;
		}
		return "uploaded.jsp";
	}
	
	
	// 갤러리 새글 등록
	@RequestMapping("galleryUpload.do") // 로그?�웃
	  public String logout(Gallery gallery) {
		galleryRepository.save(gallery);
	    return "getGalleryList.do";
	  }
	
	
	// 갤러리 글 리스트
	//글 리스트 불러오기 페이지단위로 부른다.
	@RequestMapping("getGalleryList.do")
	public String getBoardlist(Model model,@RequestParam(name="galleryNo",defaultValue = "0")Integer gNo
							  ){
		
		Pageable pageable = PageRequest.of(gNo, 10,Sort.Direction.ASC,"galleryNo");
		Page<Gallery> page = galleryRepository.findAll(pageable);
		model.addAttribute("page", page);
		return "getGalleryList.jsp";
	}
	
	// 글 보기
    @RequestMapping("getGallery.do")
	public String getBoard(Model model, Gallery gallery) {
		gallery = galleryRepository.findById(gallery.getGalleryNo()).get();
//		gallery.setBoardHits(gallery.getBoardHits()+1); // 조회수 1증가
		galleryRepository.save(gallery); // 데이터베이스에 저장
		model.addAttribute("gallery",gallery);
	  return "getGallery.jsp";
	}
	
	// 글 삭제
    @RequestMapping("deleteGallery.do")
    public String deleteBoard(Gallery gallery) {
    	galleryRepository.deleteById(gallery.getGalleryNo());
    	return "getGalleryList.do";
    }	
		
    // 글수정
  	@RequestMapping("editGallery.do") 
  	  public String editBoard(Model model, @RequestParam(name="galleryNo",defaultValue = "0")Integer gNo) {
  		Gallery gallery = galleryRepository.findById(gNo).get();
  		model.addAttribute("gallery",gallery);
  	      return "updateGallery.jsp";
  	}	
		

	
}
