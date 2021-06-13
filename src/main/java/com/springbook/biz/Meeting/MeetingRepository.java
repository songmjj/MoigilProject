package com.springbook.biz.Meeting;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;



public interface MeetingRepository extends JpaRepository<Meeting, Integer> {

	@Query("SELECT m FROM Meeting m WHERE m.meetingTitle like %:searchKeyword%")
	public Page<Meeting> findByMeetingtitle(String searchKeyword, Pageable pageable);

	@Query("SELECT m FROM Meeting m WHERE m.meetingContents like %:searchKeyword%")
	public Page<Meeting> findByMeetingcontent(String searchKeyword, Pageable pageable);
}
