package com.springbook.biz.Join;


import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface JoinRepository extends JpaRepository<Join, Integer> {

    @Query("SELECT j FROM Join j WHERE j.meetingNo = :meetingNo and j.userCode = :userCode") 
    Join findJoin(@Param("meetingNo")Integer meetingNo,@Param("userCode")Integer userCode);
    
	   @Query("SELECT j FROM Join j WHERE j.meetingNo =:meetingNo order by j.no desc")
	   ArrayList<Join> JoinlistDesc(@Param("meetingNo")Integer meetingNo);
   
}
