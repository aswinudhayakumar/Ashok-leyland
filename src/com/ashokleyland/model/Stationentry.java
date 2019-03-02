package com.ashokleyland.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="staitonentry")
public class Stationentry {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="station")
	private String station;
	
	@Column(name="date")
	private String date;
	
	@Column(name="shift")
	private String shift;
	
	@Column(name="count")
	private String count;
	
	@Column(name="description")
	private String description;
	
	@Column(name="enteredby")
	private String enteredby;
	
	@Column(name="uid")
	private String uid;
	
	@Column(name="fault")
	private String fault;
	
	public String getFault() {
		return fault;
	}

	public void setFault(String fault) {
		this.fault = fault;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStation() {
		return station;
	}

	public void setStation(String station) {
		this.station = station;
	}

	
	
	public String getShift() {
		return shift;
	}

	public void setShift(String shift) {
		this.shift = shift;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEnteredby() {
		return enteredby;
	}

	public void setEnteredby(String enteredby) {
		this.enteredby = enteredby;
	}

	public Stationentry() {
	}

	public Stationentry(String station, String date, String shift, String count, String description, String enteredby, String uid, String fault) {
		this.station = station;
		this.date = date;
		this.shift = shift;
		this.count = count;
		this.description = description;
		this.enteredby = enteredby;
		this.uid = uid;
		this.fault = fault;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}


	
	
	
}