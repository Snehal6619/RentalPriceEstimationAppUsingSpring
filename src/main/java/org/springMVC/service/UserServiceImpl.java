package org.springMVC.service;

import java.util.List;
import java.util.Map;

import org.springMVC.model.Property;
import org.springMVC.model.User;
import org.springMVC.repo.AdminRepoImpl;
import org.springMVC.repo.UserRepoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class UserServiceImpl implements UserService{

	 BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	@Autowired
	UserRepoImpl userRepo;
	 
	@Autowired
	AdminRepoImpl adminRepo;
	
	@Override
	public String regUser(User user) {
		
		boolean b=userRepo.existsByUsername(user.getUsername());
		if(b==true)
		{
			return "username already present please try another username";
		}
		//ram ->user ->replace ->encrpt ->user
		user.setPassword(encoder.encode(user.getPassword()));
		//user taklela password incript zala ani tu user password madhe convert
		int v=userRepo.save(user);  //101 ram encript from 
		if(v>0)
		{
			return "user regeration sucessfully";
		}
		else {
			return "some problem is here";
		}
	}

	public String loginUser(User user,HttpSession session)
	{
		User userDb=userRepo.findByUserName(user.getUsername());
		if(userDb==null)
		{
			return "username is incorrect please try correct";
		}
		
		if(encoder.matches(user.getPassword(), userDb.getPassword()))
		{
			session.setAttribute("un",userDb.getUsername());
			session.setAttribute("ue",userDb.getEmail());
			session.setAttribute("uc",userDb.getContact());
			if ("ADMIN".equals(userDb.getRole())) {
                return "Admin Login Success";
            } else {
                return "User Login Success";
            }
		}
		else {
			return "password is incorrect";
		}
	}

	@Override
	public List<User> display() {
		
		List<User> list = userRepo.display();

	    if(list.isEmpty()) {
//	    	logger.error("No employee data in database");
//	        throw new EmpNotFound("No employees found in database");
	    	
	    }
		return userRepo.display();
	}

	@Override
	public void delete(int id) {
	
		List<User> list=userRepo.search(id);
		if(list.isEmpty())
		{
//			logger.error("emp id not found");
//			throw new EmpNotFound("Emp not found with eid ="+eid);
		}
		 userRepo.delete(id);
		
	}

	@Override
	public List<User> search(int id) {
		List<User> list=userRepo.search(id);
		if(list.isEmpty())
		{
//			throw new EmpNotFound("Emp not found with eid ="+eid);
		}
		return userRepo.search(id);
	}
	
	@Override
	public List<Map<String,Object>> getStates(){
		return userRepo.getStates();
		}

	@Override
		public List<Map<String,Object>> getCities(int statecode){
		return userRepo.getCities(statecode);
		}

	@Override
		public List<Map<String,Object>> getLocations(int cid){
		return userRepo.getLocations(cid);
		}

	@Override
		public int saveProperty(Map<String,Object> data){
		return userRepo.saveProperty(data);
		}

	//predict
			@Override
			public Property predictPrice(Property input){

			    List<Property> list = userRepo.getAllProperties();

			    int n = list.size();

			    double sumPrice = 0;
			    double sumArea = 0, sumBed = 0, sumBath = 0, sumMetro = 0, sumParking = 0;

			    for(Property p : list){
			        sumPrice += p.getPrice();
			        sumArea += p.getArea_sqft();
			        sumBed += p.getBedrooms();
			        sumBath += p.getBathrooms();
			        sumMetro += p.getMetro_distance();
			        sumParking += (p.isParking() ? 1 : 0);
			    }

			    // Averages
			    double avgPrice = sumPrice / n;
			    double avgArea = sumArea / n;
			    double avgBed = sumBed / n;
			    double avgBath = sumBath / n;
			    double avgMetro = sumMetro / n;
			    double avgParking = sumParking / n;

			    double parkingVal = input.isParking() ? 1 : 0;

			    // Normalized calculation
			    double predicted =
			            avgPrice *
			            (input.getArea_sqft() / avgArea * 0.4 +
			             input.getBedrooms() / avgBed * 0.2 +
			             input.getBathrooms() / avgBath * 0.15 +
			             (avgMetro / (input.getMetro_distance()==0?1:input.getMetro_distance())) * 0.15 +
			             parkingVal * 0.1);

			    input.setPrice((int)predicted);

			    return input;
			}

}