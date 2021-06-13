package com.springbook.biz.user;


import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="TB_User")
public class User {
	
	@GeneratedValue(strategy = GenerationType.AUTO) // 레코드 추가할때마다 자동으로 1 씩 증가함
	@Id
	private Integer userCode;         
	private String name;             
	private String id;               
	private String pw;               
	private String birth;            
	private String postNum;                  
	private String phoneNum;         
	private String email;           
	private String address;          
	private String entDate;          		
	private String userImage;
	private String grade;
	
	@PrePersist 
	public void prePersist() {
		this.entDate = this.entDate == null ? new SimpleDateFormat("yyyy-MM-dd").format(new Date()) : this.entDate;
	}

	@Override
	public String toString() {
		return "User [userCode=" + userCode + ", name=" + name + ", id=" + id + ", pw=" + pw + ", birth=" + birth
				+ ", postNum=" + postNum + ", phoneNum=" + phoneNum + ", email=" + email + ", address=" + address
				+ ", entDate=" + entDate + ", userImage=" + userImage + "]";
	}
	
	
	
}
