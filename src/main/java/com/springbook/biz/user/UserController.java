package com.springbook.biz.user;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class UserController {
	@Autowired
	private UserRepository DAO;
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String index() {
	return "index.jsp";
	}
	
	
	@PostMapping("login.do") // 로그??
	  public String login(User user, HttpSession session) {
	      User login = DAO.findUser(user.getId(), user.getPw());
	      session.setAttribute("user", login);
	      if(login != null) {
	          return "index.jsp";
	      }
	      return "index.jsp";
	  }
	
	@PostMapping("createUser.do") // 계정생성
	  public String create(User user) {
		DAO.save(user);
	      return "index.jsp";
	  }
	
	@RequestMapping("logout.do") // 로그아웃
	  public String logout(HttpSession session) {
		session.invalidate();
	      return "index.jsp";
	  }

	@PostMapping("updateUser.do") // 
	  public String updateUser(User user, HttpSession session) {
		System.out.println("성공됨");
		DAO.save(user); // save 
		session.setAttribute("userPage", user);
		return "index.jsp";
	  }

	@GetMapping("updateUser.do") // 회원수정
	  public String updateUserPage(HttpSession session) {
		System.out.println("성공");
		User auth = (User)session.getAttribute("user");
		User userPage = DAO.findUser(auth.getId());
		userPage.setPw("");
		session.setAttribute("userPage", userPage);
		return "updateUser.jsp";
	  }
	
	
	@RequestMapping("deleteUser.do") // 계정??��
	  public String deleteUser(User user, HttpSession session) {
		DAO.deleteById(user.getUserCode());
		session.invalidate();
	      return "index.jsp";
	  }
	
	@RequestMapping(value="/idChk.do") // 중복체크
	public String idchk(HttpServletRequest req) {
		String id = req.getParameter("id");
		Integer idchk = DAO.idChk(id);
		if(idchk >= 1) {
			req.setAttribute("msg", "사용불가합니다.");
			req.setAttribute("result", "1");
			return "idChk.jsp";
		}
			req.setAttribute("msg", "사용가능합니다.");
			req.setAttribute("result", "0");
		return "idChk.jsp";
	}

	@RequestMapping("/getId.do")
	   public String getId(User user, HttpSession req){
		System.out.println("id찾기 실행됨");
	      try{
	      User getId = DAO.getId(user.getName(),user.getEmail());
	      req.setAttribute("id", getId.getId());
	            return "foundId.jsp";
	      }catch (NullPointerException e) {
	         return "noUser.jsp";
	      }
	   }
	   
	   @RequestMapping("/getPw.do")
	      public String getPw(User user, HttpSession req){
	         try{
	           User getPw = DAO.getPw(user.getId(),user.getEmail());
	           System.out.println(getPw);
	           req.setAttribute("userPw", getPw.getPw());
	           
	            return "foundPw.jsp";
	         }catch (NullPointerException e) {
	            return "noUser.jsp";
	         }
	      }


	 
	@RequestMapping(value="upload.do", method=RequestMethod.POST)
	@ResponseBody
	public String saveFile(HttpServletRequest request) throws IOException {
		String imageFolder = request.getParameter("imageFolder");
		String imgFolder ="\\" + imageFolder + "\\"; //저장할 경로
		String realFolder = request.getRealPath("/") + imgFolder; //web-inf바로전 까지 저장할 경로
		MultipartHttpServletRequest multipartRequest =  (MultipartHttpServletRequest)request;
		MultipartFile file = multipartRequest.getFile("imageFile"); //단일 파일 업로드
		String filename = file.getOriginalFilename();

		File ufile = new File(realFolder + file.getOriginalFilename());
		file.transferTo((ufile));

		return filename;
	}
	
	@RequestMapping(value = "update_mypage.do", method = RequestMethod.POST)
	public String update_mypage(User user, HttpSession session, RedirectAttributes rttr) throws Exception{
		DAO.save(user);
		session.setAttribute("user",user);
		rttr.addFlashAttribute("msg", "회원정보저장완료");
		return "redirect:/myPage.jsp";
	}
	

	// 비�?번호 변�?
	@RequestMapping(value = "update_pw.do", method = RequestMethod.POST)
	public String update_pw(User user, HttpSession session) throws Exception{
		DAO.save(user);
		session.setAttribute("user",user);
		return "index.jsp";
	}

}
	

