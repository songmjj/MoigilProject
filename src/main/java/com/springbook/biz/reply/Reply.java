package com.springbook.biz.reply;

//댓글 도메인 혹은 빈 파일
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@SequenceGenerator(
		  name = "Reply_SEQ_GENERATOR", // 시퀀스 제러레이터 이름
		  sequenceName = "Reply_SEQ", // 매핑할 데이터베이스 시퀀스 이름 
		  initialValue = 1, // 시작값
		  allocationSize = 1) // 메모리를통해 할당 사이즈
@Table(name="TB_Reply")
public class Reply {
	@Id // 기본키
    @GeneratedValue(
            strategy=GenerationType.SEQUENCE, //사용할 전략을 시퀀스로  선택
            generator="Reply_SEQ_GENERATOR" //식별자 생성기를 설정해놓은  설정        
            )
	private Integer userReplyNo; //댓글번호
	private Integer boardNo; // 글번호
	private String id; // 유저 아이디
	private Integer userCode; // 유저코드 
	private String areaCode; //지역코드
	private String userReply;   // 댓글내용
	private String replyDate;  //댓글등록날짜
	
	
	@PrePersist // 방법 2 방법1 널값 default 적용 (insert 되기전 실행됨)
	public void prePersist() {
		this.replyDate = this.replyDate == null ? new SimpleDateFormat("yyyy-MM-dd").format(new Date()) : this.replyDate;
	}

}
