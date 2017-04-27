package com.Shopping;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import javax.jdo.annotations.Unique;

@PersistenceCapable
public class Session {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	Long id;

	@Unique
	@Persistent
	String username;

	@Persistent
	String authentication;

	public Session(String username, String authentication) {
		super();
		this.username = username;
		this.authentication = authentication;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAuthentication() {
		return authentication;
	}

	public void setAuthentication(String authentication) {
		this.authentication = authentication;
	}

}