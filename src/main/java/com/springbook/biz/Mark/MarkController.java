package com.springbook.biz.Mark;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MarkController {
	@Autowired
	private MarkRepository DAO;
	
	@RequestMapping("MarkRatingLike.do")
	public String boardRatingLike(Mark mark) {
		Mark markchk = DAO.findMark(mark.getBoardNo(), mark.getUserCode());
		if(markchk != null) {
		}else {
			DAO.save(mark);
			return "BoardRatingLike.do";
		}
		return "Board.do";
	}
	
	@RequestMapping("MarkRatingHate.do")
	public String boardRatingHate(Mark mark) {
		Mark markchk = DAO.findMark(mark.getBoardNo(), mark.getUserCode());
		if(markchk != null) {
			DAO.delete(mark);
			return "boardRatingHate.do";
		}else {
		}
		return "Board.do";
	}

	 
	
	
}
