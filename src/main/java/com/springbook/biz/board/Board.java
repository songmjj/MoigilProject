package com.springbook.biz.board;


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
		  name = "BOARD_SEQ_GENERATOR", // 시퀀스 제러레이터 이름
		  sequenceName = "BOARD_SEQ", // 매핑할 데이터베이스 시퀀스 이름 
		  initialValue = 1, // 시작값
		  allocationSize = 1) // 메모리를통해 할당 사이즈
@Table(name="TB_Board")
//@DynamicInsert   //(insert 시 null 인필드 제외) 방법1 널값 default 적용
//@DynamicUpdate //(update 시 null 인필드 제외) 방법1 널값 default 적용
public class Board {
	@Id
    @GeneratedValue(
            strategy=GenerationType.SEQUENCE, //사용할 전략을 시퀀스로  선택
            generator="BOARD_SEQ_GENERATOR" //식별자 생성기를 설정해놓은  설정        
            )
	private Integer boardNo;
	private String areaCode;
	private Integer userCode;
	private String grade;
	private String boardTitle;
	private String boardContents;
//	@ColumnDefault("TO_CHAR(SYSDATE,'YYYY-MM-DD')") // 방법1 널값 default 적용
	private String boardDate;
//	@ColumnDefault("0") // 방법1 널값 default 적용
	private Integer boardHits; // 조회수
	private Integer boardRatingLike; // 좋아요
	
	@PrePersist // 방법 2 방법1 널값 default 적용 (insert 되기전 실행됨)
	public void prePersist() {
		this.boardDate = this.boardDate == null ? new SimpleDateFormat("yyyy-MM-dd").format(new Date()) : this.boardDate;
		this.boardHits = this.boardHits == null ? 0 :this.boardHits;
		this.boardRatingLike = this.boardRatingLike == null ? 0 :this.boardRatingLike;
	}
	

}
