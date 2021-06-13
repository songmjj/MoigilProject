package com.springbook.biz.Meeting;






import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class MeetingController {
	
	@Autowired
	private MeetingRepository DAO;
	
	@PostMapping("insertMeeting.do") // 글쓰기
	public String insertMeeting(Meeting Meeting) {
		DAO.save(Meeting);
	  return "getMeetingList.do";
	}
	
	@RequestMapping("getMeeting.do") // 글보기
	public String getMeeting(Model model,Meeting Meeting,@RequestParam(name="person",defaultValue = "0")Integer person) {
		Meeting = DAO.findById(Meeting.getMeetingNo()).get();
		Meeting.setCount(Meeting.getCount()+person);
		DAO.save(Meeting); // 데이터베이스에 저장	
		model.addAttribute("Meeting",Meeting);
	  return "getMeeting.jsp";
	}
	
	
	@RequestMapping("getMeetingList.do")
	public String getMeetingList(Model model,@RequestParam(name="PageNo",defaultValue = "0")Integer pNo, 
			@RequestParam(name="searchCondition",defaultValue = "0")String searchCondition,
			@RequestParam(name="searchKeyword",defaultValue = "0")String searchKeyword){
		if (searchCondition.equals("TITLE") && searchKeyword != null) {
			Pageable pageable = PageRequest.of(pNo, 10,Sort.Direction.ASC,"meetingNo");
			Page<Meeting> page = DAO.findByMeetingtitle(searchKeyword, pageable);
			model.addAttribute("page", page);
			return "getMeetingList.jsp";
		}else if (searchCondition.equals("CONTENT") && searchKeyword != null) {
			Pageable pageable = PageRequest.of(pNo, 10,Sort.Direction.ASC,"meetingNo");
			Page<Meeting> page = DAO.findByMeetingcontent(searchKeyword, pageable);
			model.addAttribute("page", page);
			return "getMeetingList.jsp";
		}
		Pageable pageable = PageRequest.of(pNo, 10,Sort.Direction.ASC,"meetingNo");
		Page<Meeting> page = DAO.findAll(pageable);
		model.addAttribute("page", page);
		return "getMeetingList.jsp";
	}
	
    // 글 삭제
    @RequestMapping("deleteMeeting.do")
    public String deleteMeeting(Meeting meeting) {
    	DAO.deleteById(meeting.getMeetingNo());
    	return "getMeetingList.do";
    }
    // 글수정
	@RequestMapping("editMeeting.do") 
	  public String editMeeting(@RequestParam("meetingNo")Integer no,Model model) {
		Meeting meeting = DAO.findById(no).get();
		model.addAttribute("Meeting",meeting);
	      return "updateMeeting.jsp";
	}


	 
	
	
}
