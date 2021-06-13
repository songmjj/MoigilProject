package com.springbook.biz.gallery;


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
		  name = "Gallery_SEQ_GENERATOR", // 시퀀스 제러레이터 이름
		  sequenceName = "Gallery_SEQ", // 매핑할 데이터베이스 시퀀스 이름 
		  initialValue = 1, // 시작값
		  allocationSize = 1) // 메모리를통해 할당 사이즈
@Table(name="TB_Gallery")
public class Gallery  {
	@Id
	@GeneratedValue(
            strategy=GenerationType.SEQUENCE, //사용할 전략을 시퀀스로  선택
            generator="Gallery_SEQ_GENERATOR" //식별자 생성기를 설정해놓은  설정        
            )
	private Integer galleryNo; // 글번호
	private String galleryTitle; // 글제목
	private String galleryContents; // 글내용
	
//	@ElementCollection				// @ElementCollection 애노테이션은 매핑 대상이 값 콜렉션임을 지정함
//	@CollectionTable(
//		    	name = "filenames",
//		    	joinColumns = @Join(name = "student_id")
//	)
//	@OrderColumn(name = "filename_idx") // 콜렉션 테이블에서 리스트의 인덱스 값을 지정할 칼럼 이름을 지정함
//	@Column(name = "filename") 		// 특정 index 안에 개별 값을 저장할 칼럼을 지정
	private String filenames; // 이미지 파일명

	@Override
	public String toString() {
		return "Gallery [galleryNo=" + galleryNo + ", galleryTitle=" + galleryTitle + ", galleryContents="
				+ galleryContents + ", filenames=" + filenames + "]";
	}

	
}
