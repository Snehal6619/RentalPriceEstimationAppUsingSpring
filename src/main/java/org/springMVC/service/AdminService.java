package org.springMVC.service;

import org.springMVC.model.City;
import org.springMVC.model.Location;
import org.springMVC.model.Property;
import org.springMVC.model.PropertyDisplay;
import org.springMVC.model.State;
import java.util.List;

public interface AdminService {

	public String saveState(State state);
	List<State> getStates();
	public List<City> getCities(int statecode);
	public void addCity(City c);
	public void addLocation(Location l);
	public void addLocation(String locationname,int cid);
	public void saveLocation(Location loc);
	public List<Location> getLocations(int locationcode);
	public void saveProperty(Property p);
	
	public List<PropertyDisplay> getAllProperty();
	public List<Property> searchProperty(String city);
	public void deleteProperty(int id);

}
