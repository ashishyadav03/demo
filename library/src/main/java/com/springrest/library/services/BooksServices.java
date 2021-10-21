package com.springrest.library.services;

import java.util.List;

import com.springrest.library.model.Books;

 
public interface BooksServices {

	public List<Books> getAllBooks();
	public String saveBooks(Books book);
	public Books getBookById(long id);
	public String deleteBookById(long id);
}
