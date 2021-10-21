package com.springrest.library.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.springrest.library.model.Authors;

 
@Service
public class AuthorsServicesImpl implements AuthorsServices {

	private RestTemplate restTemplate;

	@Autowired
	public AuthorsServicesImpl(RestTemplateBuilder restTemplateBuilder) {
		 this.restTemplate = restTemplateBuilder.build();
	}

	public List<Authors> getAllAuthors() {
		 
		List<Authors> list = restTemplate.exchange("http://localhost:9090/authors", HttpMethod.GET, null, List.class).getBody();
		return list;
	}
}
