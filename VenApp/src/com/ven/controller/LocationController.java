package com.ven.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ven.model.Location;
import com.ven.service.LocationService;

@Controller
public class LocationController {
	
	public LocationController() {
	
		super();
		System.out.println("Constructor in Controller");
	}
	@Autowired
	private LocationService service;
	
	@RequestMapping(value="/locReg")
	public String showPage(){
		
		System.out.println("check1");
		return "locReg";
	}
	@RequestMapping(value="/insert", method=RequestMethod.POST,produces="application/json")
	@ResponseBody
	public String saveLocation(@ModelAttribute Location location){
		
		String jsonResponce=service.saveLocation(location);		
		return jsonResponce;
	}
	@RequestMapping(value="/deleteLoc",produces="application/json")
	@ResponseBody
	public String deleteLoc(@RequestParam("locId") int locId){
		String jsonResponse=service.deleteLoc(locId);
		return jsonResponse;
	}
	/*@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateLoc(@ModelAttribute("location") Location loc){
		service.updateLoc(loc);
		return "redirect:allLocDetails";
	}*/
	@RequestMapping(value="/updateLoc",method=RequestMethod.PUT)
	@ResponseBody
	public String getLoc(@RequestParam("locId") int locId, @ModelAttribute Location location){
		String jsonResponse="";
		jsonResponse=service.getLoc(locId);
		service.updateLoc(location);
		return jsonResponse;
	}
	@RequestMapping(value="/allLocDetails",produces="application/json")
	@ResponseBody
	public String  getAllLoc(){
		String jsonResponce=service.getAllLoc();
		return jsonResponce;
	}


}
