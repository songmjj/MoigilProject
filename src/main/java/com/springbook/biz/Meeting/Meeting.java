package com.springbook.biz.Meeting;

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
		  name = "MEETING_SEQ_GENERATOR", // 시퀀스 제러레이터 이름
		  sequenceName = "MEETING_SEQ", // 매핑할 데이터베이스 시퀀스 이름 
		  initialValue = 1, // 시작값
		  allocationSize = 1) // 메모리를통해 할당 사이즈
@Table(name="TB_Meeting")
public class Meeting {
	@Id
    @GeneratedValue(
            strategy=GenerationType.SEQUENCE, //사용할 전략을 시퀀스로  선택
            generator="MEETING_SEQ_GENERATOR" //식별자 생성기를 설정해놓은  설정        
            )
	private Integer meetingNo;
	private Integer userCode;
	private String areaCode;
	private String id;
	private String meetingTitle; // 제목
	private String meetingContents; // 내용
	private String mapX; //시작지점
	private String mapY; //시작지점
	private String startpointX; //시작지점
	private String startpointY; //시작지점
	private String endpointX; //시작지점
	private String endpointY; //시작지점
	private Integer count; //인원수
}
