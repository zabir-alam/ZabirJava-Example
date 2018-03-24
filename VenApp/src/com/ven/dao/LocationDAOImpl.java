package com.ven.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.ven.model.Location;
@Repository
public class LocationDAOImpl implements LocationDAO {
	@Autowired
	private HibernateTemplate ht;

	@Override
	public int saveLocation(Location loc) {
		// TODO Auto-generated method stub
		return (Integer) ht.save(loc);		
	}

	@Override
	public void deleteLoc(int locId) {
		Location loc=new Location(locId);
		ht.delete(loc);

	}

	@Override
	public void updateLoc(Location loc) {
		ht.update(loc);

	}

	@Override
	public Location getLoc(int locId) {
		
		return ht.get(Location.class, locId);
	}

	@Override
	public List<Location> getAllLoc() {
		
		return ht.loadAll(Location.class);
	}

}
