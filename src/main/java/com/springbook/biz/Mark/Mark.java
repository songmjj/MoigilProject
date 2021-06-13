package com.springbook.biz.Mark;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="TB_Mark")
public class Mark {
	@Id // 기본키
	private Integer boardNo; // 번호
	private Integer userCode; // 유저코드
	private Integer boardRating;
	
	
	@PrePersist // 방법 2 방법1 널값 default 적용 (insert 되기전 실행됨)
	public void prePersist() {
		this.boardRating = this.boardRating == null ? 1 :this.boardRating;
	}
}
