package com.springbook.biz.reply;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReplyController {
	@Autowired
	private ReplyRepository DAO;
	
	@RequestMapping("getReplyList.do")
	public String getReplyList(@RequestParam("boardNo")Integer no,Model model) {
		ArrayList<Reply>reply = DAO.ReplylistDesc(no);
		model.addAttribute("ReplyList",reply);
		return "getBoard.jsp";
	}
	
	@RequestMapping("insertReply.do")
	public String insertBoard(Reply reply) {
		DAO.save(reply);
	  return "Board.do";
	}
	
	@RequestMapping("deleteReply.do")
	public String deleteReply(Reply reply){
		DAO.deleteById(reply.getUserReplyNo());
		return "Board.do";
	}
	
	@RequestMapping("editReply.do")
	  public String editBoard(@RequestParam("userReplyNo")Integer no,Model model) {
		Reply reply = DAO.findById(no).get();
		model.addAttribute("reply",reply);
	      return "getReply.jsp";
	  }
	

	 
	
	
}
