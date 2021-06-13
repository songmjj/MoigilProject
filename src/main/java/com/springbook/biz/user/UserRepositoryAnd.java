package com.springbook.biz.user;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepositoryAnd extends JpaRepository<User, String>{
	
      
      Optional<User> findByIdAndPw(String id, String pw);
      
      
}
