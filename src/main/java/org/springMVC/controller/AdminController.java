package org.springMVC.controller;

import org.springMVC.model.City;
import org.springMVC.model.Location;
import org.springMVC.model.Property;
import org.springMVC.model.PropertyDisplay;
import org.springMVC.model.State;
import java.util.List;

import org.springMVC.model.User;
import org.springMVC.service.AdminService;
import org.springMVC.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	AdminService adminService;
	
	@GetMapping("/adminDashboard")
	public String openDashboard(HttpSession session,Model model) {
		
		String adminName=(String)session.getAttribute("un");
		if(adminName==null)
		{
			return "redirect:/";
		}
		model.addAttribute("adminName", adminName);
	    return "adminDashboard";
	}
	
	//logout 
		@GetMapping("/logout")
		public String logout(HttpSession session)
		{
		    session.invalidate(); // session destroy
		    return "redirect:/lg"; // login page
		}
		
		//display user
		@GetMapping("/display")
		@ResponseBody
		public List<User> display()   
		{
			List<User> list=userService.display();
			return list;
		}
		
		//delete user
		@GetMapping("/delete/{id}")
		@ResponseBody
		public String deleteUser(@PathVariable("id") int id)
		{
		userService.delete(id);
		return "User Deleted Successfully";
		}
			//save state
		@ResponseBody
		 @PostMapping("/savestate")
		 public String saveState(@RequestBody State state)
		  {
		     return adminService.saveState(state) ;
		   }
		
		@GetMapping("/states")
		@ResponseBody
		public List<State> getStates()
		{
		return adminService.getStates();
		}

		@PostMapping("/addCity")
		public String addCity(City c) {
		adminService.addCity(c);
		return "redirect:/admin/adminDashboard";
		}
		
		
		
		@GetMapping("/cities/{statecode}")
		@ResponseBody
		public List<City> getCities(@PathVariable("statecode") int statecode){
		    return adminService.getCities(statecode);
		}


		
		@GetMapping("/locations/{locationcode}")
		@ResponseBody
		public List<Location> getLocations(@PathVariable("locationcode") int locationcode){
		    return adminService.getLocations(locationcode);
		}
		
		@PostMapping("/addLocation")
		@ResponseBody
		public String addLocation(@RequestParam String locationname,
		                          @RequestParam int cid){

		adminService.addLocation(locationname,cid);

		return "Location Added Successfully";

		}
		
		@PostMapping("/saveLocation")
		@ResponseBody
		public String saveLocation(@RequestBody Location loc)
		{
		    adminService.saveLocation(loc);
		    return "Location Added Successfully";
		}
		
		//saveProperty
		@PostMapping("/saveProperty")
		@ResponseBody
		public String saveProperty(@RequestBody Property p)
		{
		    adminService.saveProperty(p);
		    return "Property Added Successfully";
		}
		
		//display properties
		@GetMapping("/properties")
		@ResponseBody
		public List<PropertyDisplay> getAllProperty(){

		return adminService.getAllProperty();

		}
		
		//serach city
		 @GetMapping("/search/{city}")
		    @ResponseBody
		    public List<Property> search(@PathVariable("city") String city){
		        return adminService.searchProperty(city);
		    }
		
		 //delete proprty list
		 
		 @DeleteMapping("/delete/{id}")
		 @ResponseBody
		 public String deleteProperty(@PathVariable("id") int id){
		     adminService.deleteProperty(id);
		     return "Property Deleted Successfully";
		 }
}