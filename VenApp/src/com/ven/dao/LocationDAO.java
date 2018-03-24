package com.ven.dao;

import java.util.List;

import com.ven.model.Location;

public interface LocationDAO {
	public int saveLocation(Location loc);
	public void deleteLoc(int locId);
	public List<Location> getAllLoc();  
	
	public void updateLoc(Location loc);
	public Location getLoc(int locId);

	

}
