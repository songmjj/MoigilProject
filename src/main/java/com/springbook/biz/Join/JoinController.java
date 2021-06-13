package com.springbook.biz.Join;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;




@Controller
public class JoinController {
	@Autowired
	private JoinRepository DAO;
	
	@RequestMapping("getJoinList.do")
	public String getJoinList(@RequestParam("meetingNo")Integer no,Model model) {
		ArrayList<Join> join = DAO.JoinlistDesc(no);
		model.addAttribute("Join",join);
		return "joinList.jsp";
	}
	
	@RequestMapping("deleteJoin.do")
	public String deleteJoin(Join join){
		DAO.deleteById(join.getNo());
		return "getMeeting.do?person=1";
	}

	
	@RequestMapping("insertJoin.do")
	public String insertJoin(Join join) {
		Join joinchk = DAO.findJoin(join.getMeetingNo(), join.getUserCode());
		System.out.println(joinchk);
		if(joinchk != null) {
		}else { //null이라면
			DAO.save(join);
			return "getMeeting.do?person=-1";
		}
		return "getMeeting.do";
	}

	

	 
	
	
}
