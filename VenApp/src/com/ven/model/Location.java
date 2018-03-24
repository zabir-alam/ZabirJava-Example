package com.ven.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "loc")
public class Location {

	@Id
	private int locId;
	private String locName;
	private String locType;

	public int getLocId() {
		return locId;
	}

	public void setLocId(int locId) {
		this.locId = locId;
	}

	public String getLocName() {
		return locName;
	}

	public void setLocName(String locName) {
		this.locName = locName;
	}

	public String getLocType() {
		return locType;
	}

	public void setLocType(String locType) {
		this.locType = locType;
	}

	public Location(int locId, String locName, String locType) {
		super();
		this.locId = locId;
		this.locName = locName;
		this.locType = locType;
	}

	public Location() {
		super();
	}

	public Location(int locId) {
		super();
		this.locId = locId;
	}

	@Override
	public String toString() {
		return "Location [locId=" + locId + ", locName=" + locName
				+ ", locType=" + locType + "]";
	}

}
