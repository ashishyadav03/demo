package com.springrest.library.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springrest.library.model.Login;
import com.springrest.library.repository.LoginRepository;

 
@Service
public class LoginServicesImpl implements LoginServices {
	
	@Autowired
	private LoginRepository loginRepository;

	
	public String getUserById(Login login) {
		Optional<Login> optional = loginRepository.findById(login.getUsername());
		String user = "false";
		if(optional.isPresent()) {
			Login optional1 = loginRepository.getById(login.getUsername());

			if((optional1.getPassword()).equals(login.getPassword())) {
				user="true";
			}
			else {
				user="false";
			}

		}
		return user;
	}

}
