package com.springbook.biz.Mark;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;



public interface MarkRepository extends JpaRepository<Mark, Integer> {

    @Query("SELECT m FROM Mark m WHERE m.boardNo = :boardNo and m.userCode = :userCode") // 로그인
    Mark findMark(@Param("boardNo")Integer boardNo,@Param("userCode")Integer userCode);
   
}
