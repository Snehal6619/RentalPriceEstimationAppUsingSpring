package org.springMVC.repo;

import java.util.List;
import java.util.Map;

import org.springMVC.model.Property;
import org.springMVC.model.User;

public interface UserRepo {

	public User findByUserName(String username);
	public boolean existsByUsername(String username);
	public int save(User user);
	public List<User> display();
	public void delete(int id);
	public List<User> search(int id);
	public List<Map<String, Object>> getStates();
	public List<Map<String, Object>> getCities(int statecode);
	 public List<Map<String, Object>> getLocations(int cid);
	 public int saveProperty(Map<String,Object> data);
		public List<Property> getAllProperties();
}
