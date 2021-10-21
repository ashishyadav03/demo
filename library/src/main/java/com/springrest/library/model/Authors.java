package com.springrest.library.model;

public class Authors {

 	private long authorId;
	private String authorName;
	
	public Authors() {
		super();
 	}

	public Authors(long authorId, String authorName) {
		super();
		this.authorId = authorId;
		this.authorName = authorName;
	}

	public long getAuthorid() {
		return authorId;
	}

	public void setAuthorid(long authorid) {
		this.authorId = authorid;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	
	 
	
	
}

