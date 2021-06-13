package com.springbook.biz.user;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@Controller
public class UserControllerAnd {
	@Autowired
	private UserRepositoryAnd DAO;
	
	@PostMapping("/login")
	public User loginUsers(@RequestBody User user) {
		Optional<User> login = DAO.findByIdAndPw(user.getId(), user.getPw());
		if(login.isPresent()) {
			System.out.println("안드 로그인");
			System.out.println(login.get());
			return login.get();
		}
		else {
			throw new RuntimeException();
		}
	}
}
	

