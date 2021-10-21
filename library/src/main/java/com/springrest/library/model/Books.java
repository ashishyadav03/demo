package com.springrest.library.model;

public class Books {

	private long bookCode;
	private String bookName;
	private String author;
	private String addedOn;
	
	
	public Books() {
		super();
 	}


	public Books(long bookCode, String bookName, String author, String addedOn) {
		super();
		this.bookCode = bookCode;
		this.bookName = bookName;
		this.author = author;
		this.addedOn = addedOn;
	}


	public long getBookCode() {
		return bookCode;
	}


	public void setBookCode(long bookCode) {
		this.bookCode = bookCode;
	}


	public String getBookName() {
		return bookName;
	}


	public void setBookName(String bookName) {
		this.bookName = bookName;
	}


	public String getAuthor() {
		return author;
	}


	public void setAuthor(String author) {
		this.author = author;
	}


	public String getAddedOn() {
		return addedOn;
	}


	public void setAddedOn(String addedOn) {
		this.addedOn = addedOn;
	}
	
	
}

