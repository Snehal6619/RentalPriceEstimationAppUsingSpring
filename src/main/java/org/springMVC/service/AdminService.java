package org.springMVC.service;

import org.springMVC.model.City;
import org.springMVC.model.Inquiry;
import org.springMVC.model.Location;
import org.springMVC.model.Property;
import org.springMVC.model.PropertyDisplay;
import org.springMVC.model.State;
import java.util.List;

public interface AdminService {

	public String saveState(State state);
	List<State> getStates();
	public List<City> getCities(int statecode);
	public List<Location> getLocations(int cid);
	public void addCity(City c);
	public void addLocation(String locationname,int cid);
	public void saveLocation(Location loc);

	public void saveProperty(Property p);

	public List<PropertyDisplay> getAllProperty();
	
	public List<Property> searchProperty(String city);
	public void deleteProperty(int id);


	 public Property getPropertyById(int id);
	 public boolean updateProperty(Property p);
	 
	 public String saveInquiry(Inquiry inquiry);
	 public List<Inquiry> getAllInquiries();
}
