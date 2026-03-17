package org.springMVC.service;
import java.util.List;

import org.springMVC.model.City;
import org.springMVC.model.Location;
import org.springMVC.model.Property;
import org.springMVC.model.PropertyDisplay;
import org.springMVC.model.State;
import org.springMVC.repo.AdminRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminRepo adminRepo;

	public String saveState(State state) {

		boolean b = adminRepo.existsByStatename(state.getStatename());
		if (b == true) {
			return "statename already present please try another statename";
		}
		int v = adminRepo.saveState(state);
		if (v > 0) {
			return "State save sucessfully";
		} else {
			return "some problem is here";
		}
	}

	public List<State> getStates() {
		return adminRepo.getStates();
	}
	
	
	public List<City> getCities(int statecode){
		return adminRepo.getCities(statecode);
		}
	
	public void addCity(City c){
				adminRepo.addCity(c);
		}

	public void addLocation(Location l){
		adminRepo.addLocation(l);
		}

	@Override
	public void addLocation(String locationname, int cid) {
	
		adminRepo.addLocation(locationname, cid);
	}

	@Override
	public void saveLocation(Location loc) {
		
		adminRepo.saveLocation(loc);
		
	}

	@Override
	public List<Location> getLocations(int locationcode) {
		// TODO Auto-generated method stub
		return adminRepo.getLocations(locationcode);
	}

	@Override
	public void saveProperty(Property p) {
	adminRepo.saveProperty(p);	
	}

	@Override
	public List<PropertyDisplay> getAllProperty() {
		// TODO Auto-generated method stub
		return adminRepo.getAllProperty();
	}

	@Override
	public List<Property> searchProperty(String city) {
		// TODO Auto-generated method stub
		return adminRepo.searchProperty(city);
	}
	
	@Override
	public void deleteProperty(int id) {
	    adminRepo.deleteProperty(id);
	}


}
