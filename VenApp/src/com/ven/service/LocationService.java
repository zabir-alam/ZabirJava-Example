package com.ven.service;

import java.util.List;

import com.ven.model.Location;

public interface LocationService {
	public String saveLocation(Location loc);
	public String deleteLoc(int locId);
	public void updateLoc(Location loc);
	
	public String getLoc(int locId);
	public String getAllLoc();

}
