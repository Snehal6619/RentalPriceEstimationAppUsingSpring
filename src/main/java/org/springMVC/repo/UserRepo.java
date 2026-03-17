package org.springMVC.repo;

import java.util.List;

import org.springMVC.model.User;

public interface UserRepo {

	public User findByUserName(String username);
	public boolean existsByUsername(String username);
	public int save(User user);
	
	public List<User> display();
	public void delete(int id);
	public List<User> search(int id);
}
