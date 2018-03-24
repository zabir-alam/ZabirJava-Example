package com.ven.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.ven.dao.LocationDAO;
import com.ven.model.Location;
import com.ven.model.LocationDTO;
import com.ven.utill.JsonUtill;

@Service
public class LocationServiceImpl implements LocationService {
	@Autowired
	private LocationDAO dao;

	@Override
	public String saveLocation(Location loc) {
		LocationDTO dto=new LocationDTO();
		dto.setStatus("FAILURE");
		dto.setMsg("Registration Failure ! Please try Again");
		try{
		int id=dao.saveLocation(loc);
		if(id>0)
			dto.setStatus("SUCCESS");
		dto.setMsg(" Location Details Inserted Successfully with Id "+id);
		String jsonData=JsonUtill.convertJavaToJson(loc);
		dto.setData(jsonData);
		}catch (DataAccessException e) {
			dto.setStatus("FAILURE");
			dto.setMsg("Registration Failure ! Please try Again");
		}
		return JsonUtill.convertJavaToJson(dto);
	}

	@Override
	public String deleteLoc(int locId) {
		LocationDTO dto=new LocationDTO();
		dto.setStatus("FAILURE");
		dto.setMsg("Registration Failure ! Please try Again");
		try{
		dao.deleteLoc(locId);
		dto.setStatus("SUCCESS");
		dto.setMsg(locId + " id location is deleted");
		
		}catch (DataAccessException e) {
			dto.setStatus("FAILURE");
			dto.setMsg("You Can not deleted ! Please try Again");
		}
		return JsonUtill.convertJavaToJson(dto);
		}

	@Override
	public void updateLoc(Location loc) {
		
		dao.updateLoc(loc);
	}

	@Override
	public String getLoc(int locId) {
		Location loc= new Location();
		LocationDTO dto=new LocationDTO();
		dto.setStatus("FAILURE");
		dto.setMsg("Registration Failure ! Please try Again");
		try{
						loc=dao.getLoc(locId);
		dto.setStatus("SUCCESS");
		
		}catch (DataAccessException e) {
			dto.setStatus("FAILURE");
			dto.setMsg("You Can not deleted ! Please try Again");
		}
		return JsonUtill.convertJavaToJson(loc);
		}

	@Override
	public String getAllLoc() {
		LocationDTO dto=new LocationDTO();
		dto.setStatus("FAILURE");
		dto.setMsg("Data not found  ! Please try Again");
		ArrayList<Location>list=new ArrayList<Location>();
		try{
			list=(ArrayList<Location>) dao.getAllLoc();
		if(list!=null)
			dto.setStatus("SUCCESS");
		dto.setMsg(" All Location Details are ");
		String jsonData=JsonUtill.convertJavaToJson(list);
		dto.setData(jsonData);
		}catch (DataAccessException e) {
			dto.setStatus("FAILURE");
			dto.setMsg(" Data not found   ! Please try Again ");
		}
		return JsonUtill.convertJavaToJson(list);
		 
	}

}
