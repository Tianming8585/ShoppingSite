package com.Shopping;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import javax.jdo.annotations.Unique;

@PersistenceCapable
public class Order {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	Long id;

	@Unique
	@Persistent
	String username;

	@Persistent
	List<Long> orderList;
	@Persistent
	List<Integer> amount;

	@Persistent
	private Date date;

	public Order(String username, List<Long> orderList, List<Integer> amount) {
		super();
		this.username = username;
		this.orderList = orderList;
		this.amount = amount;
		date = Calendar.getInstance().getTime();
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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

	public List<Long> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<Long> orderList) {
		this.orderList = orderList;
	}

	public List<Integer> getAmount() {
		return amount;
	}

	public void setAmount(List<Integer> amount) {
		this.amount = amount;
	}

}
