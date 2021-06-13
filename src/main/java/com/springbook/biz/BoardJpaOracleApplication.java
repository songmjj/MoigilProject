package com.springbook.biz;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class BoardJpaOracleApplication {

	public static void main(String[] args) {
		SpringApplication.run(BoardJpaOracleApplication.class, args);
		System.out.println("Application 시작~ ^^"); // Console 출력 문 입력 저장
	}

}
