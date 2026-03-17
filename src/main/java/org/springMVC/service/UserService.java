package org.springMVC.service;

import java.util.List;

import org.springMVC.model.User;

public interface UserService {

	public String regUser(User user);
	public List<User> display();
	public void delete(int id);
	public List<User> search(int id);
}
