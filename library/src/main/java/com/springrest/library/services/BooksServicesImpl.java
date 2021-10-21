package com.springrest.library.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.springrest.library.model.Books;

 
@Service
public class BooksServicesImpl implements BooksServices {
	
	private RestTemplate restTemplate;

	@Autowired
	public BooksServicesImpl(RestTemplateBuilder restTemplateBuilder) {
		 this.restTemplate = restTemplateBuilder.build();
	}

	public List<Books> getAllBooks() {
		 
		List<Books> list = restTemplate.exchange("http://localhost:9090/books", HttpMethod.GET, null, List.class).getBody();
		return list;
	}

	public String saveBooks(Books book) {
		HttpEntity<Books>  entity = new HttpEntity<>(book);	
		return restTemplate.exchange("http://localhost:9090/books", HttpMethod.POST, entity, String.class).getBody();	
	}
	public Books getBookById(long id) {
		Books book = restTemplate.exchange("http://localhost:9090/books/"+id, HttpMethod.GET ,null, Books.class).getBody();
 		return book;
	}

	public String deleteBookById(long id) {
		return restTemplate.exchange("http://localhost:9090/books/"+id, HttpMethod.DELETE ,null, String.class).getBody();
		
	}

}
