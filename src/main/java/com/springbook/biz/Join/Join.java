package com.springbook.biz.Join;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@SequenceGenerator(
		  name = "Join_SEQ_GENERATOR", // 시퀀스 제러레이터 이름
		  sequenceName = "Join_SEQ", // 매핑할 데이터베이스 시퀀스 이름 
		  initialValue = 1, // 시작값
		  allocationSize = 1) // 메모리를통해 할당 사이즈
@Table(name="TB_Join")
public class Join {
	@Id // 기본키
    @GeneratedValue(
            strategy=GenerationType.SEQUENCE, //사용할 전략을 시퀀스로  선택
            generator="Join_SEQ_GENERATOR" //식별자 생성기를 설정해놓은  설정        
            )
	private Integer no; // 번호
	private Integer meetingNo; // 번호
	private Integer userCode; // 유저코드 
	private String id; // 유저 아이디

}
